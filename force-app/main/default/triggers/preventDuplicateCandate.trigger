trigger preventDuplicateCandate on Account (before insert, before Update) 
{
    if(trigger.isbefore && (Trigger.isInsert || Trigger.isUpdate))
    {
        for(Account acc : Trigger.new)
        {
            Integer RecordCount = [select Count() from Account where name =: acc.name and rating =:acc.rating]; 
            
            if(RecordCount>0)
            {
                acc.name.adderror('same name and Rating Already Exist');
                acc.rating.adderror('same name and rating Already Exist');
            }  
        }
        
    }
}