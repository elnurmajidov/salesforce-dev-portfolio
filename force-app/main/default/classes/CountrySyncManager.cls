public with sharing class CountrySyncManager {
    public static void getCountry() {
         Http httpObject = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://restcountries.com/v3.1/all?fields=name,flags');
        request.setMethod('GET');
        HttpResponse response = httpObject.send(request);
        String responseBody = response.getBody();

        if (response.getStatusCode() == 200) {
            List<Country__c> listCountry = new List<Country__c>();

            List<CountryWrapper> cwList = (List<CountryWrapper>)JSON.deserialize(responseBody, List<CountryWrapper>.class );
            for (CountryWrapper eachcountry : cwList) {
                Country__c c1 = new Country__c();
                c1.Country_Name_Common__c = eachcountry.name.common;
                c1.Country_Name_Official__c = eachcountry.name.official;
                c1.Flag_Description_Alt__c = eachcountry.flags.alt;
                c1.Flag_URL_PNG__c = eachcountry.flags.png;
                c1.Flag_URL_SVG__c = eachcountry.flags.svg;

                listCountry.add(c1);

            }
            insert listCountry;
        }

    }
    public class CountryWrapper{
        public FlagsWrapper flags;
        public NameWrapper name;
    }
    public class FlagsWrapper{
        public string png;
        public string svg;
        public string alt;
        
    }
    public class NameWrapper{
        public string common;
        public string official;
    }
    
}