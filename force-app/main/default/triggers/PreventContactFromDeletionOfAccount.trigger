trigger PreventContactFromDeletionOfAccount on Account (before Delete) 
{
    
    If(trigger.isBefore &&  trigger.isdelete)
    {
        
        list<contact> lstContacts =[select id, firstname, lastname, accountid 
                                    from contact where accountid IN : trigger.oldmap.keyset()];
        
        if(!lstContacts.isempty())
        {
            for(contact con: lstContacts)
            {
                con.AccountId = null; 
            }
            update lstContacts;
        }
        
    }
    
}