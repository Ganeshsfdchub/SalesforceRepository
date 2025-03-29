public class Imparating 
{
    @AuraEnabled(Cacheable=true)
    public static list<Account> imparatingMethod(string txt)
    {
       List<Account> lstAccounts = [select id, name, industry, rating, Phone, Fax, AnnualRevenue,
                                   Active__c from Account Where name Like :'%'+txt+'%'];
        
        Return lstAccounts;
    }
}