String accName = 'Burlington Textiles Corp of America';
List<Contact> listOfContact = SoqlPractice4.childToParent(accName);
for(contact eachContact : listOfContact){
    System.debug('**********CONTACT*******');
    System.debug('Contact ID: ' + eachContact.Id + 'n Contact Name: ' + eachContact.Name + 'n Account ID: ' + eachContact.Account.Id + 'n Account Name ' + eachContact.Account.Name);
    System.debug('***********');
}
SoqlPractice4.parentToChild(accName);