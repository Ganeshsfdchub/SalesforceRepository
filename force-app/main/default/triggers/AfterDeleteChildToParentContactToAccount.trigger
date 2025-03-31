trigger AfterDeleteChildToParentContactToAccount on Contact (before Delete) 
{
    set<id> DeletingIds = new Set<id>();
    
    if(trigger.isbefore && trigger.isdelete)
    {
        for(contact con : trigger.old)
        {
            DeletingIds.add(con.AccountId);
        }
        
        list<Account> lstAccounts = [select id, name, industry, Rating, Phone, 
                                     Fax from Account where id IN :DeletingIds];
        
        if(!lstAccounts.isempty())
        {
            delete lstAccounts;
        }
    }
}