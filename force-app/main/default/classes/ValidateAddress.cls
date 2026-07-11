public  class ValidateAddress {
  public void validateHomeAddress(){

    String houseName = 'Park Estates';
    String streetName = 'Main Street';
    String cityName = 'Jersey City';
    String stateName = 'NewYork State';
    String stateIsoCode = 'NY';
    String countryName = 'United State';
    String countryIsoCode = 'USA';

    // I.The number of characters in the street name
    System.debug('Street name length: ' + streetName.length());
    
    // II.Check if the street name contains a house name in it or not
    System.debug('Boolean hasHouseName: ' + StreetName.contains(houseName));

    // III.Find if the street name contains the state iso code in it
    System.debug('Street contains state ISO: ' + StreetName.contains(stateIsoCode));

    //IV.Convert the state iso code, country iso code, country name to uppercase and city name, and state name to lowercase
    // System.debug('State ISO Code Upper Case: ' + stateIsoCode.toUpperCase());
    stateIsoCode = stateIsoCode.toUpperCase();
    System.debug('State ISO Code Upper Case: ' + stateIsoCode);
    countryIsoCode = countryIsoCode.toUpperCase();
    System.debug('Country Iso Code Upper Case: ' + countryIsoCode);
    countryName = countryName.toUpperCase();
    System.debug('Country Name Upper Case: ' + countryName );

    // city and state name to lowercase
    cityName = cityName.toLowerCase();
    System.debug('City Name Lower Case: ' + cityName);
    stateName = stateName.toLowerCase();
    System.debug('State Name Lower Case: ' + stateName);

    //V.Concatenate the house name, street name, City Name, State Name, and Country Name and store it in a variable.
    String fullAddress = houseName + ', ' + streetName + ', ' + cityName + ', ' + stateName + ', ' + countryName;
    System.debug('Our Full Address: ' + fullAddress);

    
  } 
}