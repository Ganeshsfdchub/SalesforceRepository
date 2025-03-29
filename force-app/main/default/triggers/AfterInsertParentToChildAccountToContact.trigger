trigger AfterInsertParentToChildAccountToContact on Account (after insert) 
{
    if(trigger.isafter && trigger.isInsert)
    {
        list<Contact> lstContacts = new list<contact>();
        list<opportunity> lstopportunities = new list<opportunity>();
        
        for(Account acc : trigger.new)
        {
            contact con = new contact();
            con.lastname = acc.name;
            con.Phone = acc.phone;
            con.Fax = acc.Fax;
            con.AccountId = acc.Id;
            
            lstContacts.add(con);
            
            
            opportunity opp =new opportunity();
            
            opp.Name = acc.name;
            opp.CloseDate = system.today()+3;
            opp.amount = 100000;
            opp.StageName = 'Prospecting';
            opp.AccountId = acc.Id;
            
            lstopportunities.add(opp);
        }
        if(!lstContacts.isempty() && !lstopportunities.isempty())
        {
            insert lstContacts;
            insert lstopportunities;
            
        }
        
    }
}