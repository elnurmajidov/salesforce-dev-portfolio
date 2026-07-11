public class StringExamples {
    public void selam(){
        System.debug('Hoşgeldin!');
    }
    //parametre methodu dinamik yapar
    public void selam(String name){
        System.debug('Hoşgeldin! ' + name);
    }

    // public void toplama(Integer num1 , Integer num2){
    //    Integer toplam = num1 + num2;
    //    System.debug(toplam);
    // }
    public Integer toplama(Integer num1 , Integer num2){
       Integer toplam = num1 + num2;
    //    System.debug(toplam);
       return toplam;
    }

    // Parametrede verilen text ifadenin kaç karakterden olustugunu return eden bir method yazalım.

    public Integer karakterSayiHesabi(String text){
        Integer karakterSayisi = text.length();
        return karakterSayisi;
    }

// Parametrede bir tamsayı değeri alsın ve bu sayının kaç basamaklı oldugu bilgisini 
    // Girmiş olduğunuz XXXXXX sayısı Y basmaklıdır şeklinde return etsin.

    public String basamakHesabi(Integer num){
        String convertedString = String.valueOf(num); //'12345' gibi bir değer
        Integer karakterSayisi = convertedString.length(); 
        String mesaj = 'Girmiş olduğunuz ' + num + ' sayısı ' + karakterSayisi + ' basamaklıdır.';
        return mesaj;
    }

}