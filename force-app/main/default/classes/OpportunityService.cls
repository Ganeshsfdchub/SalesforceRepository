@RestResource(urlMapping='/SearchOpportunitiesService/*')
global class OpportunityService 
{
    
    @HttpGet
    global static List<Opportunity> getOpportunitiesByAccountName() 
    {
        Map<String, String> inputParams = RestContext.request.params;
        
        List<Opportunity> lstOpportunities = [SELECT Id, Name, StageName, Amount, CloseDate, Account.Name 
                                              FROM Opportunity WHERE Account.Name = :inputParams.get('accountName')];
        
        return lstOpportunities;
    }
}