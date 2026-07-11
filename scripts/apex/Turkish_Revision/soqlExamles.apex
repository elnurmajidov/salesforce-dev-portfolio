List<Account> accounts = [SELECT Id,Name FROM Account];
System.debug(accounts);

Opportunity opp = [SELECT Id,Name,StageName FROM Opportunity  LIMIT 1];
System.debug(opp);

List<Opportunity> lstOpp = [SELECT Id,Name,StageName FROM Opportunity WHERE Name ='XXXXXXX' LIMIT 1];
System.debug(lstOpp);

// ===============================

SoqlExamples.getOpportunities();

Opportunity opp = SoqlExamples.getHighestOpportunity();
System.debug(opp);

List<Opportunity> opportunities = SoqlExamples.getOpportunitiesByCloseDate();
// System.debug(opportunities);

for(Opportunity opp: opportunities){
    // System.debug(opp);
    String oppName = opp.Name;
    Date oppCloseDate = opp.CloseDate;
    Decimal oppAmount = opp.Amount;

    System.debug('Opportunity Name => ' + oppName);
    System.debug('Opportunity CloseDate => ' + oppCloseDate);
    System.debug('Opportunity Amount => ' + oppAmount);
    System.debug('================================================');
}

Account acc = SoqlExamples.getLastCreatedAccount();
System.debug(acc);


List<Opportunity> opps = SoqlExamples.getOpportunitiesByStageName('Closed Won');
System.debug(opps.size());


List<Account> accounts = [SELECT Id,Name,(SELECT Id,Name,StageName,Amount FROM Opportunities WHERE Amount > 100000),(SELECT Id,LastName,Phone FROM Contacts WHERE Phone != null) FROM Account];

for(Account acc : accounts){
    System.debug(acc);
    List<Opportunity> lstOpp = acc.Opportunities;
    List<Contact> lstCon = acc.Contacts;
    for(Opportunity opp : lstOpp){
        System.debug(opp);
        System.debug('==========================');
    }

    for(Contact con : lstCon){
        System.debug(con);
        System.debug('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
    }
}

List<Opportunity> opps = [SELECT Id,Name,Amount,Account.Name,Account.AnnualRevenue FROM Opportunity];
for(Opportunity opp :opps){
    System.debug(opp);
    Account acc = opp.Account;
    System.debug(acc);
    // Decimal accAR = acc.AnnualRevenue;
    Decimal accAR = opp.Account.AnnualRevenue;
}

// Custom Relationship Child To Parent

List<Salesforce_Ticket__c> tickets = [SELECT Id,Name,Status__c,Subject__c, Salesforce_Project__r.Project_Name__c, Salesforce_Project__r.Status__c FROM Salesforce_Ticket__c WHERE Salesforce_Project__r.Status__c = 'New'];

// System.debug(tickets);

for (Salesforce_Ticket__c st : tickets) {
    System.debug(st);
    String spStatus = st.Salesforce_Project__r.status__c;
    System.debug(spstatus);
}

// Custom Relationship Parent to Child
List<Salesforce_Project__c> projects = [SELECT Id, Name,Project_Name__c,Status__c,(SELECT Id,Status__c,Subject__c,Name FROM Salesforce_Tickets__r) FROM Salesforce_Project__c ];
// System.debug(projects);

for (Salesforce_Project__c sp : projects) {
    // System.debug(sp);
    List<Salesforce_Ticket__c> tickets = sp.Salesforce_Tickets__r;
    // System.debug(tickets);
    for(Salesforce_Ticket__c st : tickets){
        System.debug(st.status__c);
        System.debug(st.Subject__c);
        System.debug(st.Name);
    }
}
// SELECT SUM(Amount) FROM Opportunity Where sTAGEnAME ='Closed Won'
// SELECT AccountId,Count(Id) FROM Opportunity GROUP BY AccountId
// SELECT AccountId,StageName,Count(Id) FROM Opportunity GROUP BY AccountId,StageName
// SELECT LeadSource,Count(Id) FROM Lead GROUP BY LeadSource HAVING LeadSource != 'Web'

Integer result = [SELECT Count() FROM Opportunity];
System.debug(result);

AggregateResult ar = [SELECT AVG(Amount) ort, COUNT(Amount) adet , SUM(Amount) toplam FROM Opportunity WHERE StageName ='Closed Won'];
System.debug(ar);

Decimal ort = (Decimal)ar.get('ort');
System.debug(ort); //202500.0

Integer adet = (Integer)ar.get('adet');
System.debug(adet); //18

List<AggregateResult> arList = [SELECT StageName,MAX(Amount) max FROM Opportunity WHERE Amount !=null GROUP BY StageName];
System.debug(arList);