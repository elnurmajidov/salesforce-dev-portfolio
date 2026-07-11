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