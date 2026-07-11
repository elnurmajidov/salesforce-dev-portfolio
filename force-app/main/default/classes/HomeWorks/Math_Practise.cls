// Create one apex class (MathPractice).
// Create one method with following name:        
// Method : getAverage(num1, num2,num3)
// This method should take three parameters named as num1,num2 and num3 with Integer data type, and it should give the average of the numbers               
// Expected Outcome:
// Input: num1 = 5
// Input: num2 = 15 
// Input: num3 = 25
// Output: 15

public  class Math_Practise {
    public Decimal getAverage(Integer num1, Integer num2, Integer num3){
        Decimal avg =(num1 + num2 + num3) / 3.0;
        return avg;
    }

// Create a method named "practiceTwo" inside the "MathPractice" Class. 

// This method accepts one of the bread, bagel and cake orders (string) and the desired piece of information (integer) as parameters and returns the total amount you will pay (decimal).

// Hint: 
// a - Let's place the Variables in the message dynamically.
// b - String expressions are lower/upper case letter sensitive.
// Bread : 1$
// Bagel : 2$
// Cake : 3$
// Sample:
// 1. Parameter: 10 — 2. Parameter: BREAD
// 1. Parameter: 8 — 2. Parameter: BAGEL
// 1. Parameter: 5 — 2. Parameter: CAKE

    // public static Decimal practiceTwo(Integer pieces, String item){
    //     Decimal price = 0.0;
    //     item = item.toUpperCase();
    //     if(item == 'BREAD'){
    //         price = 1;
    //     } else if(item == 'BEGAL'){
    //         price = 2;
    //     }else if( item == 'CAKE'){
    //         pieces = 3;
    //     }else{
    //         System.debug('Invalid item: ' + item);
    //         return 0;
    //     }
    //     Decimal total = pieces * pieces;
    //     System.debug('You ordered ' + pieces + 'Total = &' + total);
    //     return total;
    //  }
        public static Decimal practiceTwo(Integer pieces, String item){
        Decimal price = 0.0;
        item = item.toUpperCase();
        if(item == 'BREAD'){
            price = pieces*1;
        } else if(item == 'BEGAL'){
            price = pieces*2;
        }else if( item == 'CAKE'){
            price = pieces*3;
        }
        return price;
    }
}