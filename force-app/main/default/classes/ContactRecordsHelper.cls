@RestResource(URLMapping='/ContactRecordsService/*')
global class ContactRecordsHelper 
{
    @HttpPost
    global static String CreateNewContacts(String fName, String lName) 
    {
        List<Contact> contactsToInsert = new List<Contact>();

        // Create 2 Contact records with the provided parameters
        for (Integer count = 1; count <= 2; count++) 
        {
            Contact con = new Contact();
            con.FirstName = fName;
            con.LastName = lName;
            contactsToInsert.add(con);
        }

        if (!contactsToInsert.isEmpty()) 
        {
            // Insert the records
            insert contactsToInsert;
            return 'Records Inserted Successfully';
        }

        // If no records were created
        return 'No Records Created';
    }
}