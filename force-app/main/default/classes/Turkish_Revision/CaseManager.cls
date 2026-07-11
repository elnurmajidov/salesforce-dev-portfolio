@RestResource(urlMapping = '/Case/*')
global with sharing class CaseManager {
    //https://orgfarm-3cb95dba8f-dev-ed.develop.my.salesforce.com/services/apexrest/Case/500fj00000mA4uMAAS
    //string sfBaseUrl = Url.getOrgDomainUrl().toExternalForm();
    @HttpGet
    global static case getCase() {
        RestRequest request = RestContext.request;
        System.debug('Endpoint ' + request.requestURI);
        System.debug('Http Method ' + request.httpMethod);
        System.debug('Header ' + request.headers);
        System.debug('Request Body ' + request.requestBody);
        string uri = request.requestURI;
        Id csId = uri.substringAfterLast('/');
        Case cs =[SELECT Id, CaseNumber, Status, Origin, Subject, Description, Priority FROM Case where id =: csId];
        return cs;
    }
   /* @HttpPost
    global static Id createCase(string Subject, string Description, string Priority, string Status) {
        Case cs = new Case();
        cs.Subject = Subject;
        cs.Description = Description;
        cs.Priority = Priority;
        cs.Status = Status;
        insert cs;
        return cs.id;
    }*/
    @HttpPost
    global static Id createCase() {
        RestRequest request = RestContext.request;
        string jsonBody = request.requestBody.toString();
        Case cs = (Case)JSON.deserialize(jsonBody, Case.class);
        insert cs;
        return cs.id;
    }
    @HttpDelete
    global static string deleteCase(){
        RestRequest request = RestContext.request;
        string uri = request.requestURI;
        Id csId = uri.substringAfterLast('/');
        Case cs = [ SELECT Id from Case where Id=:csId];
        delete cs;
        return 'Record başarılı bir şekilde silindi.';
    }
    @HttpPut
    global static Case upsertCase(string Id, string Subject, string Description, string Priority, string Status) {
        Case cs = new Case();
        cs.Id = Id;
        cs.Subject = Subject;
        cs.Description = Description;
        cs.Priority = Priority;
        cs.Status = Status;
        upsert cs;
        return cs;
    }
    @HttpPatch
    global static Case updateCase() {
        RestRequest request = RestContext.request;
        string jsonBody = request.requestBody.toString();
        Case cs = (Case)JSON.deserialize(jsonBody, Case.class);
        update cs;
        return cs;
    }

}