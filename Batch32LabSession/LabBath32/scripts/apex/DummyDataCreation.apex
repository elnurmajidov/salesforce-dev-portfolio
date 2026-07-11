DummyDataCreation.createAcc('testRecord ', 500, 'Prospect' );

DummyDataCreation.update10Opportunities();

DummyDataCreation.deleteAmountOpportunities();

DummyDataCreation.addContactToAccountsWithNoContacts();

DummyDataCreation.createAccounts(5);



// 1) Accounts create
List<Account> accList = new List<Account>{
    new Account(Name = 'Acme 1'),
    new Account(Name = 'Acme 2')
};
insert accList;

// 2) Call the static method
Integer countPerAccount = 3;
List<Contact> createdContacts = DummyDataCreation.createContactsForAccounts(countPerAccount, accList);

System.debug('Created contacts size: ' + createdContacts.size());

String i = 'sgfweg';
System.debug('Ahmet ,' + ' ' + i);

String i = 'sgfweg'; 
System.debug('Ahmet , ' + i);

integer i = 1;
System.debug('i = ' + i);
i = ++i;
System.debug('i = ' + i);
