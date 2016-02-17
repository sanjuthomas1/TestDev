public class show1{
  
public List<List<city__c>> allCitiesListOfList {get;set;} 

Public show1() {
   allCitiesListOfList =new List<List<city__c>>();
   Map<Integer,City__c> citiesMap=new Map<Integer,City__c>();
   Integer index=0;
   
   for(City__c c:[SELECT name from City__c]){
      index++;
      citiesMap.put(index,c);
   }
   Integer sizeOfMap=citiesMap.size();
   decimal s=sizeOfMap/1000;
   decimal ss=Math.floor(s);
   Integer numberOfListsToAdd= Integer.valueOf(ss);
  
     for(Integer i=0;i<=numberOfListsToAdd;i++){
     List<city__c> tempCitiesList=new List<city__c>();
      allCitiesListOfList.add(tempCitiesList); 
   }
   
   for(Integer key:citiesMap.keySet()){
        Integer correspondingListNumber=Integer.valueOf(key/1000);
     
        allCitiesListOfList[correspondingListNumber].add(citiesMap.get(key));
        
   }
   
   
   
   
    
}
}