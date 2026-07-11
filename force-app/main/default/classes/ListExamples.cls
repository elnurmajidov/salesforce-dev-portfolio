public class ListExamples {
    // Parametrede integer sayılardan olusan bir liste versin.
    // 1. Listedeki en kucuk sayı bulunsun, debug edilsin
    // 2. Listede verilen sayılar toplanıp , toplam return edilsin

    public static Integer sumOfNumbers(List<Integer> numbers){

        if(!numbers.isEmpty() && numbers != null){
            // 1.Yol
            numbers.sort();
            Integer enKucukSayi = numbers.get(0);
            System.debug(enKucukSayi);
    
            // 2.Yol
            Integer smallestNumber = numbers[0];
            Integer sum = 0;
            for(Integer num : numbers){
                if(num < smallestNumber){
                    smallestNumber = num; // Daha kucuk bir sayi bulursa smallestNumberı update ediyor
                }
                sum +=num; // sum = sum + num
            }
            System.debug('smallestNumber ' + smallestNumber);
            
            // Integer sum = 0;
            // for(Integer num : numbers){
            //     sum +=num; // sum = sum + num
            // }
            
            return sum;

        }else{

            return null;
        }

    }

    //Listede verilen isimlerin herbirinin kac karakter oldugunu belirten bir metod yazalim.

    public static void calculateCharactersSize(List<String> names){
        if(!names.isEmpty() && names != null){
            for(String name : names){
                System.debug(name + 'ismi ' + name.length() + 'Karakterlidir. ');
            }
        }else{
            System.debug('Parametrede isim bulunmamaktadir');
        }
    }
}