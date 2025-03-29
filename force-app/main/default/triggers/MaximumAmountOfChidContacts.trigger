trigger MaximumAmountOfChidContacts on Contact (after update) 
{
    if(trigger.isAfter && trigger.isUpdate)
    {
        Set<Id> accIdSet = new Set<Id>();
        
        // Gather the Account IDs of the updated Contacts and their old Account IDs if changed
        for(Contact newCon : Trigger.new)
        {
            accIdSet.add(newCon.AccountId); // New Account ID
            
            Contact oldCon = Trigger.oldMap.get(newCon.Id);
            
            if (oldCon.AccountId != null && newCon.AccountId != oldCon.AccountId)
            {
                accIdSet.add(oldCon.AccountId); // Old Account ID
            }
        }
        
        // Query Accounts and their related Contacts
        List<Account> accAndConRecords = [SELECT Id, Name, Max_Contact_Amount__c,
                                          (SELECT Id, LastName, Amount__c FROM Contacts)
                                          FROM Account WHERE Id IN :accIdSet];
        
        // Update the Maximum_Of_Contacts_Amount__c field for each Account
        for (Account acc : accAndConRecords)
        {
            Decimal maxOfAmount = 0;
            
            // Find the maximum Amount__c for each Contact under this Account
            for (Contact con : acc.Contacts)
            {
                if (con.Amount__c != null && con.Amount__c > maxOfAmount)
                {
                    maxOfAmount = con.Amount__c;
                }
            }
            
            // Update the Account's Maximum_Of_Contacts_Amount__c field
            acc.Max_Contact_Amount__c = maxOfAmount;
        }
        
        // Update the Accounts in the database
        if (!accAndConRecords.isEmpty())
        {
            update accAndConRecords;
        }
    }
}