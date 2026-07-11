public class SetExamples {
    //    Parametre olarak integer bir list alan method yazalım. Bu methodumuz bize liste içerisindeki çift sayıları set olarak return etsin.
    public static Set<Integer> findEvens(List<Integer> numbers){
        Set<Integer> evenNumbers = new Set<Integer>();
        Set<Integer> oddNumbers = new Set<Integer>();
        for(Integer num : numbers){
            if(Math.mod(num,2) == 0){
                evenNumbers.add(num);
            }else{
                oddNumbers.add(num);
            }
        }
        System.debug('TEK SAYILAR ' + oddNumbers);
        System.debug('ÇIFT SAYILAR ' + evenNumbers);
        return evenNumbers;
    }

    public static Set<Decimal> findPricesInRange(List<Decimal> prices, Decimal min, Decimal max){
        Set<Decimal> filteredPrices = new Set<Decimal>();
        for(Decimal price : prices){
            if(price>min && price<max){
                filteredPrices.add(price);
            }
        }

        return filteredPrices;
    }
}