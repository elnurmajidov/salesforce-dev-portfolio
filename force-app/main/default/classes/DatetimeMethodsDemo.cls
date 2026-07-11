public  class DatetimeMethodsDemo {
    public void calculateAgeInMonths(){
        date birthDate = date.newInstance(1996, 3, 14);

        date todayDate = date.today();

        //age in months using monthsBetween
        Integer ageInMonths = birthDate.monthsBetween(todayDate);
        system.debug('Elnur age in months is ==> ' + ageInMonths);

        Integer ageInDays = birthDate.daysBetween(todayDate);
        system.debug('Elnur age in days => ' + ageInDays);

    }
    public void printSubscriptionEndDate(){
        Date subStartDate = date.today();

        Date subEndDate = subStartDate.addDays(1000);
        system.debug('subscription end date is ==> ' + subEndDate);

        //year
        integer endDateYear = subEndDate.year();
        system.debug('year of end date ' + endDateYear);
        //month
        integer endDateMonth = subEndDate.month();
        system.debug('month of end date ' + endDateMonth);
    }
    public void printOfferEndDate(){
        datetime offerStart = datetime.now();
        datetime offerEnd = offerStart.addHours(51);

        system.debug('offer end datetime is ' + offerEnd);

        //just the Date component of offerEnd
        Date offerEndDate = offerEnd.date();
        system.debug('offer enddate is ' + offerEndDate);
    }
    public void birthDateInMS(){
        datetime birthDT = datetime.newInstance (1996, 3, 14, 8, 44, 00);
        long birthDateMS = birthDT.getTime();
        system.debug('Elnur birth datetime in milliseconds ==> ' + birthDateMS);
        
    }
 }