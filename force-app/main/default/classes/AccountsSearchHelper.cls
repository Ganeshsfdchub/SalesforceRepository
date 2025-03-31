@RestResource(URLMapping='/SearchAccountsService/*')
Global class AccountsSearchHelper 
{
   @HttpGet()
   Global static List<Account> GetAccountsByIndustry()
   {
     map<string, string> inputparams = RestContext.Request.Params;
      
      List<Account> lstAccounts = [select id, name, rating, Industry, AnnualRevenue, Phone, Fax,
                                                       Active__c from Account where industry =:inputparams.get('myindutsry')];
       
      return lstAccounts;
   }
}