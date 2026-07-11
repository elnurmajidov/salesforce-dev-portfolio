// Assignment-5_ Parameterized Methods

// Create a class named GeometricCalculation
// Create a method named calcPerimeter.
// This method should accept two integer parameters and should return a string.
// For example: when the inputs are 14 and 20; the perimeter should be 2x(14+20)=68.Thus, the return should be: ‘The perimeter is 68 meters.’
// Create a method named calcVolume
// This method should accept three decimal parameters and should return a decimal.
// ▪ For example: when the inputs are 4.4, 6.02 and 1.25; the volume should be 33.11(multiply all three). Thus, the return should be: 33.11
// Create a method named containsZero
// This method should accept three integer parameters and should return a boolean.
// Inside the method, find the sum of integers and check if the sum value contains the number zero.
// HINT:
// https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_string.htm#apex_System_String_valueOf_5
// Example-1: inputs are 7, 84, 29. Sum is 120. Thus, the return should be: true
// Example-2: inputs are 10, -315, 4398. Sum is 4093. Thus, the return should be: true
// Example-3: inputs are 61, 41, 73. Sum is 175. Thus, the return should be: false
// Create an Anonymous apex file to execute the methods. Use the returning values in system.debug statements and produce logs.

public  class GeometricCalculation {
    public String calcPerimeter (Integer x, Integer y){
        integer Perimeter = 2 * (x + y);
        String result = 'The Perimeter is ' + Perimeter + ' meter.';
        return result;
    }

    public Decimal calcVolume(Decimal x, Decimal y, Decimal z){
        Decimal volume = x * y * z;
        return volume;
    }
    public Boolean containsZero(Integer x, Integer y, Integer z){
        integer sum = x + y + z;
        String sumString = string.valueOf(sum);
        Boolean result = sumString.contains('0');
        return result;
    }
}