trigger CaseEscalationTrigger on Case (before update) 
{
    list<case> lstCase = new list<case>();
    
    integer escalationTime = 24;
    
    if(Trigger.isBefore && Trigger.isUpdate)
    {
        for(case cs : Trigger.New)
        {
            if(!cs.IsClosed && cs.isEscalated && cs.Createddate.addHours(escalationTime)<=system.now()) 
            {
                cs.Priority = 'high';
                cs.isEscalated = true;
                
                lstCase.add(cs);
            }           
        }
        if(!lstCase.isempty())
        {
            update lstCase; 
        }
    }
}