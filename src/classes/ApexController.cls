public with sharing class ApexController{
    /*This will store the Id from the URL i.e., the Id of the Record that belongs to the Master Object.*/
    public String MasterRecordId        {get; set;}
    public List<Object1__c> ChildRecords  {get; set;}
    public List<Object_A__c> MasterRecord                 {get; set;}
    /*Constructor. This would build everything for our VF Page.*/
    public ApexController()
    {
        MasterRecordId = ApexPages.currentPage().getParameters().get('id');
        System.debug(MasterRecordId);
      
          
            /*Fetch the Master Record Details*/
            MasterRecord =
                [
                    SELECT 
                        Name
                    FROM
                        Object_A__c
                ];
           system.debug(MasterRecord);
            /*Fetch all the Child Records with respect to the Master Record. Note: Child_To_Parent_Lookup__c  is Lookup/M-D field on my Child SObject to the Parent – Master*/
            ChildRecords =
                [
                    SELECT 
                       Name
                    FROM
                        Object1__c
                    WHERE 
                        Object_A__c = :MasterRecordId
                ];
                system.debug(ChildRecords);
        
    }
}