public class CalculatorAgain {
    public static Integer sumofPositiveIntegers(Integer n){
        if (n < 0){
            System.debug('We are not calculaHng the sum for negaHve numbers');
            return null;
        }
        Integer sum = 0;
        for (Integer i = 1; i <= n; i++) {
            sum = i + sum;
            
        }
        return sum;
    }
    public static Integer multiplicationTable(Integer num){
        Integer multi = 1;
        for(Integer i=1; i<=num; i++){
            multi = i*num;
            System.debug(multi);
        }
        return multi;
    }
    public static Integer sumOfSquares(integer i){
        integer square = i * i;
        return square;
    }

}