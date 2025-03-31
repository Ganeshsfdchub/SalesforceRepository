public class WireService 
{
    @AuraEnabled(Cacheable=true)
    public static list<Account> wireMethod()
    {
        list<Account> lstAccounts = [select id, name, industry, AnnualRevenue, Rating, phone, Fax,
                                     Active__c from Account order by name];
        return lstAccounts;
    }
}