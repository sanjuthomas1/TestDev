public with sharing class ObjectController {

    
    /*attributes*/
    public Boolean StatusA {get; set;}
    public Boolean StatusB {get; set;}
    public List<Object_A__c> MasterA {get; set;}
    public List<Object_B__c> MasterB {get; set;}
     public Object_A__c  Adetails {get;set;}
     public Object_B__c  Bdetails {get;set;}
     public List<object1__c> a1details{get; set;}
     public List<object2__c> a2details{get; set;}
     public List<object3__c> b3details{get; set;}
     public List<object4__c> b4details{get; set;}
    public string Aid{get; set;}
    public string Bid{get; set;}
   
    /*Constructor. This would build everything for our VF Page.*/
    public ObjectController()
    {  
        statusA=false;
        statusB=false;
       MasterA= [select Id,Name from Object_A__c where Name!=null];
       MasterB=[select Name from Object_B__c where Name!=null];
       
    }
    
    /*pagereference action for master object A to fetch child object records*/
     public PageReference childA() {
      statusA=true;
      statusB=false;

     Adetails=[SELECT id,name FROM Object_A__c WHERE id =:Aid];
      
     a1details=[SELECT id,Name FROM Object1__c WHERE Object_A__c =:Aid];    
     a2details=[SELECT id,Name FROM Object2__c WHERE Object_A__c =:Aid];      
 
      return null;
    }

    /*pagereference action for master object B to fetch child objects records*/
    public PageReference childB() {
     statusA=false;
     statusB=true;

     Bdetails=[SELECT id,name FROM Object_B__c WHERE id =:Bid];
                  
        
     //b3details=[SELECT id,Name FROM Object3__c WHERE Object_B__c =:Bid];  
     b3details=new List<Object3__c>();
     for(Object3__c ob3:[SELECT id,Name FROM Object3__c WHERE Object_B__c =:Bid]){
        b3details.add(ob3);
     }  
     //b4details=[SELECT id,Name FROM Object4__c WHERE Object_B__c =:Bid];      
     b4details=new List<Object4__c>();
     for(Object4__c ob4:[SELECT id,Name FROM Object4__c WHERE Object_B__c =:Bid]){
        b4details.add(ob4);
     }  

        return null;
    }


   
   
}