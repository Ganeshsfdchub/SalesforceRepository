trigger sumOfAmountOfContacts on Contact (after update) 
{
    if(trigger.isAfter && trigger.isUpdate)
    {
        Set<Id> accIdSet = new Set<Id>();
        
        // Gather the Account IDs of the updated Contacts and their old Account IDs if changed
        for(Contact newcon : Trigger.new)
        {
            Contact oldCon = Trigger.oldMap.get(newcon.Id);
            
            if (newcon.AccountId != oldCon.AccountId)
            {
                if (newcon.AccountId != null) 
                {
                    accIdSet.add(newcon.AccountId); // New Account ID
                }
                if (oldCon.AccountId != null) 
                {
                    accIdSet.add(oldCon.AccountId); // Old Account ID
                }
            }
        }
        
        // Query Accounts and their related Contacts
        List<Account> accAndConRecords = [SELECT Id, Name, Sum_Of_Contacts_Amount__c,
                                          (SELECT Id, LastName, Amount__c FROM Contacts)
                                          FROM Account WHERE Id IN :accIdSet];        
        
        // Update the Sum_Of_Contacts_Amount__c field for each Account
        for (Account acc : accAndConRecords)
        {
            Decimal sumOfAmount = 0;
            
            // Sum the Amount__c for each Contact under this Account
            for (Contact con : acc.Contacts)
            {
                if (con.Amount__c != null)
                {
                    sumOfAmount += con.Amount__c;
                }
            }
            
            // Update the Account's Sum_Of_Contacts_Amount__c field
            acc.Sum_Of_Contacts_Amount__c = sumOfAmount;
        }
        
        // Update the Accounts in the database
        if (!accAndConRecords.isEmpty())
        {
            update accAndConRecords;
        }
    }
}