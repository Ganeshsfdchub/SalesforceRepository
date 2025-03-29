public class insertBulkRecords 
{
    public static void insertBulkRecordsMethod()
    {
        List<Account> lstAccounts = new List<Account>();
        
        for(integer Count = 1 ; Count<=5; Count++)
        {
            Account Acc = new Account();
            
            acc.name = 'Developer'+Count;
            acc.phone ='9959308809';
            acc.Rating ='hot';
            acc.Industry ='Banking';
            
            lstAccounts.add(acc);
        }
        if(!lstAccounts.isempty())
        {
            insert lstAccounts;
        }
    }
}