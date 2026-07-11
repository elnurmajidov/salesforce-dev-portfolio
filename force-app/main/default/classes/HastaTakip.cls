public class HastaTakip {
    // class variable
    private String hastaAdi;
    Integer hastaYasi; // default olarak private tanımlıdır
    String hastalik;
    public String hastaneAdi = 'Acıbadem';

    // constructor
    // Classdan obje olusturdugumuzda calısan ilk method
    public HastaTakip(){
        System.debug('Hello Default Constructor');
    }
    // overloading
    public HastaTakip(String isim, Integer yas, String hastaligi){
       hastaAdi = isim;
       hastaYasi = yas;
       hastalik = hastaligi;  
    }

    public HastaTakip(String hastaAdi, Integer hastaYasi){
        // Eğer classvariable adı ile parametre adı aynıysa classvariable ı this ile tanımlamalıyız
        this.hastaAdi = hastaAdi;
        this.hastaYasi = hastaYasi;
        this.hastalik ='Bilinmiyor';
    }

    // getter method
    public String getHastaAdi(){
        // return hastaAdi
        return this.hastaAdi.toUpperCase();
    }

    // setter method
    public void setHastaAdi(String hastaAdi){
        if(hastaAdi.length() >= 3){
            this.hastaAdi = hastaAdi;
        }else{
            System.debug('HastaAdi yanlıs girilmiştir.');
        }
    }

    public Integer getHastaYasi(){
        return this.hastaYasi;
    }

    public void setHastaYasi(Integer hastaYasi){
        this.hastaYasi = hastaYasi;
    }

    public String getHastalik(){
        return this.hastalik;
    }

    public void setHastalik(String hastalik){
        this.hastalik = hastalik;
    }


   
    // public void exampleMethod(){
     //local variable
    //     String name = 'XXXXXX';
    //     Integer age =35;
    // }
}