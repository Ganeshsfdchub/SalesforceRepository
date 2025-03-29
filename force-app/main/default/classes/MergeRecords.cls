public class MergeRecords 
{
    public static void MergeRecordsMethod()
    {
        Account sourceRecord = [SELECT Id, Name, Industry, AnnualRevenue FROM Account WHERE Name = 'Abhishek kumar2' limit 1];
        Account targetRecord = [SELECT Id, Name, Industry, AnnualRevenue FROM Account WHERE Name = 'Abhishek kumar1' limit 1];
        
        if (sourceRecord != null && targetRecord != null)
        {
            merge targetRecord sourceRecord;
        }
    }
}