public class OperationsHelper {
    public static decimal largestOutTwoNumbers(Decimal number1, Decimal number2 ) {

        Decimal larger = math.max(number1,  number2);
        return larger;

        //a. Method Name – largestOutOfTwoNumbers Description - It should have two parameters that can accept two decimal numbers and should return the largest number.
        

    }

public static decimal smallestOutOfThreeNumbers(decimal num1, decimal num2, decimal num3 ){

    Decimal smaller = math.min(math.min (num1, num2), num3);
    System.debug('smaller number is ' + smaller);
    return smaller;
}

}