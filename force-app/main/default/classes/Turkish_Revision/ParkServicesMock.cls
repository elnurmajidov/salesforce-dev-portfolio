@isTest
public with sharing class ParkServicesMock implements WebServiceMock {
    public Void doInvoke(Object stub, Object soapRequest, Map<String,Object> responseMap, String endpoint, String soapAction, String requestName, String responseNamespace, String responseName, String responseType){
        ParksServices.byCountryResponse response_x = new  ParksServices.byCountryResponse();
        List<string> parks = new list<string>{'Gulhane', 'Belgrad', 'Millet Bahcesi'};
        response_x.return_x = parks;
        responseMap.put('response_x', response_x);
     }
}