// Create a class CollectionAssignment

// Create a set<String> countriesSet to store countries India, USA, Russia, Germany,
// Singapore, Japan.

// Create a method (printLowercase)to print all countries name is lowercase
// Iterate setlist and convert each string to lowercase then add to list
// b. Print the list

// Create a method (printUppercase) to print all countries name is uppercase
// Iterate setlist and convert each string to uppercase then add to list
// Print the list

// Create an anonymous CollectionAssignment.apex
// CollectionAssignment ca = new CollectionAssignment ();
// Ca. printLowercase();
// Ca. printUppercase ();

public class CollectionAssignment {
    public set<string> countriesSet = new set<string>{'India', 'USA', 'Russia', 'Germany', 'Singapore', 'Japan'};
    public void printLowercase(){
       List <string> lowerCaseList = new list<string>();
       for(string country: countriesSet){
        lowerCaseList.add(country.toLowerCase());
       }
       System.debug('LowerCase List: ' + lowerCaseList);
    }
    // To Capitalize
    public void printUpperCase(){
        list<string> upperCaseList = new list<string>();
        for(string country: countriesSet){
            upperCaseList.add(country.toUpperCase());
        }
        System.debug('Upper Case List: ' + upperCaseList);
    }
    
}