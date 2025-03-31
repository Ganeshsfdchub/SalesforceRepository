Global class BatchApexUpdaterecord implements Database.Batchable<sobject>
{
    Global database.QueryLocator start(Database.Batchablecontext scope)
    {
        string accounts = 'select id, name, industry, Rating, Phone,'+
                           'fax, Active__c from Account where Industry = \'banking\'';
        
        return Database.getQueryLocator(accounts);
    }
    Global void Execute(Database.Batchablecontext scope, list<Account> lstAccounts)
    {
        
    }
    Global void Finish(Database.Batchablecontext scope)
    {
        
    }
}