@RestResource(URLMapping='/SearchCaseService/*')
Global class CaseService 
{
   @HttpGet()
   Global static List<case> GetAccountsByIndustry()
   {
     map<string, string> inputparams = RestContext.Request.Params;
      
      List<case> lstcase = [Select id, caseNumber, status, type, priority, origin,Reason, Subject, 
                                   Description from case where priority=:inputparams.get('mypriority')];
       
      return lstcase;
   }
}