public with sharing class ForecastInvocable {
    
    @InvocableMethod(
        label='Calculate Deal Forecast'
        description='Calculate the deal forecast amounts'
        category='Opportunity'
    )
    public static void calculateDealForecast() {
        DealForecastBatch forecastBatch = new DealForecastBatch();
        Database.executeBatch(forecastBatch, 200);
    }
}