trigger AfterUpdateParentToChildAccountContact on Account (After insert, After update) 
{
    set<Id> Updatedids = new Set<id>();
    
    if(Trigger.isAfter && (Trigger.isinsert || Trigger.isUpdate))
    {
        for(Account NewFields: trigger.new)
        {
            Account OldFields = trigger.oldmap.get(NewFields.id);
            
            if((NewFields.name != OldFields.name)||
               (NewFields.phone != OldFields.Phone)||
               (NewFields.Rating != OldFields.Rating)||
               (NewFields.Industry != OldFields.Industry))
            {
                Updatedids.add(NewFields.id);
            }
        }
        if(!Updatedids.isempty())
        {
            list<contact> lstContacts = [select id, firstname, lastname, phone, fax,
                                         Accountid from contact where accountId IN :Updatedids]; 
            if(!lstContacts.isempty())
            {
                List<contact> lstconts = new List<contact>();
                
                for(Contact con:lstContacts)
                {
                    for(Account acc: Trigger.new)
                    {
                        con.lastName = acc.Name;
                        con.Phone = acc.Phone;
                        con.Fax = acc.Fax; 
                        
                        lstconts.add(con);
                    }
                }
                if(!lstconts.isempty())
                {
                    update lstconts;
                }
            } 
        }
        
    }
}