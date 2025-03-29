public class updateRecord 
{
    public static void updateRecordMethod()
    {
        list<Account> lstAccounts = [select id, name, industry, Rating, AnnualRevenue 
                                     from Account where Rating ='Hot']; 
        
        if(!lstAccounts.isempty())
        {
            list<Account> Accountlst = new list<Account>();
            
            for(Account acc : lstAccounts)
            {
                acc.Rating = 'warm';
                acc.industry = 'banking';
                
                Accountlst.add(acc);
            }
            if(!Accountlst.isempty())
            {
                update Accountlst;
            }
            
        }
    }
}