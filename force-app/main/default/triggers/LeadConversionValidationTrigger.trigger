trigger LeadConversionValidationTrigger on Lead (before insert, before update) 
{
    // Loop through each Lead record being processed
    for (Lead leadRecord : Trigger.new) 
    {
        // Check if the lead is being converted
        if (leadRecord.IsConverted) 
        {
            // Validate the email and add an error if it's invalid
            validateAndAddErrorForInvalidEmail(leadRecord);
        }
    }
    
    
    // Helper method to validate the email format and add an error if invalid
    private void validateAndAddErrorForInvalidEmail(Lead leadRecord) 
    {
        String email = leadRecord.Email;
        
        // If no email is provided (email is null), add an error
        if (email == null) 
        {
            leadRecord.addError('Lead conversion is not allowed. Please provide a valid email address.');
            return;
        }
        
        // Define the pattern for a valid email
        String emailRegex = '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$';
        
        // Compile the regex pattern
        Pattern pattern = Pattern.compile(emailRegex);
        
        // Match the provided email against the compiled regex pattern
        Matcher matcher = pattern.matcher(email);
        
        // Add an error if the email does not match the pattern
        if (!matcher.matches()) 
        {
            leadRecord.addError('Lead conversion is not allowed. Please provide a valid email address.');
        }
    }
}