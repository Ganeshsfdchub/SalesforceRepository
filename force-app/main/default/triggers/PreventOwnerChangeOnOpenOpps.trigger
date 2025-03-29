trigger PreventOwnerChangeOnOpenOpps on Account (before update) 
{
    // Step 1: Create a set to store account IDs with changed owners
    Set<Id> updatedlstAccountIds = new Set<Id>();
    
    if (Trigger.isBefore && Trigger.isUpdate) 
    {
        // Step 2: Iterate through the accounts being updated
        for (Account newRecord : Trigger.New)
        {
            Account oldRecord = Trigger.oldMap.get(newRecord.Id);
            
            // Step 3: Check if the owner is being changed
            if (newRecord.OwnerId != oldRecord.OwnerId) 
            {
                updatedlstAccountIds.add(newRecord.Id);
            }
        }
        
        // Step 4: If there are accounts with changed owners
        if (!updatedlstAccountIds.isEmpty()) 
        {
            // Step 5: Query for accounts with open opportunities
            List<Account> accountList = [SELECT Id, Name, (SELECT Id FROM Opportunities WHERE 
                                                           StageName != 'Closed Won' AND StageName != 'Closed Lost')
                                         FROM Account WHERE Id IN :updatedlstAccountIds];
            
            // Step 6: Collect Account IDs with Open Opportunities
            Set<Id> accountIdsWithOpenOpps = new Set<Id>();
            
            for (Account acc : accountList) 
            {
                if (acc.Opportunities.size() > 0) 
                {
                    accountIdsWithOpenOpps.add(acc.Id);
                }
            }
            
            // Step 7: Prevent Owner Change for Accounts with Open Opportunities
            for (Account newRecord : Trigger.New) 
            {
                if (accountIdsWithOpenOpps.contains(newRecord.Id)) 
                {
                    newRecord.OwnerId.addError('Owner cannot be changed because there are open Opportunities.');
                }
            }
        }
    }
}