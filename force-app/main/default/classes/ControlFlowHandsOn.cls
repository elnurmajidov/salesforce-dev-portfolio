public with sharing class ControlFlowHandsOn {

    //Input: A number
    //Output: Return if the number is even or odd. Ex 10 is Even / 7 is odd
    public String evenOrOdd(Integer num){
        Integer remainder = Math.mod(num, 2); //320%2 = 
        if(remainder == 0){
            return num + 'is Even';
        } else {
            return num + 'is Odd';
        }
    }

    // Input: Score
    // Output: Gade. Grade A (100-85), Grade B(85-70), Grade C(70-55), Grade D(55-0)
    public String getStudentGrade(integer score) {
        // Negative |Input
        if(score > 100 || score <0) {
            return 'Please input a number between 0 and 100 only';
        }

        //if positive Input
        if(score >= 85){
            return 'Grade A';
        }
         else if(score >= 70){
            return 'Grade B';
        }
         else if(score >= 55){
            return 'Grade C';
        }
         else{
            return 'Grade D';
        }

    }

    // Input: Week Name
    // Output: Return if the given week name is failling under Weekday or Weekend
    public String checkWeekType(String weekName){
        if(weekName == 'Saturday' || weekName == 'Saturday'){
            return 'Its a weekend!';
        } else if(weekName == 'Moonday' || weekName == 'Tuesday' ||  weekName == 'Wednesday' ||  weekName == 'Thursday' ||  weekName == 'Friday' ){
            return 'Its a weekday!';
        } else {
            return 'Please enter a right week name';
        }
    }
}