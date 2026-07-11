@isTest
public with sharing class RestCalloutPostDelTest {
    @isTest
    private static void postProductTest(){
        ProductApi__c product1 = new ProductApi__c();
            product1.Name = 'Smart Phone';
            product1.Category__c ='Technologies';
            product1.Price__c =  900.00;
            product1.In_Stock__c =  true;
            insert product1;

            test.startTest();
            MockClass mock = new MockClass();
            Test.setMock(HttpCalloutMock.class, mock);
            HttpResponse response = ReqResCalloutPostDel.postProduct();
            test.stopTest();

            assert.areEqual(201,response.getStatusCode());
    }
    @isTest
    private static void deleteProductTest(){
         test.startTest();
            MockClass mock = new MockClass();
            Test.setMock(HttpCalloutMock.class, mock);
            HttpResponse response = ReqResCalloutPostDel.deleteProduct();
            test.stopTest();

            assert.areEqual(204,response.getStatusCode());
    }
}