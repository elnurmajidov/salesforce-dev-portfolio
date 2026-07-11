// Yeni kayıt ekleme
Account acc = new Account();
acc.Name = 'First Insert Acc';
acc.AnnualRevenue = 500000;
acc.Industry = 'Technology';

insert acc;

Contact con = new Contact();
con.LastName = 'Doe';
con.FirstName = 'John';
con.Phone ='123456789';
con.Email = 'johndoe@company.com';

insert con;

// Birden fazla recordu insert etmek
List<Account> accList = new List<Account>();
for(Integer i = 0; i < 5 ; i++ ){
    Account acc = new Account();
    acc.Name = 'Test Acc ' + i;
    acc.Rating ='Hot' ;
    acc.Industry = 'Education';
    accList.add(acc);
}
insert accList;


// Kaydı update etme
Account acc = [SELECT Id FROM Account WHERE Name = 'First Insert Acc' AND Industry ='Technology' LIMIT 1];
acc.Name = 'Updated Account';
acc.AnnualRevenue = 123456789;
acc.Description = 'Update işlemi yapıyoruz';

update acc;

// Cok sayıda recordda update
List<Account> accList = [SELECT Id FROM Account WHERE Name LIKE 'Test Acc%'];
for(Account acc : accList){
    acc.Name = 'Updated Test Account';
}

update accList;

// Record silme
Account acc = [SELECT Id FROM Account WHERE Name ='Updated Account'];
delete acc;

List<Account> accounts = [SELECT Id FROM Account WHERE Name LIKE 'Updated Test Account%' ];
delete accounts;

Account deletedAcc = [SELECT Id FROM Account WHERE Name ='Updated Test Account' AND isDeleted = true LIMIT 1 ALL ROWS];
undelete deletedAcc;



Salesforce_Project__c sp = new Salesforce_Project__c();
sp.Project_Name__c = 'DML Project';
sp.Status__c = 'New';
sp.Description__c = 'About DML Topic';

insert sp;
System.debug('Salaesforce ProjectId ' + sp.Id);


Salesforce_Ticket__c st = new Salesforce_Ticket__c();
st.Subject__c = 'First Ticket for DML ';
st.Priority__c = 'High';
st.Salesforce_Project__c = sp.Id;

insert st;

Id accId = DMLExamples.updateHighestAccount();
System.debug(accId);


Id accId = DMLExamples.updateHighestAccount();
System.debug(accId);


Set<Id> Ids = DMLExamples.updateContacts();
if(!Ids.isEmpty()){
    System.debug('Contact Ids ' + Ids);
}else{
    System.debug('Sartları sağlayan contact recordu bulunanamaıstır');
}



Id accId = DMLExamples.updateHighestAccount();
System.debug(accId);


Set<Id> Ids = DMLExamples.updateContacts();
if(!Ids.isEmpty()){
    System.debug('Contact Ids ' + Ids);
}else{
    System.debug('Sartları sağlayan contact recordu bulunamamıstır');
}



Id oppId = DMLExamples.createTaskForTopAmountOpportunity();

if(oppId != null ){
    System.debug('Opportunity Id ' + oppId);
}else{
    System.debug('Record bulunamamıstır');
}

Contact con = DMLExamples.createContactRelatedAccount('United Oil & Gas Corp.');

if(con != null ){
    System.debug('Contact Id ' + con);
}else{
    System.debug('Record bulunamamıstır');
}