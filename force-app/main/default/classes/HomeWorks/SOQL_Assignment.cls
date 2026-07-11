// Create an Apex Class SOQL_Assignment
// Create a static method soql_WhereClause
// Create a variable lstcontact which is list<Contact>.
// Write an SOQL statement which gets all contact records where lastname contains string ‘A’.
// Display the size of the variable.
// Create a static method soql_formethod
// Create a variable lstcontact which is list<Contact>.
// Write an SOQL statement which gets all contact records with fields Lastname,phone number.
// Display the data of each record Lastname and phone number in for loop


// Create a SOQL_Assignment.apex
// Call the soql_WhereClause
// Call the soql_formethod

public class SOQL_Assignment {
    public static void soql_WhereClause(){
        List<Contact> lstcontact = [SELECT Id
                                    FROM Contact
                                    WHERE Name LIKE 'A%'];

        System.debug('Size of lstcontact is ' + lstcontact.size());
    }

    public static void soql_formethod(){
        List<Contact> lstcontact = [SELECT Id, LastName, Phone
                                    FROM Contact];
        for(Contact con : lstcontact){
            System.debug('Lastname --> ' + con.LastName + 'Phone number --> ' + con.Phone);
        }
    }

}