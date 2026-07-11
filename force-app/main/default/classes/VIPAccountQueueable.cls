public class VIPAccountQueueable implements Queueable {
    private Set<Id> vipIds;
    public VIPAccountQueueable(Set<Id> vipIds){
        this.vipIds = vipIds;
    }
    
    public void execute(QueueableContext context) {
        try{
            
           
            //Task create etme
            List<Task> tasks = new List<Task>();
            for(Id accId : vipIds){
                Task newTask = new Task();
                newTask.Subject = 'VIP Account Taski';
                newTask.Status = 'Not Started';
                newTask.Priority = 'High';
                newTask.WhatId = accId;
                tasks.add(newtask);
            }
            if(!tasks.isEmpty()){
                insert tasks;
            }
            
            //Email gönderme
            List<Contact> contacts= [SELECT Id,Email,FirstName,LastName FROM Contact WHERE AccountId IN:vipIds AND Email != null];
            
            //Messaging.SingleEmailMessage[] messages =  new List<Messaging.SingleEmailMessage> ();
            List<Messaging.SingleEmailMessage> messages =  new List<Messaging.SingleEmailMessage> ();
    
            for(Contact con : contacts){
                Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                message.setTargetObjectId(con.Id);
                message.setSubject('Tebrikler VIP Oldunuz ');
                message.setplainTextBody('Tebrikler, şirketiniz tarafımızdan VIP ilan edildi......');
                
                messages.add(message); 
            }
            
            if(!messages.isEmpty()){
                Messaging.sendEmail(messages);
            }
        }catch(Exception ex){
            System.debug(ex.getMessage());
            //ErrorController.createError('VIPAccountQueueable-execute()',ex.getMessage(),ex.getLineNumber());
        }
    }
}