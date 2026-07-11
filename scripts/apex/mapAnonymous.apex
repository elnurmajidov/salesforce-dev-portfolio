map<string, string> mapCountryCurrency = new map<string, string>();
mapCountryCurrency.put('USA', 'Dollar');
mapCountryCurrency.put('France', 'Euro');
mapCountryCurrency.put('Poland', 'Euro');
mapCountryCurrency.put('India', 'Rupees');
mapCountryCurrency.put('India', 'Rupee');
mapCountryCurrency.put('Turkiye', 'Lira');
mapCountryCurrency.put('El Salvador', 'Bitcoin');
System.debug('map of country and its currency ===> ' + mapCountryCurrency);

//get value usin g KEY from a map.
string IndiaCurrency = mapCountryCurrency.get('India');
string TurkiyeCurrency = mapCountryCurrency.get('Turkiye');
System.debug('India currency is ' + IndiaCurrency);
System.debug('Turkiye currency is ' + TurkiyeCurrency);
string FranceCurrency = mapCountryCurrency.get('France');
string ElSalvadorCurrency = mapCountryCurrency.get('El Salvador');
System.debug('France currency is ' + FranceCurrency);
System.debug('El Salvador currency is ' + ElSalvadorCurrency);

//get all keys using keyset method
set<string> countrySet = mapCountryCurrency.keySet();
System.debug('countries are' + countrySet);

list<string> currencies = mapCountryCurrency.values();
System.debug('currencies are ' + currencies);


//--for each loop of map start here

Set<String> countries = mapCountryCurrency.keySet();

//for each loop on country set

for(string eachKey: countrySet){
    //ea hKey => USA (1
    string printString = 'Country is ' + eachKey;
    //value from key from map
    //get currency of key USA
    //mapCountryCurrency.get('USA') ==> Dollar
    //mapCountryCurrency.get('France') ==> Euro
    string eachValue = mapCountryCurrency.get(eachKey);
    printString += ', its currency is ' + eachValue;
    System.debug(printString);
}