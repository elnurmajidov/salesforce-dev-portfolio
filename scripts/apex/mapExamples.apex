// Pazar alis veris listesi olusturalim
//Domates =>2,5
//Elma =>1

//Map<String, Decimal> pazarAlisVeris = new Map<String, Decimal> (); //bos bir map olusturduk
Map<String, Decimal> pazarAlisVeris = new Map<String, Decimal> {'Domates' => 2.5, 'Elma' => 1};
System.debug(pazarAlisVeris); //{Domates=2.5, Elma=1}

pazarAlisVeris.put('Patates',5);
pazarAlisVeris.put('Sogan',2.5);
pazarAlisVeris.put('Portakal',1.5);
pazarAlisVeris.put('Domates',1.5);

System.debug(pazarAlisVeris);

Decimal patatesKg = pazarAlisVeris.get('Patates');
System.debug(patatesKg); //5

Decimal domatesKg = pazarAlisVeris.get('Domates');
System.debug(domatesKg); //1.5

Boolean portakalVarmi = pazarAlisVeris.containsKey('Portakal');
System.debug(portakalVarmi); //true

Boolean karpuzlVarmi = pazarAlisVeris.containsKey('Karpuz');
System.debug(karpuzlVarmi); //false

pazarAlisVeris.remove('Sogan');
System.debug(pazarAlisVeris); //{Domates=1.5, Elma=1, Patates=5, Portakal=1.5}

Set<String> meyveSebzeler = pazarAlisVeris.keySet();
System.debug(meyveSebzeler); //{Domates, Elma, Patates, Portakal}

for(String ms : meyveSebzeler){
    System.debug(ms + '====> ' + pazarAlisVeris.get(ms));
    if(pazarAlisVeris.get(ms)>2){
        System.debug('2 kg dan agir olan meyve sebze ====> ' + ms);
    }
}

List<Decimal> msAgirlik = pazarAlisVeris.values();
System.debug(msAgirlik);

//toplam alisveris kac kilo?
Decimal total = 0;
for(Decimal kg : msAgirlik){
    total +=kg;
}
System.debug(total); //9.0 kg oluyor.
