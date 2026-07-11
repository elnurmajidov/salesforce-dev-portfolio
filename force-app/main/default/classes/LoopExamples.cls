public class LoopExamples {
    //   1 den n ye kadar olan (parametre) sayıların toplamını hesaplayan ve return eden bir method yazalım.
    public static Integer sumNumbers(Integer n){
        Integer sum = 0;
        for(Integer i=1 ; i<=n ; i++ ){
            System.debug(' Sum  ===> ' + sum + ', i ===> ' + i );
            sum = sum + i ; // sum += i
        }
        return sum;
    }

    // Parametrede verilen sayının 10 a kadar carpım tablosunu veren bir method yazalım.

    public static void multiplaction(Integer n){
        Integer carpim;
        for(Integer i = 1 ; i<=10 ; i++){
            carpim = n * i ;
            System.debug(i + ' X ' + n + ' = ' + carpim);
        }
    }

    // Parametrede verilen sayıya kadar olan sayıların kaç tanesinin 3' e tam bolundugunu hesaplayan method yazalım ve sonucu return edelim

    public static Integer findMultipleOfThree(Integer n){
        Integer counter = 0;
        for(Integer i=1; i<=n ; i++){
            if(Math.mod(i,3) == 0){
                counter ++;
            }
        }
        return counter;

    }



}