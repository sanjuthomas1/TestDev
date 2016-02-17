public with sharing class ControllerGreet {
   
    
    public String fName { get; set; }
    public List<Attachment> listAttachment {get;set;}
    Account account{get; set;}
    
    List<Account> acc=new List<Account>();
    
    
    public ControllerGreet(){
    listAttachment = new List<Attachment>();
    account=new account();
    acc=[select id, name from account where Name='Christmas Account'];
   // System.debug('\\\\\\\\\\\\\\\\\\\\\\\\\\\\\' + 'acc.id');
    for(account ac:acc){
    account.id=ac.id;
    }System.debug('+++++++' + account.id);
    
    
    listAttachment = [Select Id, ContentType, Name from Attachment where ParentId = :account.id];
    
    }
    
    
    public pagereference fun(){
    system.debug('/////////////////////' + fname);
    contact c=new contact();
    c.LastName=fName;
    insert c;
    return null;
    }
    
    
    
}