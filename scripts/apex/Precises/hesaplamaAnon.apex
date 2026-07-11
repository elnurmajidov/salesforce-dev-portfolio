Hesaplama h = new Hesaplama();
integer k = 5;
integer l = 14;
System.debug(h.toplama(k, l));
Decimal elnur = h.ortalama(k, l);
System.debug(k + ' ve ' + l + ' sayilarinin ortalamasi = ' + elnur);


public class ListForEachLoop {
    public static list<string> toCaps(List<string> lst){
        List<string> newList = new List<string>();
        for(string eachStr : lst){
            System.debug(eachStr);
            string caps = eachStr.capitalize();
            newList.add(caps);
        }
        return newList;
    }
    public static void printAge(List<date> dts){
        date todayDate = date.today();
        for(date d : dts){
            System.debug(d);
            integer days = d.daysBetween(todayDate);
            Integer yas =integer.valueOf(days/365);
            System.debug('Yas = ' + yas);
        }
    } 
}

List<string> ls = new List<string>{'ali', 'veli', 'selami'};
List<string> ls2 = ListForEachLoop.toCaps(ls);
System.debug(ls2);

List<date> birthDateList = new List<date>();
date dt1 = date.newInstance(2006, 5, 2);
date dt2 = date.newInstance(1982, 4, 13);
date dt3 = date.newInstance(2011, 10, 10);
birthDateList.add(dt1);
birthDateList.add(dt2);
birthDateList.add(dt3);

ListForEachLoop.printAge(birthDateList);