@RestResource(URLMapping='/AccountRecordServiceNoParams/*')
Global class Accountclass 
{
    @HttpPost()
    Global static string InsertRecord()
    {
        String AccountRecord = RestContext.Request.RequestBody.ToString();
        Account accRecord = (Account) system.JSON.deserialize(AccountRecord, Account.class);
        
        
        if(accRecord !=null)
        {
            insert accRecord;
            
            Return 'Account Record Inserted Successfully'+accRecord.id;
        }
        else
        {
            Return 'Account Record Insertion Failled';
        }
    }
}