trigger ContactTrigger on Contact (After insert) 
{
    if(trigger.isAfter && Trigger.isInsert)
    {
        set<Id> updatedids= new set<Id>();
        
        for(Contact con : trigger.New)
        {
            updatedids.add(con.accountid);
        }
        if(!updatedids.isempty())
        {
            list<Account> lstAccounts = [select id, name from account where id IN :updatedids];
            
               
        if(!lstAccounts.isempty())
           {
              list<Account> accountlst = new list<Account>();
                  
              for(Account acc : lstAccounts)
              {
                  for(contact con : Trigger.new)
                  {
                      
                      acc.customfield__c = con.FirstName +' '+con.lastName;
                    
                      accountlst.add(acc);
                  }
              }
               if(! accountlst.isempty())
               {
                   update  accountlst;
               }
           }
           
       }
   }
                     
}