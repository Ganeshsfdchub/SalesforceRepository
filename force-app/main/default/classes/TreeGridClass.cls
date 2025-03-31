public class TreeGridClass 
{
    @AuraEnabled(Cacheable=true)
    public static list<account> TreeGridmethod()
    {
        list<Account> lstAccounts = [select id, name, rating,  industry, annualrevenue, phone, fax,
                                     Active__c,(select id, firstname, lastname, phone, fax from contacts) 
                                     from Account order by name];
        
        return lstAccounts;
    }
}