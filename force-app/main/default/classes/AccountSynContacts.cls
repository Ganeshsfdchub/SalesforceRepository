public class AccountSynContacts  
{
    Public Static void AccountSynContactsMethod(Map<id, Account> newlstAccounts, Map<id, Account> oldlstAccounts)
    {
        Set<id> UpdatedIds = new Set<id>();
        
        for(Account newrecord: newlstAccounts.values())
        {
            Account oldrecord = oldlstAccounts.get(newrecord.Id);
            
            
            if(( newrecord.Phone != oldrecord.Phone)||
               ( newrecord.Fax != oldrecord.Fax)||
               ( newrecord.Billingstreet !=  oldrecord.Billingstreet)||
               ( newrecord.Billingcity != oldrecord.Billingcity)||
               ( newrecord.Billingstate != oldrecord.Billingstate)||
               ( newrecord.BillingCountry != oldrecord.BillingCountry)||
               ( newrecord.BillingPostalCode != oldrecord.BillingPostalCode))
            {
                UpdatedIds.add( newrecord.id); 
            }
        }
        
        list<contact> lstcontacts = [select id, firstname, lastname from contact
                                     where Accountid IN : UpdatedIds];
        
        if(!lstcontacts.isempty())
        {
            list<Contact> lstconts = new list<Contact>();
            
            for(Contact con:lstcontacts)
            {
                // Account acc = trigger.newmap.get(con.Accountid); OR
                
                for(Account acc : newlstAccounts.values())
                {
                    con.Phone = acc.Phone;
                    con.Fax = acc.Fax;
                    con.mailingStreet = acc.Billingstreet;
                    con.mailingcity = acc.Billingcity;
                    con.mailingState = acc.Billingstate;
                    con.mailingCountry = acc.BillingCountry;
                    con.mailingPostalCode = acc.BillingPostalCode;
                    
                    lstconts.add(con);    
                }
                if(!lstconts.isempty())
                {
                    update lstconts;
                }
            }
        } 
        
    }
}