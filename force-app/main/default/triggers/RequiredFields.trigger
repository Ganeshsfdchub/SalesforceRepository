trigger RequiredFields on Contact (before insert, before Update) 
{
    if(trigger.isBefore && (Trigger.isupdate || Trigger.isInsert))
    {
        RequiredFields.RequiredFieldmethod(Trigger.new);
    } 
}