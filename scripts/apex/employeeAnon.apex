Employee tomEmp = new Employee();
tomEmp.details();

tomEmp.setName ('Tom');
tomEmp.setSalary(150000);
System.debug('** print details again **');
tomEmp.details();

string empName = tomEmp.getName();
System.debug('got emp name: ' + empName);
System.debug('got emp salary:' + tomEmp.getSalary());