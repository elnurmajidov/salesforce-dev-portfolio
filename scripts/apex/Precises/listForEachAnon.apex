List<string> ls = new List<string>{'ali', 'veli', 'selami'};
List<string> ls2 =  ListForEachLoop.toCaps(ls);
System.debug(ls2);

List<date> birthDAteList = new List<date>();
date dt1 = date.newInstance(2006, 5, 2);
date dt2 = date.newInstance(1982, 4, 13);
date dt3 = date.newInstance(2011, 10, 10);
birthDAteList.add(dt1);
birthDAteList.add(dt2);
birthDAteList.add(dt3);