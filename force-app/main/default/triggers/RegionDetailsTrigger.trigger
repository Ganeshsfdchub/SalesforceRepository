trigger RegionDetailsTrigger on NewCustomer__c (before insert, before update) 
{
    if(trigger.isbefore && (trigger.isinsert || Trigger.isUpdate))
    {
        for(NewCustomer__c cust : Trigger.new)
        {
            if(cust.Region_Name__c != null && cust.Region_Name__c != '')
            {
                /* Assign the value of the Region Manager Name field (Region_Manager_Name__c) in the custom object (NewCustomer)
                  The value is retrieved from the custom setting object (RegionDetails__c) based on the Region Name Records(cust.Region_Name__c)
                  GetValues method is used to get the record from the custom setting and then the Region_manager__c field is accessed */ 
                
                cust.Region_Manager_Name__c = RegionDetails__c.GetValues(cust.Region_Name__c).Region_manager__c;
                
                /*   Switch ON cust.Region_Name__c
{
when 'Asia Pacific'
{
cust.Region_Manager_Name__c = 'Suresh Kumar'; 
}
when 'North America'
{
cust.Region_Manager_Name__c = 'David Dodson'; 
}
when 'Europe'
{
cust.Region_Manager_Name__c = 'Ashley James'; 
}
when 'China'
{
cust.Region_Manager_Name__c = 'David lieu'; 
}
when 'Japan'
{
cust.Region_Manager_Name__c = 'Dong lee'; 
}
when 'Middle East'
{
cust.Region_Manager_Name__c = 'Abdul Rehaman'; 
} */
                
                
            }
        }
    }
}