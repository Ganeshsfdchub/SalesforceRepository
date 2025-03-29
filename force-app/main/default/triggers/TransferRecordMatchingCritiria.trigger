trigger TransferRecordMatchingCritiria on Account (before insert, before update) 
{
    if(trigger.isBefore && (Trigger.isupdate || Trigger.isInsert))
    {
        user Customeruser = [select id, username, firstname, lastname, isActive 
                             from user where username ='customerusrs@gmail.com'];
        
        for(Account acc: trigger.new)
        {
            if(acc.rating == 'hot' && acc.annualRevenue >= 50000 && acc.Industry == 'Banking')
            {
                acc.ownerId = Customeruser.id;
            }
        }
    }
}