Map<string, string> postaKodlari = new Map<string, string>();
postaKodlari.put('34001', 'istanbul');
postaKodlari.put('34085', 'izmir');
postaKodlari.put('34043', 'adana');
postaKodlari.put('34076', 'trabzon');

System.debug(postaKodlari);

Map<string, integer> m1 = new Map<string, integer>();
m1.put('bir', 1);
m1.put('iki', 2);
m1.put('uc', 3);
m1.put('dort', 4);

System.debug(m1);

Map<integer, String> m2 = new Map<integer, string>();
m2.put(5, 'bes');
m2.put(6, 'alti');
m2.put(7, 'yedi');
m2.put(8, 'sekkiz');

System.debug(m2);



Map<string, List<string>> m3 = new Map<string, List<string>>();
list<string> ulke1 = new list<string> {'istanbul', 'ankara', 'izmir', 'trabzon'};
m3.put('Turkiye => ', + ulke1);

list<string> ulke2 = new list<string> {'Berlin', 'Stutgart', 'Hannover', 'Hamburg' };
m3.put('Germany => ', ulke2);

list<string> ulke3 = new list<string> {'NewYork', 'Boston', 'Chicago', 'Huston' };
m3.put('USA => ', ulke3);

list<string> ulke4 = new list<string> {'Baki', 'Qusar', 'Quba', 'Xizi' };
m3.put('Aerbaijan => ', ulke4);

System.debug(m3);

Map<string, integer> itemQuantityMap = new Map<string, integer>();
itemQuantityMap.put('Apple', 5);
itemQuantityMap.put('Orange', 6);
itemQuantityMap.put('Fotball', 1);
itemQuantityMap.put('LED', 3);
itemQuantityMap.put('Notebooks', 12);
itemQuantityMap.put('Pen', 25);

System.debug(itemQuantityMap);

string itemOne = 'Apple';
integer itemOneValue = itemQuantityMap.get(itemOne);

System.debug(itemOne + ' keyine ait value = ' + itemOneValue);

System.debug(' LED keyine ait value = ' + itemQuantityMap.get('LED'));


string itemTwo = 'Orange';
Boolean check = itemQuantityMap.containsKey(itemTwo);
if(check){
    System.debug(itemTwo + ' keyine ait value = ' + itemQuantityMap.get(itemTwo));
} else{
    System.debug(itemTwo + ' keyi map listenizde bulunmamaktadir..');
}

Set <string> itemKeys = itemQuantityMap.keySet();
System.debug('Mape ait keyler = ' + itemKeys);

List<integer> itemsValues = itemQuantityMap.values();
System.debug(' Mape ait valueler + ' + itemsValues);

integer sum = 0;
for(integer besira :itemsValues){
    sum += besira;
}

System.debug('Mapteki Valuelar toplami = ' + sum);
