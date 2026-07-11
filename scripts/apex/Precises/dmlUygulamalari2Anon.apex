DMLuygulamalari2.createMultipleAccountsAndContacts();

Account acc = new account();
acc.Name = 'Default';
insert acc;

List<contact> conList = [select id, name, accountId from contact where accountId = null];
System.debug(conList);