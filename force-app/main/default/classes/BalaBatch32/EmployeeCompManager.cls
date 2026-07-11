@RestResource(urlMapping= '/Employee/CompChange')
global with sharing class EmployeeCompManager {

    @HttpPut
    global static void updateEmployeeCompChanges(){
        //Grab Request Body from the incoming request
        RestRequest request = RestContext.request;
        String reqBody = request.requestBody.toString();
        List<CompRequest> compRequests = (List<CompRequest>) JSON.deserialize(reqBody, List<CompRequest>.class);

        //Collect emails into a set
        Set<string> emails = new set<string>();
        for(CompRequest req : compRequests){
            if(!string.isBlank(req.email)){
                emails.add(req.email);
            }
        }

        // Collect the existing employee records based on the emails
        Map<String, Employee__c> emailVsEmployee = new Map<String, Employee__c> ();
        for(Employee__c emp : [SELECT Id, Email__c, Base_Salary__c, Bonus__c FROM Employee__c WHERE Email__c In : emails]){
            emailVsEmployee.put(emp.Email__c, emp);
        }

        //Populate employee comp changes
        List<Employee__c> modifiedEmployees = new List<Employee__c>();
        for (CompRequest compReq : compRequests){
            if (!String.isBlank(compReq.email) && emailVsEmployee.containsKey(compReq.email)) {
                Employee__c emp = emailVsEmployee.get(compReq.email);
                emp.Base_Salary__c = emp.Base_Salary__c + (emp.Base_Salary__c * compReq.compChange / 100);
                emp.Bonus__c = compReq.bonus;
                emp.Last_Evaluation_Date__c = Date.today();
                modifiedEmployees.add(emp);
            }
        }

        //Save Employees
        try{
            update modifiedEmployees;
        } catch(Exception ex){
            System.debug(ex.getMessage());
        }
    }




    global class CompRequest {
        global string email;
        global decimal compChange;
        global decimal bonus;
    }
}


