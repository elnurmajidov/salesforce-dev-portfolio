HastaTakip hasta1 = new HastaTakip();
String hastaneAdi = hasta1.hastaneAdi;
System.debug(hastaneAdi); //Acıbadem
hasta1.hastaneAdi = 'Medicana';
System.debug(hasta1.hastaneAdi); //Medicana

HastaTakip hasta2 = new HastaTakip('Ahmet Yılmaz',35,'Grip');
System.debug(hasta2);

HastaTakip hasta3 = new HastaTakip('Mehmet Yılmaz',48,'Kalp');
System.debug(hasta3);

HastaTakip hasta4 = new HastaTakip('Halid Ziya',64);
System.debug(hasta4);

String isim = hasta4.getHastaAdi();
System.debug(isim); //HALİD ZİYA

hasta4.setHastaAdi('Mehmed Rauf');
isim = hasta4.getHastaAdi();
System.debug(isim); // MEHMED RAUF

hasta4.setHastaAdi('Su');
isim = hasta4.getHastaAdi();
System.debug(isim); //MEHMED RAUF