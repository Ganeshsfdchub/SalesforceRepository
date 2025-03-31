trigger UpdateCustomFieldOnApproval on Opportunity (before Update) 
{
    set<id> opportunitiesToUpdate = new set<id>();
    
    if(Trigger.isbefore && Trigger.isUpdate)
    {
        for(Opportunity Newopp : Trigger.new)
        {
            Opportunity oldopp = Trigger.oldmap.get(Newopp.id);
            
        }   
    }
}