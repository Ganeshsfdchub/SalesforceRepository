public class UnDeleteRecord 
{
    public static void UndeleteRecordMethod()
    {
        List<Account> accountsToDelete = [SELECT Id, Name, Rating, Industry, Phone, Fax, isdeleted 
                                          FROM Account where Industry = 'Communications' and Rating ='hot' All Rows];
        Undelete accountsToDelete;
    }
}