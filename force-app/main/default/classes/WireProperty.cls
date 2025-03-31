public class WireProperty 
{
    @AuraEnabled(Cacheable=true)
    Public Static list<Account> wirePropertyMerthod()
    {
        list<Account> lstaccounts = [select id, name, industry, rating, AnnualRevenue, Phone, Fax,
                                     Active__c from Account]; 
        return lstaccounts;
    }
}