trigger MinimumAmountOfChidContacts on Contact (After update) 
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
        List<Account> accAndConRecords = [SELECT Id, Name, Min_Contact_Amount__c,
                                          (SELECT Id, LastName, Amount__c FROM Contacts)
                                          FROM Account WHERE Id IN :accIdSet];
        
        // Update the Min_Contact_Amount__c field for each Account
        for (Account acc : accAndConRecords)
        {
            Decimal minOfAmount = null;
            
            // Find the minimum Amount__c for each Contact under this Account
            for (Contact con : acc.Contacts)
            {
                if (con.Amount__c != null)
                {
                    if (minOfAmount == null || con.Amount__c < minOfAmount)
                    {
                        minOfAmount = con.Amount__c;
                    }
                }
            }
            
            // Update the Account's Min_Contact_Amount__c field
            if (minOfAmount != null) 
            {
                acc.Min_Contact_Amount__c = minOfAmount;
            } 
            else 
            {
                acc.Min_Contact_Amount__c = 0;
            }
        }
        
        // Update the Accounts in the database
        if (!accAndConRecords.isEmpty())
        {
            update accAndConRecords;
        }
    }
}