@isTest
public with sharing class MockClass implements HttpCalloutMock{
    public HttpResponse respond(HttpRequest request){
        if(request.getEndpoint()=='callout:Reqres_API/records?project_id=14702' && request.getMethod()=='POST'){
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json; charset=UTF-8');
            res.setBody('{"data":{"id":"136db1a1-3af6-4e92-9875-986ba254ce46","collection_id":"3af485f2-330d-4558-94cd-a5e98f4a9429","project_id":14702,"app_user_id":null,"created_by":108546,"created_at":"2026-04-22T01:58:19.740Z","updated_at":"2026-04-22T01:58:19.740Z","deleted_at":null,"data":{"name":"Wireless Headphones","price":59.99,"category":"Electronics","in_stock":true}}}');
            res.setStatusCode(201);
            return res;
        }
         if(request.getEndpoint()=='callout:Reqres_API/records?project_id=14702' && request.getMethod()=='DELETE'){
            HttpResponse res = new HttpResponse();
            res.setStatusCode(204);
            return res;
         }
         return null;
    }
}