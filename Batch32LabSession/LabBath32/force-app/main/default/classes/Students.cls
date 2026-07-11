public class Students {
    private String firstName;
    private String lastName;
    private Integer classYear;
    private Integer marks;
    private String major;

    public String getfirstName(){
        return firstName;
    }
    public void setfirstName(String firstName){
        this.firstName = firstName;
    }

    public String getlastName(){
        return lastName;
    }
    public void setlastName(String lastName){
        this.lastName = lastName;
    }
public Integer getMarks(){
    return marks;
    }
public void setMarks(Integer marks){
    if(marks < 0 || marks > 100){
    this.marks = -1;
    System.debug('please give proper marks. This no joke');
    } else {
    this.marks = marks;
    }
}
public Integer getClassYear(){
    return classYear;
}
public void setClassYear(Integer classYear){
    Integer currentYear = Date.today().year();
    Integer minYear = currentYear - 100;

    if(classYear == null || classYear > currentYear || classYear < minYear){
        this.classYear = 0;
        System.debug('no such class year exists for us');
    } else{
        this.classYear = classYear;
    }
}

public String getMajor(){
    return major;
}

public void setMajor(String major){
    if (major == null || major.length() <= 2){
        this.major = 'NA';
        System.debug('there is no such major or stream in our uni');

    }else {
        this.major = major;
    }
}

public String generateReport(){
    System.debug('Report Generated For ' + firstName + ' ' + lastName + 'of ' + classYear  + ' ' + major);
    
    String grade;
    if(marks == null || marks < 0 || marks > 100){
        grade = 'X';
     }else if (marks >= 90){
        grade = 'A';

     }else if (marks >= 80){
         grade = 'B';

     }else if (marks >= 70){
         grade = 'C';

     }else if (marks >= 60){
         grade = 'D';

     } else {
         grade = 'F';
     }

     return grade;
    }

}

// Create a class named Students.
// Each student has a first name, last name, class year, marks, and major/stream (like Physics,
// Electrical).
// none of these data should be accessible outside of the class.
// Declare the class variables accordingly.
// Create geker seker methods for all instance variables keeping in mind following rules
// - Make sure that we should not be able to set marks more than 100 and less than 0.
// - if not in given range then set marks to -1, and print ‘please give proper marks.
// this no joke.’
// - And we should not be able to set class year in future or less than 100 years
// - if class year not in given range then set class year to 0 and print ‘no such class
// year exists for us’
// - make sure that length of string of major/stream is more than 2.
// - if length is less than or equal to 2, set the major to ‘NA’ and print ‘there is no
// such major or stream in our uni’
// Create a method with the name as generateReport.
// This method is going to show a debug message in the following format, and calculate and return
// the final grade of student.
// Debug message format
// ‘Report Generated for [first name] [last name] of [class year] – major/stream’.
// calculate final grade using following rules:
// marks >= 90 -> "A", marks >= 80 -> "B", marks >= 70 -> "C",
// marks >= 60 -> "D", marks < 60 -> "F".
// marks if not in valid range (0-100) then “X”
// In anonymous apex:
// Now create at least two instances of the class and set all the informaHon using set methods of
// two different students and call the generateReport method for each.
// Print the value returned from the generateReport method as follows:
// ‘Final Grade of [firstName] is [final grade]’ (use geker method to get firstname)
// Example:
// for firstname, last name, class year, marks, and major values are Mike, Ross, 2010, 90, law
// respecHvely
// Output:
// Report Generated for Mike Ross of 2010 - Law.Final
// Grade of Mike is A
// Example 2:
// for firstname, last name, class year, marks, and major values are Lucifer, Morningstar, 1810,
// 10001, la respecHvely
// Output:
// no such class year exists for us
// please give proper marks. this no joke.
// there is no such major or stream in our uni
// Report Generated for Lucifer Morningstar of 0 - NA.
// Final Grade of Lucifer is X