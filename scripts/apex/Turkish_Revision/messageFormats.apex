Account acc1 = new Account();
acc1.name = 'Andy';
acc1.annualRevenue = 1000000;
acc1.phone = '654892';

string str1 = JSON.serialize(acc1);
System.debug(str1);

Account accDes = (Account)JSON.deserialize(str1, account.class);
System.debug(accDes);



List<Account> accLst = new List<Account>{acc1,acc2};
string str2 = JSON.serialize(accLst);
System.debug(str2);

Case cs = [select id, subject, caseNumber, contact.first.Name, contact.lastName, Account.name from Case where contactId!=null and accountId !=null limit 1]