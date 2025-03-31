public class wireclass 
{
    @AuraEnabled(cacheable=true)
    public static List<Contact> Mywiremethod() 
    {
        // Query to retrieve the related Account Name
        List<Contact> lstcontacts = [SELECT Id, FirstName, LastName, Email, Phone, Fax, Account.Name, 
                                                                             AccountId FROM Contact];

        return lstcontacts;
    }
}