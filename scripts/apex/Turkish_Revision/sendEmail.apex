Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
String[] recipients = new String[]{UserInfo.getUserEmail()};
// List<String> recipients = new List<String>();
// recipients.add('yunus@softinnovas.com');
mail.setToAddresses(recipients);
mail.setSubject('Test Email Subject');
mail.setPlainTextBody('Test email body');

// Messaging.SingleEmailMessage [] mails = new Messaging.SingleEmailMessage []{mail};
List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>{mail};
Messaging.sendEmail(mails);

// System.debug(UserInfo.getUserEmail()); user ile ilgili bilgiyi veriyor