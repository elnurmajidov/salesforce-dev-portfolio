List<Account> accList = new List<Account>();

Account acc1 = new Account(Name = 'acc1', AnnualRevenue = 1000, Rating = 'Hot', Industry = 'Technology');
Account acc2 = new Account(Name= 'acc2', AnnualRevenue=2000, Fax='123456789');
Account acc3 = new Account(Name= 'acc3', Phone='123456789');
Account acc4 = new Account(Industry='Education');

accList.add(acc1);
accList.add(acc2);
accList.add(acc3);
accList.add(acc4);

//insert accList; // ya hep ya hic
//Database.insert(accList, true); // ya hep ya hic
List<Database.SaveResult> allResults = Database.insert(accList,false); // saglikli recordlara DML yapabiliriz
System.debug('Record size ==> ' + allResults.size());

for(Database.SaveResult result : allResults){
    if(result.isSuccess()){
        System.debug(result.getId() + ' ile kaydedilmistir');

    } else{
        System.debug(result.getErrors());
    }
}