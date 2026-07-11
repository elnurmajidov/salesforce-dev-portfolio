// Create a class named ListPractice
// Create a static method named findDay which accepts one integer parameter and returns string
// Create a variable named lstDays which is a List<String>
// Add all days into the lstDays: Monday through Sunday.
// Create a string variable named outputDay
// Based on the method’s parameter, the value of outputDay needs to be assigned using lstDays. For example; if the parameter is 6, outputDay should be ‘Saturday’.
// If the parameter is greater than the size of lstDays or zero or negative, throw an error message as ‘Not a valid day’.
// Return outputDay.

// Create an anonymous Apex, call the findDay method with following parameters and observe the respective outputs:
// findDay(2) → Tuesday
// findDay(7) → Sunday
// findDay(0) → Not a valid day
// findDay(-8) → Not a valid day

public class ListPractice {
    public static String findDay(integer dayNumber){
        List<string> lstDays = new List<string>{
        'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'};
        
        String outputDay = 'Not a valid day';

        if(dayNumber > 0 && dayNumber <= lstDays.size()){
            outputDay = lstDays[dayNumber - 1];
        }

        return outputDay;
    }
//====================================================//==================================//

// Create a class named ListPractice

// Create a method called listMethods
// Try to use all the methods of List using below list-{'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'}
// Use the below link for all list methods
// https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_list.htm

   public static void listMethods(List<string> days){
    System.debug('days ==>' + days);
        //ADD 
        days.add(7, 'Sunday');
        System.debug('Adding Sunday at 7 index ==> ' + days);
        List<String> remainingDays = new List<string>();
        //CONTAINS //ADD
        remainingDays.add('Friday');
        remainingDays.add('Saturday');
        days.addAll(remainingDays);
        System.debug('Adding remainingDays ==> ' + days);
        System.debug('List contains Sunday' + days.contains('Sunday'));
        System.debug('List contains Batch32Day ==> ' + days.contains('Batch32Day'));
        
        //GET Index
        System.debug('get(2) = ' + days.get(2)); //It will be Tuesday
        System.debug('Value at 0 index ==> ' + days.get(0));
        System.debug('Value at 6 index ==> ' + days.get(6));

        //SET Index
        days.set(4, 'Thursday Updated');
        System.debug('After set (4, Thursday Updated) =' + days);
        days.set(5, 'Friday');
        System.debug('Replacing Batch32Day with Friday at 5 index ==> ' + days);

        //IS EMPTY
        System.debug('IS this list Empty ==> ' + days.isEmpty());

        // REMOVE
        System.debug('Remove element from 5 index ==> ' + days.remove(5));
        System.debug('List after romoving element ==> ' + days);

        //SIZE
        System.debug('Size of list is ==> ' + days.size());

        //SORT
        days.sort();
        System.debug('List after Sort ==> ' + days);
        System.debug('List value of list ==> ' + days.toString());
        
   }

// ●  Use the ListPractice class (create if you haven’t) and add a new method named sortDesc()
//  ○  The method should take an argument of List<String> and also should return a List<String>.
//  ○  The returned list (result) should contain the same elements of the input string in reverse alphabetical order.
// ●  In anon apex, create the following lists of fruits: Cherry, Mango, Strawberry, Banana, Watermelon, Apple, Orange, Tangerine
//  ○  Pass this list to the sortDesc() method and get the result list.
//  ○  Show that the result list looks like below:
// Watermelon, Tangerine, Strawberry, Orange, Mango, Cherry, Banana, Apple
// Some useful link:
// ●  https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_li st.htm#apex_System_List_methods

   public static List <string> sortDesc (List <string> inputList){

        inputList.sort();

        //Keep original list
        List<string> reversedList = new List<string>();
        integer sizeOfList = inputList.size()-1;
        for(integer i = sizeOfList; i >= 0; i--){
            reversedList.add(inputList.get(i));
        }
        return reversedList;
    }  
}