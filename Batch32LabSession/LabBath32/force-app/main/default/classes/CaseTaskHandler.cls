public class CaseTaskHandler {
    public static void task (List<case> newCaseList){
        Create_Task__mdt createDefaultTask = Create_Task__mdt.getInstance('DefaultTestConfig');

        try {
            List<Task> taskList = new List<Task>();
            for (Case cs : newCaseList) {
                Task tk = new Task();
                tk.Subject = createDefaultTask.Subject__c;
                tk.Description = createDefaultTask.Comments__c;
                tk.Status = createDefaultTask.Status__c;
                tk.ActivityDate = Date.today().addDays(1);
                tk.WhatId = cs.Id;
                tk.OwnerId = cs.OwnerId;

                taskList.add(tk);
            }
            if(!taskList.isEmpty()){
                insert taskList;
            }
        } catch (Exception e) {
            System.debug(e);
        }
    }
}