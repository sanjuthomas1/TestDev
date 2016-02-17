public with sharing class NameControl {
Contact contact=new contact();
public string lname{get; set;}

    public pagereference saveCon()
    {
    contact.Lastname=lname;
    return null;
    }
}