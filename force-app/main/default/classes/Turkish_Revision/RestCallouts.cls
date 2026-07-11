public with sharing class RestCallouts {
    public static HttpResponse getUsers() {
        
        HttpRequest request = new HttpRequest();
        request.setEndPoint('https://dummyjson.com/users');
        request.setMethod('GET');

        Http httpObject  = new Http();
        HttpResponse response = httpObject.send(request);
        if(response.getStatusCode()==200){
            string responseBody = response.getBody();
            userList usr = (userList)JSON.deserialize(responseBody,userList.class);
            List<Dummy_User__c> lstDmmyusr = new List<Dummy_User__c>();
            for(userWrapper eachUser : usr.users){
                Dummy_User__c us = new Dummy_User__c();
                us.Age__c = eachUser.age;
                us.Birth_Date__c= Date.valueOf(eachUser.birthDate);
                us.Email__c = eachUser.email;
                us.First_name__c = eachUser.firstName;
                us.Image__c = eachUser.image;
                us.Phone__c = eachUser.phone;
                lstDmmyusr.add(us);
            }
            try {
                insert lstDmmyusr;
            } catch (Exception e) {
                System.debug(e.getMessage());
            } 


        }
        

        return response;
    }
    public class userList{
        public List<userWrapper> users;
    }
    public class userWrapper{
        public string firstName;
        public integer age;
        public string email;
        public string phone;
        public string birthDate;
        public string image;

    }
    @future(callout=true)
    public static void getGstInfo(id gstId){
        Gst_Number__c gst = [SELECT Id, Name, Address__c, Gst_Info__c, State__c, Valid__c FROM Gst_Number__c where id =:gstId];

        HttpRequest request = new  Httprequest();
        request.setEndpoint('https://api.e-waybill.in/api/gstin/validate?gstin='+ gst.Name);
        request.setMethod('GET');

        Http Httpobject = new Http();
        HttpResponse response = httpObject.send(request);
        if(response.getStatusCode() == 200){
            string jsonBody =response.getBody();
            Map<string,object> gstBody = (Map<string,object>)JSON.deserializeUntyped(jsonBody);
            gst.Address__c= (string)gstBody.get('address');
            gst.Gst_Info__c=(string)gstBody.get('name');
            gst.Name = (string)gstBody.get('gstNumber');
            gst.State__c=(string)gstBody.get('state');
            gst.Valid__c=(boolean)gstBody.get('valid');

            update gst;
        }
    }
}