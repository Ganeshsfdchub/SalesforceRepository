Global Class ScheduleApex implements Schedulable
{
    Global Void Execute(SchedulableContext Scope)
    {
        Account acc = new Account();
        
        acc.Name = 'Ganesh';
        acc.rating = 'Hot';
        acc.Industry ='Banking';
        acc.phone ='9959308808';
        acc.Fax ='321456';
        acc.Active__c ='yes';
        
        insert acc;
    }
}