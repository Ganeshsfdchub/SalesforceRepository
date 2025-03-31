public class UpsertRecord 
{
    public static void UpsertRecordMethod()
    {
        List<Account> lstAccounts = new List<Account>();
        
        // Create a new account
        Account acc = new Account();
        acc.Name = 'Prashanth';
        acc.Industry = 'Chemicals';
        acc.Rating = 'warm';
        acc.Phone = '779966556';
        
        lstAccounts.add(acc);
        
        // Query existing accounts with Rating 'Hot'
        List<Account> existingAccounts = [SELECT Id, Name, Industry, Rating, Active__c 
                                          FROM Account WHERE Rating = 'Hot'];
        
        // Update the rating of existing accounts and add them to the list
        for(Account existingAcc : existingAccounts) 
        {
            existingAcc.Rating = 'Warm';
            
            lstAccounts.add(existingAcc);
        }
        
        // Upsert the accounts
        if (!lstAccounts.isEmpty()) 
        {
            upsert lstAccounts;
        }
    }
}