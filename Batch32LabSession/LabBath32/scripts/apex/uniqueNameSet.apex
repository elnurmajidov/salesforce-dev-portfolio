set<string> uniqueNameSet = new set<string>{'Tom', 'Jerry'};
System.debug(uniqueNameSet.size());

uniqueNameSet.add('Mice');
System.debug(uniqueNameSet);

Boolean isMyNameIn = uniqueNameSet.contains('Elnur');
System.debug(isMyNameIn);

Boolean isEmpty = uniqueNameSet.isEmpty();
System.debug(isEmpty);

uniqueNameSet.clear();
System.debug(uniqueNameSet);

isEmpty = uniqueNameSet.isEmpty();
System.debug(isEmpty);

// Create Map
Map<String, Integer> studentRank = new Map<String, Integer>();

// Store 4 students
studentRank.put('Ali', 100);
studentRank.put('Veli', 29);
studentRank.put('Ayse', 38);
studentRank.put('Fatma', 49);
System.debug(studentRank);

// Print all student names one by one
for(String studentName : studentRank.keySet()) {
    System.debug(studentName);
}

// Print name and rank in required format
for(String studentName : studentRank.keySet()) {
    System.debug(
        'Student Name : ' + studentName + 
        ' and Rank : ' + studentRank.get(studentName)
    );
}

// c. Maps – Iteration
// 1. Store the currency exchange rate values in a Map named
// ‘currISOCodeAndExchangeRateMap’ for any 5 currency ISO codes. Like below:
// a. AUD => 0.73
// b. CAD => 0.78
// c. EUR => 1.13
// d. NZD => 0.68
// e. INR => 0.013
// 2. Fetch the currency conversion rate for any one currency ISO code and print it.
// 3. Check if the above Map has a conversion rate for SAD ISO code.
// 4. Collect all the currency ISO codes from currISOCodeAndExchangeRateMap for
// which the conversion rate is >= 1 in one variable and other iso codes in other
// variables.
// Expected Output: EUR – In one variable. AUD, CAD, NZD, and INR – In another
// variable.

Map<String, Decimal> currISOCodeAndExchangeRateMap = new map<String, Decimal>();

currISOCodeAndExchangeRateMap.put('AUD', 0.73);
currISOCodeAndExchangeRateMap.put('CAD', 0.78);
currISOCodeAndExchangeRateMap.put('EUR', 1.13);
currISOCodeAndExchangeRateMap.put('NZD', 0.68);
currISOCodeAndExchangeRateMap.put('INR', 0.013);

// 2. Fetch the currency conversion rate for any one currency ISO code and print it.
Decimal eurRate = currISOCodeAndExchangeRateMap.get('EUR');
System.debug('EUR rate is: ' + eurRate);

// 3. Check if the above Map has a conversion rate for SAD ISO code.
Boolean hasSAD = currISOCodeAndExchangeRateMap.containsKey('SAD');
System.debug('Does map contain SAD? ' + hasSAD);

// 4. Collect all the currency ISO codes from currISOCodeAndExchangeRateMap for which the conversion rate is >= 1 in one variable and other iso codes in other variables.
// Set<String> isoCodes = currISOCodeAndExchangeRateMap.keySet();
// System.debug(isoCodes);
Set<String> rateGraterOrEqualOne = new Set<String>();
Set<String> rateLessThanOne = new Set<String>();

for(String isoCode : currISOCodeAndExchangeRateMap.keySet()){
    Decimal rate = currISOCodeAndExchangeRateMap.get(isoCode);
    if(rate >= 1){
        rateGraterOrEqualOne.add(isoCode);
    }else{
        rateLessThanOne.add(isoCode);
    }
}
System.debug('Rate >= 1 : ' + rateGraterOrEqualOne);
System.debug('Rate < 1 : ' + rateLessThanOne);
