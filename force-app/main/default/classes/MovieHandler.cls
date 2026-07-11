public with sharing class MovieHandler {
    public static void movieHelp(List<Movie__c> newMovies) {
        MovieRestCallOuts.movieDate(newMovies[0].Id);
    }
}