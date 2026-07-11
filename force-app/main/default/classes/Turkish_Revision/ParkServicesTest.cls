@isTest
public with sharing class ParkServicesTest {
    @isTest
    private static void  ParkServicesTestMethod() {
        test.startTest();
        ParkServicesMock mock =  new ParkServicesMock();
        test.setMock(WebServiceMock.class,mock);
        ParksServices.ParksImplPort ps = new ParksServices.ParksImplPort();
        String[] parks = ps.byCountry('Turkiye');
        test.stopTest();

        assert.areEqual(3,parks.size());
    }
}