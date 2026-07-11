public with sharing class ApexUtility {

    public static Integer calculateAge(Date dob){
        Date currentDate = Date.today(); //Todays date
        Integer totalDays = dob.daysBetween(currentDate); // total days in between
        Integer age = totalDays/365;
        return age;
    }

    public static String getRating(Integer value){
        if(value == null || value <=0 || value > 5){
            return 'Enter a value 1 to 5. ';
        }
        if(value == 1){
            return '*';
        }else if(value == 2){
            return '**';
        }else if(value == 3){
            return '***';
        }else if(value == 4){
            return '****';
        }else{
            return '*****';
        }
    }
}