public with sharing class MovieRestCallOuts {

    @future(callout = true)
    public static void movieDate(Id movieId) {
        Movie__c movie = [select Id, Name from Movie__c where Id =: movieId limit 1];

        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://www.omdbapi.com/?t=' + movie.name + '&apikey=dba81639');
        request.setMethod('GET');

        Http movieObject = new Http();
        HttpResponse response = movieObject.send(request);

        if(response.getStatusCode() == 200){
            String JSONstring = response.getBody();
            movieWrapper wrapper = (movieWrapper)JSON.deserialize(jsonString, movieWrapper.class);
            movie.Name = Wrapper.Title;
            movie.Year__c = wrapper.Year;
            movie.Released__c = wrapper.Released;
            movie.Runtime__c = wrapper.Runtime;
            movie.Genre__c = wrapper.Genre;
            movie.Director__c = wrapper.Director;
            movie.Writer__c = wrapper.Writer;
            movie.Plot__c = wrapper.Plot;
            movie.Image_URL__c = wrapper.Poster;

            update movie;

        }
    }
    public class movieWrapper{
        public string Title;
        public string Year;
        public string Released;
        public string Runtime;
        public string Genre;
        public string Director;
        public string Writer;
        public string Plot;
        public string Poster;
    }
}