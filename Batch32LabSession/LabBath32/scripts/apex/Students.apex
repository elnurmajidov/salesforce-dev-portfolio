// n anonymous apex:
// Now create at least two instances of the class and set all the informaHon using set methods of
// two different students and call the generateReport method for each.
// Print the value returned from the generateReport method as follows:
// 'Final Grade of [firstName] is [final grade]' (use geker method to get firstname)
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

Students student1 = new Students();
student1.setfirstName('Mike');
student1.setlastName('Ross');
student1.setClassYear(2010);
student1.setMarks(90);
student1.setMajor('Law');
String grade1 = student1.generateReport();
System.debug('Final Grade of ' + student1.getFirstName() + 'is ' + grade1);


Students student2 = new Students();
student2.setfirstName('Lucifer');
student2.setlastName('Morningstar');
student2.setClassYear(1810);
student2.setMarks(10001);
student2.setMajor('La');
String grade2 = student2.generateReport();
System.debug('Final Grade of ' + student2.getFirstName() + 'is ' + grade2);
