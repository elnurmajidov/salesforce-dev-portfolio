// Assignment-3_String Datatype

// Create a new class String_Assignment.
// Create a variable localString and initialize it with value
// String localString = ‘Thanks for the session on the string’

// Create a variable and find out the length of the localString variable and display the length.
// Create a variable and convert the localString variable to upper case and display the same.
// Create a variable and check string “session” is present in localString variable or not.
// Create a variable and check string “sessions” is present in localString variable or not.
// Create a variable and check if “SESSION” is present in localString variable or not.

// Create an Anonymous
//   Execute the method and display them on debug log.
public class String_Assignment {
    public void String_Assignment() {
        String localString = 'Thanks for the session on the string';
        Integer strLength = localString.length();
        System.debug('String length ' + strLength);

        String strUpperCase = localString.toUpperCase();
        System.debug('==String UpperCase==' + strUpperCase);

        Boolean sessionContains = localString.contains('session');
        System.debug('sessionContains' + sessionContains);

        Boolean sessionsContains = localString.contains('sessions');
        System.debug('sessionsContains' + sessionsContains);
    
        Boolean sessionContains1 = localString.contains('SESSION');
        System.debug('== sessionContains1 == ' + sessionContains1);

    }
}