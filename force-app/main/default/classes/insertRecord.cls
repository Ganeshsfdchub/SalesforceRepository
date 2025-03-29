public class insertRecord 
{
    public static void insertmethod()
    {
        Account acc = new Account();
        
        acc.name ='Ganesh';
        acc.industry='Banking';
        acc.rating ='hot';
        acc.AnnualRevenue=5000000;
        
        insert acc;
    }
}