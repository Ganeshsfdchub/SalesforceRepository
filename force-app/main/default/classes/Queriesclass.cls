public class Queriesclass 
{
    public static void QueriesMethod(string uname)
    {
        
        if(uname != null && uname !='')
        {
            
            list<Account> lstAccounts = [select id, name, industry, Rating, AnnualRevenue, phone, fax, Active__c,
                                         (select id, firstname, lastname, phone, Fax, Email from contacts),
                                         (select id, name, StageName, Amount, closeDate from opportunities),
                                         (select id, casenumber, priority, origin, reason, subject from cases)
                                         from Account where name =: uname];
            
            system.debug('collection size'+lstAccounts.size());
            
            if(!lstAccounts.isempty())
            {
                for(Account acc: lstAccounts)
                {
                    system.debug('Account Record is.....'+acc);
                    
                    
                     system.debug('................................');
                    
                    
                    // Get the Related contacts
                    system.debug('collection size'+acc.contacts.size());
                    
                    for(contact con : acc.contacts)
                    {
                        system.debug('Account Record is.....'+con); 
                    }
                    
                    
                     system.debug('................................');
                    
                    
                    
                    // Get the Related opportunities
                    system.debug('collection size'+acc.opportunities.size()); 
                    
                    for(opportunity opp : acc.opportunities)
                    {
                        system.debug('Account Record is.....'+opp); 
                    }
                    
                    
                     system.debug('................................');
                    
                    // Get the Related opportunities
                    system.debug('collection size'+acc.cases.size()); 
                    
                    for(case cs : acc.cases)
                    {
                        system.debug('case record is....'+cs);
                    }
                }
            }
        }
    }      
}