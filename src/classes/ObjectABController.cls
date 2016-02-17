public with sharing class ObjectABController {

    public Boolean status { get; set; }

    
    /*This will store the Id from the URL i.e., the Id of the Record that belongs to the Master Object.*/
    public List<Object_A__c> MasterA {get; set;}
    public List<Object_B__c> MasterB {get; set;}
    //public string Aid{get; set;}
     //public Object1__c childob1 { get; set; }
     
     
    /*Constructor. This would build everything for our VF Page.*/
    public ObjectABController()
    {      
        String soql = 'select Name from Object_A__c where Name!= null';
        MasterA= Database.query(soql);           
        MasterB=[select Name from Object_B__c where Name!=null];
    }
    
   
/*
    public PageReference childA() {
    List<object1__c> childob1= new List<Object1__c>();
    MasterRecordId = ApexPages.currentPage().getParameters().get('id');
     childob1= [SELECT Name FROM Object1__c WHERE Object_A__c=:MasterRecordId];
        return Apexpages.currentPage();
    } 
*/
}