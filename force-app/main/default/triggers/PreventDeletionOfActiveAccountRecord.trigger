trigger PreventDeletionOfActiveAccountRecord on Account (before delete) 
{
    If(trigger.isBefore &&  trigger.isdelete)
    {
        for(Account acc: trigger.old)
        {
            if(acc.Active__c == 'yes')
            {
                acc.Active__c.adderror('We can not Remove active Account record'); 
            }
        }
    }
}