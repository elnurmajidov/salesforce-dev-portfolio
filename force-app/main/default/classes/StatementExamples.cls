public with sharing class StatementExamples {
    // Time type ından bir parametre alan bir method create edin eğer: 
// Saat 10:00'dan azsa, bir "Günaydın" selamlaması oluşturun, 
// saat 20:00'den azsa, bir "İyi günler" selamlaması, 
// diğer durumlarda bir "İyi akşamlar" selamlaması oluşturun .
// ve sonucu return etsin

    public String greetingTime(Time myTime){
        Integer myHour = myTime.hour();
        String greeting;
        if(myHour < 10){
            greeting = 'Gunaydın';
        }else if ( myHour < 20){
            greeting = 'Iyi gunler';
        } else{
            greeting = 'Iyi aksamlar';
        }

        return greeting;
    }

    //Parametredeki meyveye göre meyvenin fiyat bilgisini dönen bir parametreli method create edin.
    // Switch statement kullanın. 

    // Orange=0.59 
    // Apple=0.32 
    // Banana=0,48 
    // Cherry=3,00
    // Mango=2.79 
    // Watermelon=6,89

    public String switchMethod(String fruit){
        String result;
        switch on fruit{
            when 'Orange'{
                result = 'Potakalın fiyatı 0.59 pound';
            }
            when 'Apple'{
                result = 'Elmanın fiyatı 0.32 pound';
            }
            when 'Banana'{
                result ='Muzun fiyatı 0.48 pound';
            }
            when 'Cherry'{
                result ='Kirazın fiyatı 3.00 pound';
            }
            when 'Mango'{
                result ='Mango fiyatı 2.79 pound';
            }
            when 'Watermelon'{
                result ='Karpuz fiyatı 6.89 pound';
            }
            when else{
                result = 'Aradığınız urun bulunmamaktadır';
            }
        }
        return result;
    }


// Verilen bir telefon numarasının Istanbul anadolu mu yoksa Avrupa yakasına mı yoksa başka bir sehre mi ait oldugunu 
    // bulan ve sonucu return eden bir method yazalım
    //212 3445566
    //216 3445566

    public static String phoneNumber(String no){
        // Oncelikle parametredeki bilginin telefon numarası olup olmadıogını anlamalıyım( rakamlardan olusup olusmadıgını  , karakter sayısı kontrolu)
        // gercek bir telefon numarsı ise hangi bolgeye ait oldugunu bulmalıyım.

        Integer haneSayisi = no.length();
        String sonuc;

        // nested if else
        if(haneSayisi == 10 && no.isNumeric()){
            // Telefon numarasının nereye ait oldugunu belirle
            String alanKodu = no.substring(0,3);
            if(alanKodu == '216'){
                sonuc = no + ' telefon numarası İstanbul Anadolu yakasına aittir. ';
            }else if(alanKodu == '212'){
                sonuc = no + ' telefon numarası İstanbul Avrupa yakasına aiitir.';
            }else{
                sonuc = no + ' telefon numarası İstanbul dısında bir ile aittir.';
            }
        }else{
            sonuc = 'Verilen telefon numarası uygun formatta değildir.';
        }
        return sonuc;

    }

    // tas-kağıt-makas 
    // kağıt tası sarar // kazanan kağıt
    // tas makası kırar // kazanan taş
    // makas kağıgı keser // kazanan makas

    // kullanıcıların seçimlerini parametre olarak alan ve kazananı return eden bir method yazalım

    public static String tasKagitMakas(String oyuncu1 , String oyuncu2){
        String sonuc;

        String kagit = 'kağıt';
        String tas = 'taş';
        String makas = 'makas';

        if( (oyuncu1 == kagit && oyuncu2 == tas) || (oyuncu1 == tas && oyuncu2 == makas) || (oyuncu1 == makas && oyuncu2 == kagit) ){
            sonuc = 'Oyuncu1 kazandı.';
        }else if( (oyuncu2 == kagit && oyuncu1 == tas) || (oyuncu2 == tas && oyuncu1 == makas) || (oyuncu2 == makas && oyuncu1 == kagit) ){
            sonuc = 'Oyuncu2 kazandı.';
        }else if( (oyuncu1 == tas && oyuncu2 == tas) || (oyuncu1 == kagit && oyuncu2 == kagit) || (oyuncu1 == makas && oyuncu2 == makas)){
            sonuc = ' Beraberlik.';
        }else{
            sonuc = 'Hatalı parametre girildi.';
        }
        return sonuc;

    }


}