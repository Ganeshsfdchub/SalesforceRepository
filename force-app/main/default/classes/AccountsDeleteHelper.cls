@RestResource(URLMapping='/AccountsRecordDeleteHelper/*')
Global class AccountsDeleteHelper 
{
    @HttpDelete()
    Global static string DeleteAccountsByName()
    {
       Map<string, string> inputparams = RestContext.Request.params;
       List<Account> lstaccounts =  [select id, Name, Rating,  Industry, Phone 
                                    from Account where Name =:inputparams.Get('IpName')]; 
        
        if(!lstaccounts.isempty())
        {
           Delete lstaccounts;
           return 'Records Deleted';
        }
        else
        {
            return 'No Matching Record Found';
        }
    }
}