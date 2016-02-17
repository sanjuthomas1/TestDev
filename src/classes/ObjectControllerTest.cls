@isTest
public class ObjectControllerTest {

    static testMethod void MyTcontroller()
    {
      ObjectController obc= new ObjectController();
        //PageReference pageRef = Page.ObjectsPage;
        Object_A__c MA=new Object_A__c(Name='Test');
        insert MA;
        obc.Aid=MA.id;
        Object_B__c MB=new Object_B__c(Name='TestB');
        insert MB;
        obc.Bid=MB.id;
        //pageRef.getParameters().put('Aid',MA.id);
       //Test.setCurrentPage(pageRef);
        obc.childA();
        obc.childB();
    }
}