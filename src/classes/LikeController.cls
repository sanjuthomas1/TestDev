public with sharing class LikeController {

    public String fname { get; set; }

    public PageReference createLike() {
    
    contact c=new contact(Lastname=fname);
    insert c;
        return null;
    }

}