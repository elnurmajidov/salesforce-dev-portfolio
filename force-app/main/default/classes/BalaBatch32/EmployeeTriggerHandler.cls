public with sharing class EmployeeTriggerHandler {
    
    public static void beforeInsert(List<Employee__c> newEmployees) {
        for(Employee__c newEmp : newEmployees) {
            if(newEmp.Performance_Points__c == null) {
                newEmp.Performance_Points__c = 0;
                newEmp.Last_Evaluation_Date__c = Date.today();
            }
            calculatePerformanceBonus(newEmp);
        }
    }

    public static void beforeUpdate(Map<Id,Employee__c> newEmployees, Map<Id,Employee__c> oldEmployees) {
        for(Id empId : newEmployees.keySet()) {
            Employee__c newEmp = newEmployees.get(empId);
            Employee__c oldEmp = oldEmployees.get(empId);

            // Check if the performance points have changed
            if(newEmp.Performance_Points__c != oldEmp.Performance_Points__c && newEmp.Performance_Points__c < oldEmp.Performance_Points__c) {
                newEmp.addError('Performance points cannot be decreased');
            } else {
                calculatePerformanceBonus(newEmp);
            }
        }
    }

    public static void afterInsert(List<Employee__c> newEmployees){
        sendWelcomeEmails(newEmployees);
    }


    public static void calculatePerformanceBonus(Employee__c emp) {
        if(emp.Performance_Points__c > 100) {
            emp.Grade__c = 'Gold';
            emp.Bonus__c = emp.Base_Salary__c * 20/100;
        } else if(emp.Performance_Points__c > 50) {
            emp.Grade__c = 'Silver';
            emp.Bonus__c = emp.Base_Salary__c * 10/100;
        } else {
            emp.Grade__c = 'Bronze';
            emp.Bonus__c = emp.Base_Salary__c * 5/100;
        }
    }
    public static void sendWelcomeEmails(List<Employee__c> newEmployees){
        List<Messaging.SingleEmailMessage> message = new List<Messaging.SingleEmailMessage>();
        for(Employee__c emp : newEmployees){
            // Prepare subject, body, recipients
            String subject = 'Welcome Onboard!';
            String body = 'Hi ' + emp.Name + ', Welcome to the copmany. Looking forward to working with you.';
            List<String> recipients = new List<String>{emp.Email__c};

            //Prepare email message
            Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
            msg.setSubject(subject);
            msg.setPlainTextBody(body);
            msg.setToAddresses(recipients);
            message.add(msg);
        }
        Messaging.sendEmail(message);
    }
}