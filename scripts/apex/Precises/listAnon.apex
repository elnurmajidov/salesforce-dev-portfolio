List<String> alisverisListesi = new List<string>();
alisverisListesi.add('Ekmek');
alisverisListesi.add('Yumurta');
alisverisListesi.add('Peynir');
alisverisListesi.add('Zeytin');
alisverisListesi.add('Bal');

System.debug(alisverisListesi);
System.debug(alisverisListesi.get(0));
System.debug(alisverisListesi.get(3));

List<date> birthDateList = new List<date> ();
date dt1 = date.newInstance(2005, 5, 5);
birthDateList.add(dt1);
date dt2 = date.newInstance(1005, 2, 1);
birthDateList.add(dt2);
date dt3 = date.newInstance(1905, 4, 1);
birthDateList.add(dt3);

System.debug(birthDateList);

birthDateList.sort();
System.debug(birthDateList);