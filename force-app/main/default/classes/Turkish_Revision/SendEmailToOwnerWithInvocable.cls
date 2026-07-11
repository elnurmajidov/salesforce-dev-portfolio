public with sharing class SendEmailToOwnerWithInvocable {
    @invocableMethod(label='Email to owner' category='Opportunity')
    public static void sendEmail(List<EmailWrapper> request) {
        list<string> owEmails = request[0].ownerEmails;
        string sub = request[0].subject;


        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();

        message.toAddresses= owEmails;
        message.subject=sub ;
        message.plainTextBody = 'Opportunity closed lost oldu.';

        Messaging.SendEmail(new Messaging.SingleEmailMessage[] {message});

    }
    public class EmailWrapper{
        @InvocableVariable
        public list<string> ownerEmails;

        @invocableVariable
        public string subject;
    }
}