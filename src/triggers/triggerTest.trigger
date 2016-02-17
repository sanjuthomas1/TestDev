trigger triggerTest on AccountCustom__c (after update) {
List<ChildAc__c> cA=new List<ChildAc__c>();
List<id> aid=new List<id>();

for(AccountCustom__c a:trigger.new){

cA=[SELECT id,name,AccountCustom_Relation__c from ChildAc__c where AccountCustom_Relation__c=:a.id];
aid.add(a.id);
}

for(childAc__c cc:cA)
{
cc.AccountCustom_Relation__c=aid[0];
update cc;
}
}