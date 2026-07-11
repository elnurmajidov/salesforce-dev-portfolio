// Create a class named ListSetPractice
// Create a static method named removeDups
// This method should accept a list of String and return a set of String.
// Inside the method, use a System.debug (just before the return statement) to print how many duplicate values there were inside the input list.
// In an anonymous Apex file, create a list of String (with duplicate values) and call removeDups.

// Example execution:
// List<String> strList = new List<String>{'Apple', 'Banana', 'Cherry', 'Banana', 'Dragonfruit', 'Cherry'};
// Set<String> strSet = ListSetPractice.removeDups(strList);
// System.debug('The created set is: ' + strSet);

// The output should be:
// Number of duplicates: 2
// The created set is: {Apple, Banana, Cherry, Dragonfruit}

public class ListSetPractice {

    public static Set<String> removeDups(List<String> strList) {
        
        // List'i Set'e çeviriyoruz (duplicate otomatik silinir)
        Set<String> strSet = new Set<String>(strList);
        
        // Duplicate sayısını hesaplıyoruz
        Integer duplicateCount = strList.size() - strSet.size();
        
        // Debug ile yazdırıyoruz
        System.debug('Number of duplicates: ' + duplicateCount);
        
        // Set'i geri döndürüyoruz
        return strSet;
    }

    
}