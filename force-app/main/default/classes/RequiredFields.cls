public class RequiredFields 
{
    Public static void RequiredFieldmethod(list<Contact> lstContacts)
    {
        for(Contact acc: lstContacts)
        {
            if(acc.Phone == null || acc.Phone =='')
            {
                acc.phone.adderror('Phone field is Required'); 
            }
            else if(acc.Email ==null || acc.Email =='')
            {
                acc.Email.adderror('Email field is Required');  
            } 
        } 
    }
}