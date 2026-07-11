public class SetDemo {
    public static void citySet(){
        set<string> cities = new set<string>();
        cities.add('Tokyo');
        cities.add('Lisbon');
        cities.add('Berlin');
        cities.add('Nairobi');
        cities.add('Tokyo');
        cities.add('BERLIN');
        cities.add('Nairobi');

        System.debug('city set: ' + cities);
    }

    public static void randomIntegerSet(){
        Set<integer> insSet = new Set<integer>();
        insSet.add(10);
        insSet.add(15);
        insSet.add(21);
        insSet.add(15);
        insSet.add(15);
        insSet.add(15);
        System.debug('set of integers ' + insSet);
    }

    //  create a method which accepts a list<integer>
    //we will return set<integer>
    //list might have dublicate values
    //when we return set<integer> duplicates will be removed
    public static set<integer> setFormList(list<integer> listInt){
        //create empty set to add all the elements of list
        Set<integer> returnSet = new set<integer>();
        //use .addAll(list_or_set) method to add all the elements from list to set.
        returnSet.addAll(listInt);
        return returnSet;
    }

    // we will create method to convert set to uppercase
        //our method will accept set<string>
        //return set<string> by converting each element to upperCase
    public static set<string> upperCaseSet(set<string> setStr){
        // prepare empty set in which we will add uppercase strings.
        set<string> upperSet = new set<string>();

        //for each loop of set
        for (string eachStr : setStr){
            string tempStr = eachStr.toUpperCase();
            upperSet.add(tempStr);
        }
        return upperSet;
    }
}