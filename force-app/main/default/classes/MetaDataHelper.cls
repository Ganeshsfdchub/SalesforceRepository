public class MetaDataHelper 
{
    Public static void GetAllMetadataTypes()
    {
        // Get All Custom MetaData Types....
        
        list<Branch_Detail__mdt> Branches = [select id, label, IFSCCode__c, MICRCode__c
                                             from Branch_Detail__mdt];
        
        system.debug('collection size----'+Branches.size());
        
        for(Branch_Detail__mdt branch :Branches)
            
        {
            system.debug('collection size----'+Branch.label);
            system.debug('collection size----'+Branch.IFSCCode__c);
            system.debug('collection size----'+Branch.MICRCode__c);
        }
            
             system.debug('Number of Soql used ----'+System.limits.GetQueries());
        
    }
}