public class ListDemo {
    //pass index number in parameter
    //return the candidate at THAT inde
    public static string candidateList(Integer i){
        List<String> listCandidates = new list<string>();
        listCandidates.add('Mark');
        listCandidates.add('Elon');
        listCandidates.add('Bill');
        listCandidates.add('Mark');
        System.debug('candidates ==> ' + listCandidates);
        
        string candidate = listCandidates[i];//.get(i);
        // check if i (parameter) < size
        if (i < listCandidates.size() ){
            candidate = 'No value found. Try again later ';
        }
        return candidate;
    }

    public static void randomIntegerList(){
        List<Integer> listInteger = new List<Integer>();
        listInteger.add(10);
        listInteger.add(15);
        listInteger.add(21);
        listInteger.add(15);
        listInteger.add(15);
        System.debug('random integer list ==> ' + listInteger);
        Integer index3value = listinteger.get(3);
        //OR
        Integer index3value2 = listInteger[3];
        System.debug('value at index 3 ==> ' + index3value);
        System.debug('value at index 3, again ==> ' + index3value2);
        
    }



}