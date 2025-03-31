public class DeleteRecords 
{
    public static void DeleteRecordsMethod()
    {
        list<account> lstAccounts = [select id, name, industry, Rating, Phone, fax from Account];
        if(!lstAccounts.isempty())
        {
           delete lstAccounts;
        }
    }
}