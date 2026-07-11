//Create a Map
Map <Integer, String> zipCodeToCityMap = new Map <Integer, String> ();
// Adding adata in to map
zipCodeToCityMap.put(15209, 'Pittsburgh');
zipCodeToCityMap.put(11229, 'Brooklyn');
zipCodeToCityMap.put(31162, 'Miami');
zipCodeToCityMap.put(60606, 'Chicago');
zipCodeToCityMap.put(545678, 'Seattle');

// Chec is there 204101
Boolean check1=zipCodeToCityMap.containsKey(204101);
System.debug('Bu metodun icinde 204101 varmi? ' + check1); // Method 1
System.debug(zipCodeToCityMap.containsKey(204101));        // Method 2
Boolean check2=zipCodeToCityMap.containsKey(11229);
System.debug(check2);
System.debug(zipCodeToCityMap.containsKey(60606));

// Print metod (printing all zipp in map metod)
for(Integer eachZipCode : zipCodeToCityMap.keySet()){
    System.debug(eachZipCode);}          //Metod 1
System.debug(zipCodeToCityMap.keySet()); //Metod 2

//Print method (printing all cities in map metod)
for(Integer eachZipCode : zipCodeToCityMap.keySet()){
    System.debug(zipCodeToCityMap.get(eachZipCode)); } //Method1

for(String eachCity : zipCodeToCityMap.values()){
    System.debug(eachCity); } // Method 2

//Print method (printing anumber in map metod)   
Integer sizeOfMap = zipCodeToCityMap.size();
 System.debug('The number of mapping present in the map is ' + sizeOfMap); //Method 1

System.debug(zipCodeToCityMap.size()); // Method 2

//Create a set as uniqueZipCodeSet an populate it with all the zip codes from
Set<Integer> uniqueZipCodeSet = new Set<Integer>(zipCodeToCityMap.keySet()); //Method 1

// Set <Integer> uniqueZipCodeSet = new Set<Integer>();
// for (Integer eachZipCode : zipCodeToCityMap.keySet()) { uniqueZipCodeSet.add(eachZipCode); }
// System.debug('The unique zip code set is: ' + uniqueZipCodeSet); //Method 2

//Create List as cityNameList and populate it with all the city names from zipCodeToCityMap
// List<String> cityNameList = new List<String>();
// for(Integer eachZipCode : zipCodeToCityMap.keySet()){
//     cityNameList.add(zipCodeToCityMap.get(eachZipCode)); }
//     System.debug('The city list in map: ' + cityNameList ); //Metod 1

List<string> cityNameList = new List<String>(zipCodeToCityMap.values()); //Metod 2
System.debug('Shirlerin listesi mapte: ' + cityNameList);

//Check if the zipCodeToCityMap is Empty
System.debug('Eger Bos is False & Dolu ise True yaz lutfen: ' + zipCodeToCityMap.isEmpty()); //Method1

Boolean isMapEmpty = zipCodeToCityMap.isEmpty();
System.debug('Is the city empty : ' + isMapEmpty); //Metod2

//In multiline comment list down the differences between List, Set and Map
/*
 1. List It is ordered
 2. List has an Index (0, 1, 2,...).
 3. List Dublicates are allowed
 ======================================
 1. Set is unordered
 2. Set dublicates are not allowed
 3. Set does not have an index
 ======================================
 1. Map strores data as Key > Value pairs
 2. Map Keys must be unique
 3. Map does not have an index
 4. Map values are accessed using their keys.
