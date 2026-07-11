// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

string tempvar = 'Enter_your_name_here';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);


###### DATA TYPES ######
String - Cobination any alpha numeric & special characters. Ex: 'BMW', 'Soft@innovas', 'xzcxz1213!@£$!@$'
Integer - Whole Number. Ex: 10, 1777, 100000, 4900000
Decimal - Decimal Numbers. Ex: 10.45, 45.76575, 76577.865765
Boolean - true, false
Id - '001fj00000Wns6XAAR'
Date - YYYY-MM-DD; Ex: 2026-01-05
DateTime - YYYY-MM-DD HH:MM:SS

###### VARIABLES ######
String fullName = 'John Doe';
String email = 'john.doe@example.com';
String phone = '+ 1 876 7868 677';
Integer age = 35;
Decimal salary =  145000.50;
Boolean isMarrioed = true; 
Id accId = '001fj00000Wns6XAAR';

##### CODE SNIPPETS ######
String salutation = 'Mr';
String firstName = 'John';
String lastName = 'Doe';
String fullName = salutation + ' ' + firstName + ' ' + lastName;
System.debug(fullName);

Integer num1 = 200;
Integer num2 = 300;
Integer total = num1 + num2;
System.debug(total);

Decimal monthlySalary = 8070.40;
Decimal annualSalary = 12 * monthlySalary;
System.debug(annualSalary);

*
**
***
****
*****

System.debug('*');
System.debug('**');
System.debug('***');
System.debug('****');
System.debug('*****');

//** CONTROL FLOW STATEMENTS **//
ControlFlowHandsOn handsOn1 = new ControlFlowHandsOn();
String output = handsOn1.evenOrOdd(-320);
System.debug(output);

ControlFlowHandsOn handsOn2 = new ControlFlowHandsOn();
String output = handsOn2.getStudentGrade(120);
System.debug(output);


ControlFlowHandsOn handsOn3 = new ControlFlowHandsOn();
String output = handsOn3.checkWeekType('Sunday');
System.debug(output);



//** CONSTRUCTORS **//
Student std = new Student();
System.debug(std);

Student std = new Student('John Doe', 'Texas, United States', 'Salesforce Developer', 25,);
System.debug(std);

Date dob = Date.newInstance(1996, 3, 14);
Integer age = ApexUtility.calculateAge(dob);
System.debug('Age is: ' + age);

String rating = ApexUtility.getRating(5);
System.debug('Rating: ' + rating);

System.debug('hi how are you');