Set<Integer> s1;
System.debug(s1);

Set<Integer> s2 = new Set<Integer>();
System.debug(s2);

//bu methoda uygulanmiyor cungu degeri null
// Boolean emptyResult1 = s1.isEmpty();
// System.debug(emptyResult1);

Boolean emptyResult2 = s2.isEmpty();
System.debug(emptyResult2);

set<string> hayvanlar = new set <string>();
hayvanlar.add('kus');
hayvanlar.add('kedi');
hayvanlar.add('kopek');

Boolean result1 = hayvanlar.contains('kopek');
System.debug('kopek setimin icinde vsrmi ? ' + result1);

Boolean result2 = hayvanlar.contains('inek');
System.debug('inek setimin icinde vsrmi ? ' + result2);

set<string> hayvanlar2 = new set<string>();
hayvanlar2.add('kus');
hayvanlar2.add('kedi');
hayvanlar2.add('kopek');
hayvanlar2.add('aslan');
hayvanlar2.add('ari');
hayvanlar2.add('balik');

Boolean result3 = hayvanlar2.containsAll(hayvanlar);
System.debug('hayvanlar seti hayvanlar2 setimin icinde varmi ? ' + result3);

System.debug(hayvanlar);
integer sayi = hayvanlar.size();
System.debug('hayvanlar setindeki hayvan sayisi = ' + sayi);

hayvanlar.clear();
System.debug(hayvanlar);

integer sayi2 = hayvanlar.size();
System.debug('hayvanlar setindeki hayvan sayisi clear metodundan sonra = ' + sayi2);


