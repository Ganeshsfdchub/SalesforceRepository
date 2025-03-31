public class FutureMethod 
{
    public static void SetupObjectMethod()
    {
        user userToDeactivate = [select id, username, firstname, lastname, email, isActive
                                 from user where username ='testinguser@gmail.com' and isactive = true];
        
        if(userToDeactivate != null)
        {
            userToDeactivate.isactive = false;
            update userToDeactivate;
            // invoking lead record
            insertleadrecords();
        }
    }
    
    @future()
    Public static void insertleadrecords()
    { 
        // Creating a lead record......(non-setup object)
        lead idrecord = new lead();
        
        idrecord.firstname = 'future';
        idrecord.LastName = 'method test';
        idrecord.Phone  = '9959308808';
        idrecord.Company ='ICIC Bank';
        idrecord.Email = 'sreeganesh4a8@gmail.com';
        idrecord.State = 'working as contracted';
        idrecord.Title = 'sales manager';
        idrecord.fax = '35462';
        idrecord.Rating = 'hot';
        idrecord.Industry ='Banking';
        idrecord.annualrevenue = 250000;
        idrecord.leadsource = 'phone';
        idrecord.Website = 'www.salesforcelogin.com';
        idrecord.city = 'hydrebad';
        idrecord.state = 'telangana';
        idrecord.Country = 'India';
        
        insert idrecord;
        
        if(idrecord.Id != null)
        {
            system.debug('Lead Record has been inserted successfully'+idrecord.Id);  
        }   
    } 
}