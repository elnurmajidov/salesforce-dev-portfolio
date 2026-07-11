public class Calculator {
    public void welcomeMessage(){
        System.debug('welcome to apex calc, update');
    }



    //default acces modifier ==> private
    //private -> is accessible only inside the class. NOT OUTSIDE.
    public void printNewMessage(string msg){
        System.debug(msg);
    }
     
    //return type = string
    //parameter type = string (only1)
    public String printAndReturnMessage(string m){
        string returnStr = ' ';
        system.debug('message is ' + m);
        returnStr = m + '...Ok Cool';
        return returnStr;
    }

    public integer add(integer a, integer b){
        integer sum = a + b;
        return sum;
    }
    
    public static Integer add(list<integer> intList){
        Integer sum = 0;
        System.debug(intList);
        return sum;
    }
}