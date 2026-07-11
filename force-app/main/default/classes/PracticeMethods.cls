//Create a class name as PracticeMethods
    // b. Create a method refineText - takes two string parameters. Returns string. Parameter1 is message, Parameter2 is textToRemove 
    //i. remove textToRemove from message and return the new string 
    //ii. Sample
    //1. message = ‘too fast too furious’, textToRemove= ‘too’ output string: ‘fast furious’ 
    //2. message = ‘apex is really really simple’ textToRemove = ‘really’ output string: ‘apex is simple’
public  class PracticeMethods {
    public static String refineText(String message, String textToRemove) {
    
        String result = message.remove(textToRemove);
        return result;

    }
}