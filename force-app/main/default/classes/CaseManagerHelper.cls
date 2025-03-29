@RestResource(URLMapping='/CaseDetailService/*')
Global class CaseManagerHelper 
{
   @HttpGet()
   Global static case GetcaseRecordByNumber()
   {
      Map<string, string>  inputParams = Restcontext.Request.params;
       
      case CaseRecord = [select id, caseNumber, status, priority, origin, reason, subject, Description
                                                          from case where CaseNumber =:inputParams.get('cNumber')];
      return CaseRecord;
   }
}