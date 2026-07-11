public class CollectionsHandsOn {

    //Input: List of scores
    //Output: Calculate the average of the given scores
    public Integer findAverage(List<Integer> scores){      //[70, 80, 90]
        Integer sumOfElements = 0;
        Integer numberOfElements = scores.size();           // sumOfElements = 0;
        for(Integer score  :  scores) {                   // score = 70                    // score = 80                       //score = 90
            sumOfElements = sumOfElements + score;         // sumOfElements = 0+70 = 70;    // sumOfElements = 70 + 80 = 150    // sumOfElements = 150 + 90 = 240
        }
        Integer average = sumOfElements/numberOfElements;
        return average;
    }

    // Inpet: List of emails - there could be dublicates
    //Output: Unique emails
    public Set<String> getUniqueEmails(List<String> emails){
        Set<String> uniqueEmails = new Set<String>{};
        uniqueEmails.addAll(emails);
        return uniqueEmails;
    }

    //Input: Bunch of Customer Name Vs Bank Balance
    //Output: Return the customer with the highest balance.
    //Example: John Doe has the highest balance: $45000
    public String findHighestBalance(Map<String,Decimal> customerVsBalanceMap) {
        String customerName = '';
        Decimal highestBalance = 0.0;

        Set<String> customerNames = customerVsBalanceMap.keySet();
        for(String customer : customerNames){
            Decimal balance = customerVsBalanceMap.get(customer);
            System.debug(customer + 'has' + balance);
            if(balance > highestBalance) {
                highestBalance = balance;
                customerName = customer;
            }
        }
        return customerName + 'has the highest balance: ' + highestBalance;
    }
}