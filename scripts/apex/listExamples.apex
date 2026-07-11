//kirtasiye urunlerini iceren bir liste yapalim.

List<String> kirtasiyeListesi_0 ; //null
System.debug(kirtasiyeListesi_0);

List<String> kirtasiyeListesi_1 = new List<String>(); 
System.debug(kirtasiyeListesi_1); // bos liste

//  Kırtasiye ürünlerini tutan bir list create edin; 
// 1. Başlangıçta 3 ürünle listeyi oluşturun daha sonra 3 ürünü tek tek ekleyin. 
// 2. Liste boş mu değil mi kontrol edin 
// 3. Listede kaç eleman olduğunu yazdırın 
// 4. Listenin 2. ve 4. index teki elemanını yazdırın 
// 5. Listenin son elemanını yazdırın 
// 6. Listede Harita 'nın olup olmadığını kontrol edin 
// 7. Listedeki elemanları sıralayın 
// 8. Farklı bir liste daha oluşturun ve ilk listemizle eşit mi diye kontrol edin 
// 9. İkinci listeyi ilk listemize ekleyin 
// 10.Listenin ilk elemanını silin 
// 11.Ikinci listenin tum elemanlarini sil.
// 12.Listenin elemanlarını uppercase olarak tek tek yazdırın.

// 1. Başlangıçta 3 ürünle listeyi oluşturun daha sonra 3 ürünü tek tek ekleyin. 
List<String> kirtasiyeListesi = new List<String> {'Defter', 'Kitap','Kalem'};
System.debug(kirtasiyeListesi); //'Defter', 'Kitap','Kalem'
kirtasiyeListesi.add('Cetvel');
kirtasiyeListesi.add('Canta');
kirtasiyeListesi.add('Silgi');
System.debug(kirtasiyeListesi);//(Defter, Kitap, Kalem, Cetvel, Canta, Silgi)
                          //inde     0       1      2      3       4      5
// 2. Liste boş mu değil mi kontrol edin 
Boolean listeBosMu = kirtasiyeListesi.isEmpty();
System.debug(listeBosMu); //false

// 3. Listede kaç eleman olduğunu yazdırın 
Integer listeElemanSayisi = kirtasiyeListesi.size();
System.debug('listeElemanSayisi ' + listeElemanSayisi); //6

// 4. Listenin 2. ve 4. index teki elemanını yazdırın 
String ikinciIndexliEleman = kirtasiyeListesi.get(2);
System.debug('ikinciIndexliEleman ' +  ikinciIndexliEleman); //Kalem

//String dorduncuIndexliEleman = kirtasiyeListesi.get(4);
String dorduncuIndexliEleman = kirtasiyeListesi[4];
System.debug('dorduncuIndexliEleman ' +  dorduncuIndexliEleman); //Canta

// 5. Listenin son elemanını yazdırın 
Integer sonElemanIndex = kirtasiyeListesi.size() - 1;
String sonEleman = kirtasiyeListesi.get(sonElemanIndex);
System.debug('sonEleman ' + sonEleman); //Silgi

// 6. Listede Harita 'nın olup olmadığını kontrol edin 
Boolean haritaVarmi = kirtasiyeListesi.contains('Harita');
System.debug(haritaVarmi); //false

// 7. Listedeki elemanları sıralayın 
kirtasiyeListesi.sort();
System.debug(kirtasiyeListesi); //(Canta, Cetvel, Defter, Kalem, Kitap, Silgi)

// 8. Farklı bir liste daha oluşturun ve ilk listemizle eşit mi diye kontrol edin
List<String> yeniListe = new List<String>{'Kalemlik', 'Klasor', 'Harita'};
Boolean listelerEsitMi = kirtasiyeListesi.equals(yeniListe);
System.debug(listelerEsitMi); //false

// 9. İkinci listeyi ilk listemize ekleyin 
kirtasiyeListesi.addAll(yeniListe);
System.debug(kirtasiyeListesi); //(Canta, Cetvel, Defter, Kalem, Kitap, Silgi, Kalemlik, Klasor, Harita)

// 10.Listenin ilk elemanını silin 
String silinenEleman = kirtasiyeListesi.remove(0);
System.debug(silinenEleman); //Canta
System.debug(kirtasiyeListesi); //(Cetvel, Defter, Kalem, Kitap, Silgi, Kalemlik, Klasor, Harita)

// 11.Ikinci listenin tum elemanlarini sil.
System.debug(yeniListe); //(Kalemlik, Klasor, Harita)
yeniListe.clear();
System.debug(yeniListe); // ()

// 12.Listenin elemanlarını uppercase olarak tek tek yazdırın.

// Traditional Loop
System.debug('======TRADITIONAL LOOP===========');
for(Integer i = 0 ; i < kirtasiyeListesi.size() ; i++){
    String eleman = kirtasiyeListesi.get(i);
    System.debug(eleman.toUpperCase());
    // System.debug(kirtasiyeListesi.get(i).toUpperCase());
}

// For Each Loop
System.debug('======FOR EACH LOOP===========');
// for(ListeninElemanDatatipi loopIcındekiVariableAdı : listeAdı){}
for(String eleman : kirtasiyeListesi){
    System.debug(eleman.toUpperCase());
}

// ListClass
//List<Integer> numbers = new List<Integer>{55,67,32,11,25,99};
Integer [] numbers = new Integer [] {55,67,32,11,25,99};
Integer total = ListExamples.sumOfNumbers(numbers);
System.debug(total); //289


List<String> names = new List<String>{'Adnan','Elnur','Erkin','Gorkem','Sully','Veysel'};
ListExamples.calculateCharactersSize(names);