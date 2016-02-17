public with sharing class ShoppController {

    public List<ProductItem__c> productItemList { get; set; }
    public List<Brand__c> brandList { get; set; }
    public Map<Id, List<Brand__c>> proIdBrandListMap { get; set; }
    Set<Id> productItemIds = new Set<Id>();
    Map<Id, ProductItem__c> productItemMap = new Map<Id,ProductItem__c>();
    
    public List<ProductItemWrapper> productItemWrapperList { get; set; }

    public ShoppController() {   
        productItemList = [SELECT Name FROM ProductItem__c];
        proIdBrandListMap = new Map<Id, List<Brand__c>>();
        productItemWrapperList = new List<ProductItemWrapper>();
        if(productItemList.size() > 0) {
            for(ProductItem__c pro : productItemList) {
                 productItemIds.add(pro.Id);
                productItemMap.put(pro.Id, pro);
            }
            brandList = [SELECT Name, ProductItem__c, (SELECT Name FROM Models__r) FROM Brand__c WHERE ProductItem__c IN :  productItemIds];
            system.debug('Interest List is ' + brandList);
        }
        if(brandList.size() > 0) {
            for(Brand__c brnd : brandList) {
                if(!proIdBrandListMap.containsKey(brnd.ProductItem__c)){
                    proIdBrandListMap.put(brnd.ProductItem__c, new List<Brand__c>());
                }
                proIdBrandListMap.get(brnd.ProductItem__c).add(brnd);
            }
            for(Id brandId : proIdBrandListMap.keySet()) {
                productItemWrapperList.add(new ProductItemWrapper(productItemMap.get(brandId), proIdBrandListMap.get(brandId)));
            }
        }
    } 
    
    public class ProductItemWrapper {
        public ProductItem__c productItem { get; set; }
        public List<Brand__c> brndList { get; set; }
        
        public ProductItemWrapper(ProductItem__c productItem, List<Brand__c> brndList) {
            this.productItem = productItem;
            this.brndList = brndList;
        }
    }
}