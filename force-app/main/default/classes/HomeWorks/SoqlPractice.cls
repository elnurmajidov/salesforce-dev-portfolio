// Create a class named SoqlPractice.
// Create a static method named topOpportunites.
// The method returns a list of top 5 Opportunities by Amount, including Opportunity Names and Stages.

// Create a static method named fetchOppDetails.
// Write a query which gets all Opportunities whose Name begin with ‘E’.
// The query should include Opportunity Name, Close Date and Stage.
// The method should return a list of Opportunities.


// Create an anonymous Apex file.
// Call topOpportunites and print the list using a for loop.	
// Call fetchOppDetails and print the size of the returning list. Also, print the details (fields) for all the elements using a loop

public class SoqlPractice {
    // public static List <Opportunity> topOpportunites (){
    //     return [SELECT Name, StageName, Amount FROM Opportunity ORDER BY Amount DESC LIMIT 5];
    // }

    // public static List <OpportunityDetails> fetchOppDetails(){
    //     List <OpportunityDetails> oppDetailsList = new List <OpportunityDetails>();
    //     List<Opportunity> opportunities = [SELECT Name, CloseDate, StageName
    //                                        FROM Opportunity
    //                                        WHERE Name
    //                                        LIKE 'E%'];
                                
    //     for(Opportunity opp : opportunities){
    //         OpportunityDetails oppDetails = new OpportunityDetails();
    //         oppDetails.opportunityName = opp.Name;
    //         oppDetails.closeDate = opp.CloseDate;
    //         oppDetails.stage = opp.StageName;
    //         oppDetailsList.add(oppDetails);
    //     }
    //     return oppDetailsList;
    // }

        public static List<Opportunity> topOpportunities() {

        List<Opportunity> oppList = [
            SELECT Name, StageName, Amount
            FROM Opportunity
            ORDER BY Amount DESC
            LIMIT 5
        ];

        return oppList;
    }


    public static List<Opportunity> fetchOppDetails() {

        List<Opportunity> oppList = [
            SELECT Name, CloseDate, StageName
            FROM Opportunity
            WHERE Name LIKE 'E%'
        ];

        return oppList;
    }
}