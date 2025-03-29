Global class CalculateTotalRevenueBatch implements Database.batchable<Sobject>, Database.stateful
{
    Global Decimal totalAnnualrevenue = 0.0;
    Global Database.QueryLocator start(Database.BatchableContext bcontext)
    {
        string selectAccounts = 'select id, name, annualrevenue, from Account where Annualrevenue != null';
        
        return Database.getqueryLocator(selectAccounts);
    }
    Global void Execute(Database.BatchableContext bcontext, List<Sobject> RecordsToProcess)
    {
        if(!RecordsToProcess.isempty())
        {
            for(Sobject objRecord : RecordsToProcess)
            {
                Account acc = (Account)objRecord;
                
                totalAnnualrevenue = totalAnnualrevenue+acc.Annualrevenue;                      
            } 
        }  
    }
    Global void finish(Database.BatchableContext bcontext)
    {
        system.debug('Batch job id is......'+bcontext.getjobId());
        
        AsyncApexjob jobdetails = [select id, status, TotaljobItems, jobitemsprocessed, 
                                   numberOfErrors, createdby.Email from AsyncApexjob  where id =:bcontext.getjobID()];
        
    }
}