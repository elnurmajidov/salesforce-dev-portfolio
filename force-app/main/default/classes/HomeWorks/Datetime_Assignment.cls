// public class Datetime_Assignment {
//     public void diffofDate(){
//         Date varTomorrowDate = date.newInstance(2026, 1, 25);
//         System.debug('==varTomorrowDate==' + varTomorrowDate);

//         Date varTodayDate = date.newInstance(2026, 1, 24);
//         System.debug('==varTodayDate== ' + varTodayDate);

//         Integer daysDiffOf = varTodayDate.daysBetween(varTomorrowDate);
//         System.debug('==daysDiffOf== ' + daysDiffOf);
//     }

//     public void Timecheck(){
//         DateTime varTomorrowDatetime = dateTime.newInstance(2026, 1, 25, 7, 0, 0);
//         System.debug('==tmorrowDateTime== ' + varTomorrowDatetime);

//         DateTime var10DaysDatetime = dateTime.newInstance(2026, 2, 4, 9, 0, 0);
//         System.debug('==var10DaysDatetime==' + var10DaysDatetime);

//         Long varDatetimeLong = 12339874361L;

//         DateTime add7varTomorrowDatetime = varTomorrowDatetime.addDays(7);
//         System.debug('==add7varTomorrowDatetime== ' + add7varTomorrowDatetime);

//         DateTime add10var10DaysDateTime = var10DaysDatetime.addDays(10);
//         System.debug('==addvar10DaysDatetime== ' + add10var10DaysDatetime);

//     }

// }
// Buda farkli metod aktiv olarak her zaman calismasi icin!!!
// public class Datetime_Assignment {

// 1. Method: Date farkı
//     public static void diffofDate() {
//         Date varTomorrowDate = Date.newInstance(
//             Date.today().year(),
//             Date.today().month(),
//             Date.today().day() + 1
//         );

//         Date varTodayDate = Date.today();

//         Integer diffDays = varTodayDate.daysBetween(varTomorrowDate);
//         System.debug('Days Difference: ' + diffDays);
//     }

// 2. Method: Datetime işlemleri
//     public static void Timecheck() {

// Tomorrow at 7 AM
//         Datetime varTomorrowDatetime = Datetime.newInstance(
//             Date.today().year(),
//             Date.today().month(),
//             Date.today().day() + 1,
//             7, 0, 0
//         );

// 10 days later at 9 AM (GMT)
//         Datetime var10DaysDatetime = Datetime.newInstanceGmt(
//             Date.today().year(),
//             Date.today().month(),
//             Date.today().day() + 10,
//             9, 0, 0
//         );

// Long value
//         Long varDatetimeLong = 12339874361L;

// Add 7 days
//         Datetime plus7Days = varTomorrowDatetime.addDays(7);
//         System.debug('Tomorrow + 7 days: ' + plus7Days);

// Add 10 days
//         Datetime plus10Days = var10DaysDatetime.addDays(10);
//         System.debug('10 Days + 10 days: ' + plus10Days);
//     }
// }

//=================================================================================================================================================================
//=================================================================================================================================================================

// Create an Apex class Datetime_Assignment

// Create a method called diffofDate
// Create a Date variable varTomorrowDate with tomorrows date by using date.newInstance .
// Create a Date variable varTodayDate with todays date by using date.newInstance .
// Try to get the days difference between these two variables and display the integer using below example link
// https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_date.htm#apex_System_Date_daysBetween
// Create a method called Timecheck
// Create a Datetime variable varTomorrowDatetime with tomorrows date and time 7 am by using datetime.newInstance.
// Create a Datetime variable var10DaysDatetime with 10 days later date and time 9 am by using datetime.newInstancegmt.
// Create a Long variable varDatetimeLong with value 12339874361L.
// Try to get add 7 days for varTomorrowDatetime and display using example link 
// https://developer.salesforce.com/docs/atlas.en-us.apexref.meta/apexref/apex_methods_system_datetime.htm#apex_System_Datetime_addDays
// Try to add 10 days for var10DaysDatettime and display the value.

// Write an Anonymous apex and run the two methods.

public class Datetime_Assignment {
    public void diffofDate(){
        Date varTomorrowDate = date.newInstance(2026, 1, 25);
        System.debug('==varTomorrowDate==' + varTomorrowDate);

        Date varTodayDate = date.newInstance(2026, 1, 24);
        System.debug('==varTodayDate== ' + varTodayDate);

        Integer daysDiffOf = varTodayDate.daysBetween(varTomorrowDate);
        System.debug('==daysDiffOf== ' + daysDiffOf);
    }

    public void Timecheck(){
        Datetime varTomorrowDatetime = Datetime.newInstance(2026, 1, 30, 7, 0, 0);
        System.debug('varTomorrowDatetime ' + varTomorrowDatetime);

        Datetime var10DaysDatetime = Datetime.newInstance(2026, 2, 10, 9, 0, 0);
        System.debug('var10DaysDatetime ' + var10DaysDatetime);

        Long varDatetimeLong = 12339874361L;

        Datetime add7varTomorrowDatetime = varTomorrowDatetime.addDays(7);
        System.debug('===add7varTomorrowDatetime==' + add7varTomorrowDatetime);

        Datetime add10var10DaysDateTime = var10DaysDateTime.addDays(10);
        System.debug('==add10var10DaysDateTime==' + add10var10DaysDateTime);

        
    }

}