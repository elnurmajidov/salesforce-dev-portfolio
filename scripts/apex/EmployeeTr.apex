//EmployeeTr emp1 = new EmployeeTr(); //Constructor not defined: [EmployeeTr].<Constructor>()

EmployeeTr emp2 = new EmployeeTr('Elif Yılmaz', 28 , 40000 , 'Sekreter');
System.debug(emp2.employeeDetails());

EmployeeTr emp3 = new EmployeeTr('Sude Yılmaz', 47 , 70000 , 'IK Muduru');
System.debug(emp3.employeeDetails());

EmployeeTr emp4 = new EmployeeTr();
emp4.setName('Fahri Yalçın');
emp4.setAge(44);
emp4.setSalary(90000);
emp4.setPosition('Salesforce Developer');
String emp4Details = emp4.employeeDetails();
System.debug(emp4Details);

EmployeeTr emp5 = new EmployeeTr();
emp5.setName('Hasan Yalçın');
emp5.setAge(17);
emp5.setSalary(10000);
emp5.setPosition('Salesforce Developer');
String emp5Details = emp5.employeeDetails();
System.debug(emp5Details);