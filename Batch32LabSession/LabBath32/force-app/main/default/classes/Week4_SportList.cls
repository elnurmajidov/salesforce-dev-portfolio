public class Week4_SportList {
    
  public void Week4_SportList(){

            // Create list of sports

        List<String> sportList = new List <String>();

        if (sportList.isEmpty()) {
            System.debug('LIST IS EMPTYY');
        } else {
            System.debug('LIST IS NOT EMPTY');
        }


        sportList.add('Football');
        sportList.add('Basketball');
        sportList.add('Tennis');
        sportList.add('Golf');
        sportList.add('Baseball');
        sportList.add('Hockey');
        sportList.add('Soccer');
        sportList.add('Volleybal');
        sportList.add('Rugby');
        sportList.add('Cricket');

        if (sportList.isEmpty()){
            System.debug('LİST IS EMPTYY');
        } else{
            System.debug('LIST IS NOT EMPTYY');
        }

        System.debug('sportList:' + sportList);
        System.debug('sportList size: '  + sportList.size());

        List<String> playedWithBallList = new List<String>();
        List<String> notPlayedWithBallList = new List<String>();

        for (String sport : sportList){
            if (sport != null && sport.toLowerCase().contains('ball')) {
                System.debug(sport + 'is played with Ball');
                playedWithBallList.add(sport);
            } else {
                System.debug(sport + ' is NOT played with ball');
                notPlayedWithBallList.add(sport);
            }
        }

        System.debug('played With Ball List: ' + playedWithBallList);
        System.debug('played With Ball Size: ' + playedWithBallList.size());
        
        System.debug('Not played With Ball List: ' + notPlayedWithBallList);
        System.debug('Not played With Ball List: ' + notPlayedWithBallList.size());

        String favoriteSport = 'Volleyball';
        Integer favoriteSportIndex = sportList.indexOf(favoriteSport);
        System.debug('Index of favorite sport: ' + favoriteSport + 'Index ' + favoriteSportIndex);

        String leastFaforiteSport = 'Cricket';
        sportList.remove(sportList.indexOf('Hockey'));

        System.debug('Sport list after removal: ' + sportList);
        System.debug('Updated size: ' + sportList.size());


  }
    public void operatingSystemSet(){
        //create set of operating system, by default add ‘Windows, macOS’ in the set. - add following operating system in the above set.
        
        Set<String> setOperatingSystem = new Set<String>{'Windows', 'macOS'};
// 'Windows', 'macOS', 'Linux', 'Android', 'iOS', 'Chrome OS', 'FreeBSD' 'Ubuntu',
// 'Debian', 'Fedora'
// - print size of set

        setOperatingSystem.add('Windows');
        setOperatingSystem.add('macOS');
        setOperatingSystem.add('Linux');
        setOperatingSystem.add('Android');
        setOperatingSystem.add('iOS');
        setOperatingSystem.add('Chrome OS');
        setOperatingSystem.add('FreeBSD');
        setOperatingSystem.add('Ubuntu');
        setOperatingSystem.add('Debian');
        setOperatingSystem.add('Fedora');

        
        System.debug('Size of operation system: ' + setOperatingSystem.size());
        System.debug('operation system: ' + setOperatingSystem);

// print following string by concating all operating systems. Also print size of the
// final string
        String finalString = '';
        for (String totalOs: setOperatingSystem) {
            finalString += totalOs + ' & ';
            
        }

// FINAL STRING ⇒ Operating systems added in set are 'Windows' &
// 'macOS' & 'Linux' & 'Android' & 'iOS' & 'Chrome OS' & 'FreeBSD' &
// 'Ubuntu' & 'Debian' & 'Fedora'
// Size of FINAL STRING is [whateverTheSizeIs]

        System.debug('final strin is ' + finalString);
        System.debug('Siz of final string is ' + finalString.length());
    

    }
public void iteratingMap() {


        // 1. Store the currency exchange rate values in a Map named
        // 'currISOCodeAndExchangeRateMap' for any 5 currency ISO codes. Like below:
        // a. AUD => 0.73
        // b. CAD => 0.78
        // c. EUR => 1.13
        // d. NZD => 0.68
        // e. INR => 0.013
        // create Map
        Map<String, Decimal> currISOCodeAndExchangeRateMap = new Map<String,Decimal>{'AUD' => 0.73, 'CAD' => 0.78, 'EUR' => 1.13, 'NZD' => 0.68, 'INR' => 0.013};


        
        System.debug('Conversion rate of EUR is ' + currISOCodeAndExchangeRateMap.get('EUR'));

        // 3. Check if the above Map has a conversion rate for SAD ISO code.
        System.debug('Does this map have conversion rate for SAD? ==> ' + currISOCodeAndExchangeRateMap.containsKey('SAD'));
        
        // 4. Collect all the currency ISO codes from currISOCodeAndExchangeRateMap for
        // which the conversion rate is >= 1 in one variable and other iso codes in other
        // variables.
        // Expected Output: EUR – In one variable. AUD, CAD, NZD, and INR – In another
        // variable
        String greaterOrEqualToOne = '';
        String lessThanOne = '';
        Set<String> setOfKeys = currISOCodeAndExchangeRateMap.keySet();
        for (String currentKey : setOfKeys) {
            if (currISOCodeAndExchangeRateMap.get(currentKey) >= 1) {
                greaterOrEqualToOne += currentKey + ', ';
            } else {
                lessThanOne += currentKey + ', ';
            }
        }

        System.debug('The currencies with conversion rates greater than or equal to one are: ' + greaterOrEqualToOne);
        System.debug('The currencies with conversion rates less than one are: ' + lessThanOne);
    }
}