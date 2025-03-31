@RestResource(URLMapping='/AccountInsertService/*' )
Global class AccountPostService 
{
    @HttpPost()
    Global static string InsertRecord(string cName, string cRating, String cIndustry, string cPhone)
    {
        Account acc = New Account();
        
        acc.Name = cName;
        acc.Rating = cRating;
        acc.Industry = cIndustry;
        acc.Phone = cPhone;
        
        Insert acc;
        
        if(acc.id != null)
        {
            return 'Record inserted successfully'+acc.id;
        }
        else
        {
            return 'Record insertion Failed';
        }
    }
}