public with sharing class ReqResCalloutPostDel {
    public static HttpResponse postProduct() {

        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:Reqres_API/records?project_id=14702');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json; charset=UTF-8');
        request.setBody('{"data": {"name": "Laptop","price": 959.99,"category": "Electronics","in_stock": false}}');

        Http http = new Http();
        HttpResponse response = http.send(request);
        string jsonBody = response.getBody();
        System.debug(jsonBody);

        AllResponseWrapper allRw = (AllResponseWrapper)JSON.deserialize(jsonBody,AllResponseWrapper.class);
        system.debug(allRw.data.data.name);

        if(response.getStatusCode()==201){
            ProductApi__c product1 = new ProductApi__c();
            product1.Name = allRw.data.data.name;
            product1.Category__c = allRw.data.data.category;
            product1.Price__c =  allRw.data.data.price;
            product1.In_Stock__c =  allRw.data.data.in_stock;
            insert product1;
        }

        return response;
    }
    public class AllResponseWrapper{
        public ResponseData data;
    }
    public class ResponseData{
        public string id;
        public InnerProductData data;
    }
    public class InnerProductData {
        public string name;
        public decimal price;
        public string category;
        public boolean in_stock;
    }
    public static HttpResponse deleteProduct() {
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:Reqres_API/records?project_id=14702');
        request.setMethod('DELETE');
        
        Http http = new Http();
        HttpResponse response = http.send(request);
        string jsonBody = response.getBody();
        System.debug(jsonBody);

        if(response.getStatusCode()==204){
            System.debug('Record başarılı bir şekilde silindi.'+response.getStatusCode());
        }
        
        return response;
    }
}