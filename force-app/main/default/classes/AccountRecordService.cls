@RestResource(URLMapping = '/AccountsService/*')
Global class AccountRecordService 
{
   @HttpGet()
   Global static list<Account> GetAllAccounts()
   {
      List<Account> lstAccounts = [select id, name, rating, Industry, AnnualRevenue, Phone, Fax,
                                                       Active__c from Account order by name];
       
      return lstAccounts;
   }
}