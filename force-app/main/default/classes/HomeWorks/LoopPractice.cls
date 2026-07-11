// Create a class named LoopPractice with the following method:
// The method should take one integer argument - let’s call it num. Then, it should find and print all the factors of num using debug logs.
// A factor is a number which divides another number with no remainder.
// Examples:
// When num is 6, the factors are: 1, 2, 3, 6
// When num is 10, the factors are: 1, 2, 5, 10
// When num is 13, the factors are: 1, 13
// When num is 48, the factors are: 1, 2, 3, 4, 6, 8, 12, 16, 24, 48
// Feel free to use any kind of control flow structure and use an anonymous apex file to execute the method.


public class LoopPractice {
    public void findFactors(Integer num){
        for(integer i = 1; i <= num; i++){
            integer mod1 = Math.mod(num,i);
            if (mod1 == 0){
                System.debug(i);
            }
        }
    }

}