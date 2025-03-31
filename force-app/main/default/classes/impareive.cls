public class impareive 
{
    @AuraEnabled(Cacheable=true)
    public static List<Account> imparativeMethod(string txt)
    {
        list<Account> lstAccounts = [select id, name, Rating, Industry, phone, Fax, Active__c, Annualrevenue 
                                                                 from Account where Name like :'%'+txt+'%'];
        
        return lstAccounts;
    }
}