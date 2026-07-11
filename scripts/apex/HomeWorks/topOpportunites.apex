// Create an anonymous Apex file.
// Call topOpportunites and print the list using a for loop.	
// Call fetchOppDetails and print the size of the returning list. Also, print the details (fields) for all the elements using a loop

List<Opportunity> topList = SoqlPractice.topOpportunities();

for(Opportunity opp : topList) {
    System.debug('Name: ' + opp.Name +  ' | Stage: ' + opp.StageName + ' | Amount: ' + opp.Amount); 
}

List<Opportunity> eList = SoqlPractice.fetchOppDetails();
System.debug('Size: ' + eList.size());

for(Opportunity opp : eList) {
    System.debug('Name: ' + opp.Name + ' | CloseDate: ' + opp.CloseDate + ' | Stage: ' + opp.StageName);
}