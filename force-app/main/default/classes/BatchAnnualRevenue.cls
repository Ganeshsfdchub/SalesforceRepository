Global class BatchAnnualRevenue implements Database.Batchable<sobject>,database.stateful
{
    global decimal ToatalAnnualRevenue = 0.0;
    
    Global Database.QueryLocator start(Database.BatchableContext bc)
    {
        string Accountquery = 'select id, name, Rating, Industry, phone, Fax,'+
            'Active__c, AnnualRevenue From Account where AnnualRevenue = 5000000';
        
        return database.getquerylocator(Accountquery);
    }
    Global void  Execute(Database.BatchableContext bc, list<Account> lstAccounts)
    {
        
        if(!lstAccounts.isempty())
        {
            for(Account Acc:lstAccounts) 
            {
                ToatalAnnualRevenue = ToatalAnnualRevenue+acc.AnnualRevenue;
                
            }            
        }
    }
    Global void finish(Database.BatchableContext bc)
    {
        AsyncApexJob jobDetails = [select id, status, totaljobItems, jobitemsprocessed, numberoferrors,
                                   createdby.email from AsyncApexJob where id =: bc.getjobid()];
        
        system.debug('total annual revenue is'+ToatalAnnualRevenue);
    }
}