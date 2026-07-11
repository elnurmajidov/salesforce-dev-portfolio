@isTest
public with sharing class CaseManagerTest {
    @isTest
    private static void testGetCase(){
        Case cs = new Case();
        cs.Status = 'New';
        cs.Origin = 'Phone';
        cs.Priority = 'Medium';
        cs.Subject = 'Test Case';
        cs.Description = 'Test description';
        insert cs;

        RestRequest request = new RestRequest();
        request.requestURI = '/Case/'+ cs.id;
        request.httpMethod = 'GET';
        RestContext.request = request;

        Test.startTest();
        Case result = CaseManager.getCase();
        Test.stopTest();
        Assert.areEqual(cs.id, result.id);
    }
    @isTest
    private static void testCreateCase(){
        Case cs = new Case();
        cs.Status = 'New';
        cs.Origin = 'Phone';
        cs.Priority = 'Medium';
        cs.Subject = 'Test Case';
        cs.Description = 'Test description';

        string jsBody = JSON.serialize(cs);

        RestRequest request = new RestRequest();
        request.requestURI = '/Case/';
        request.httpMethod = 'POST';
        request.requestBody = Blob.valueOf(jsBody);
        RestContext.request = request;

         Test.startTest();
        Id result = CaseManager.createCase();
        Test.stopTest();
        Assert.isNotNull(result, 'Result boş olmamalı');

    }
    @isTest
    private static void testDeleteCase(){
        Case cs = new Case();
        cs.Status = 'New';
        cs.Origin = 'Phone';
        cs.Priority = 'Medium';
        cs.Subject = 'Test Case';
        cs.Description = 'Test description';
        insert cs;

        RestRequest request = new RestRequest();
        request.requestURI = '/Case/'+ cs.id;
        request.httpMethod = 'DELETE';
        RestContext.request = request;

        Test.startTest();
        String result = CaseManager.deleteCase();
        Test.stopTest();
        Assert.areEqual('Record başarılı bir şekilde silindi.', result);
    }
    @isTest
    private static void testUpsertCase(){
        Case cs = new Case();
        cs.Status = 'New';
        cs.Origin = 'Phone';
        cs.Priority = 'Medium';
        cs.Subject = 'Test Case';
        cs.Description = 'Test description';
        insert cs;

        Test.startTest();
        Case result = CaseManager.upsertCase(cs.id, 'Test case 2','Test description 2','High','Working');
        Test.stopTest();
        Assert.areNotEqual(cs.Subject, result.Subject);
    }
    @isTest
    private static void testUpdateCase(){
        Case cs = new Case();
        cs.Status = 'New';
        cs.Origin = 'Phone';
        cs.Priority = 'Medium';
        cs.Subject = 'Test Case';
        cs.Description = 'Test description';
        insert cs;

        cs.Description = 'Test description 2';
        cs.Status = 'Escalated';

        string jsBody = JSON.serialize(cs);

        RestRequest request = new RestRequest();
        request.requestURI = '/Case/';
        request.httpMethod = 'PATCH';
        request.requestBody = Blob.valueOf(jsBody);
        RestContext.request = request;

        Test.startTest();
        Case result = CaseManager.updateCase();
        Test.stopTest();

        Assert.areEqual('Escalated', result.Status);
        Assert.areEqual('Test description 2', result.description);
    }

}