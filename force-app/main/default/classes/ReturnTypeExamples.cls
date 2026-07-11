public class ReturnTypeExamples {
    //    Parametrede verilen doğum tarihine göre kişinin yaşını hesaplayan ve return eden method yazalım
    public Integer yasHesepla(Date dogumTarihi){

        Date today = Date.today();
        // 1. yol (eksik)
        // Integer year = today.year(); //2026
        //Integer birthofYear  = dogumTarihi.year() ; 
        // Integer  age = year- birthYear

        // 2.yol
        Integer differenceOfDays = dogumTarihi.daysBetween(today);
        Integer age = differenceOfDays/365;
        return age;
    }

    // Parametrede fahrenayt olarak verilen bir sıcaklığı celcius a ceviren methodu yazalım

    public Decimal convertCelcius(Decimal fahrenayt){
        // Temperature in degrees Celsius (°C) = (Temperature in degrees Fahrenheit (°F) - 32) * 5/9.

        Decimal celcius = (fahrenayt-32) * 5/9 ;
        return celcius.setScale(2);
        // return (fahrenayt-32) * 5/9;
    }


}