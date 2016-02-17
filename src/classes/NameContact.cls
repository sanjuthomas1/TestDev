public with sharing class NameContact {
    public boolean liked { get; set; }


PageReference newocp = new PageReference('/apex/Liked?');

public contact contact{get; set;}
 public List<Attachment> listAttachment {get;set;}
    Account account{get; set;}
    
    List<Account> acc=new List<Account>();
    

   public NameContact(){
   
   contact=new contact();
   account=new account();

listAttachment = new List<Attachment>();
        acc=[select id, name from account where Name='Christmas Account'];
   // System.debug('\\\\\\\\\\\\\\\\\\\\\\\\\\\\\' + 'acc.id');
    for(account ac:acc){
    account.id=ac.id;
    account.name=ac.name;
    }System.debug('+++++++' + account.id);
    
    
    listAttachment = [Select Id, ContentType, Name from Attachment where ParentId = :account.id];
   
   }



    public PageReference save() {
    liked=true;
    contact.Accountid=account.id;
    database.insert(contact);
        return newocp;
    }

public pagereference LikePage(){
contact con=new contact();
con.FirstName='STAR';
con.AccountId=account.id;
/*
if(contact.LastName==null)
{

con.LastName='guest';
}
else{ */
con.LastName=contact.LastName;


database.insert(con);
    liked=false;
    
return null;
}

}