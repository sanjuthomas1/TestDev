public with sharing class sen {

    
    public User useer { get; set; }
id aid{get; set;}
    public List<user> us { get; set; }
public List<Profile> p { get; set; }


public sen(){
User useer = new user();
us=[SELECT Alias,Email,FirstName,LastName,Name,Username FROM User];
p=[select id,name from profile limit 1];
for(profile pa:p){
aid=pa.id;
}
}

public PageReference save() {
User u = new user();


u.LastName = useer.LastName;
//u.Email = 'test@test.com';
//u.Alias = 'Tcode';
//u.Username = 'test1234123123@test.com';
//useer.CommunityNickname = 'test111';
//useer.LocaleSidKey = 'en_US';
//useer.TimeZoneSidKey = 'GMT';
//useer.ProfileID = aid;
//useer.LanguageLocaleKey = 'en_US';
//useer.EmailEncodingKey = 'UTF-8';
database.insert (u);

//database.insert(useer);
        return null;
    }


}