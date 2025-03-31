trigger MakeContactAssociatedToAccount on Contact (before insert) 
{
    if(Trigger.isbefore && (Trigger.isInsert || Trigger.isUpdate))
    {
        for(Contact con : Trigger.new)
        {
            if(con.accountid == null || con.accountid == '') 
            {
                con.addError('Please make the Contact should be Associated to Account');
            } 
        }
    }
}