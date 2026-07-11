public with sharing class TaskTriggerHandler {

/*
    Question 2:
1. Write a trigger (with handler ofc), so that ONLY the SYSTEM ADMINISTRATOR user CAN delete
the task. If any other user tries to delete the task, it should THROW error.
Hint: UserInfo class will give you profile id. Query profile.
2. Try to write TEST for this scenario
Create User with different PROFILE in TEST Class and use system.runAs(). Also you might
have to use Try Catch.
*/
    public static void deleteTaskError(List<Task> oldList){
        id userProfId = UserInfo.getProfileId();
        id systemAdminProfileId = [SELECT Id FROM Profile WHERE Name = 'System Administrator'].Id;

        if(userProfId != systemAdminProfileId){
            for(task t : oldList){

                t.addError('Only System administrator can delete ');
            }
        }
    }
}