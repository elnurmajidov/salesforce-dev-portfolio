String firstName = 'John';
String lastName = 'Doe';
//variable  <====   value

System.debug(firstName);
System.debug('lastName '  + lastName);

String fullName = firstName + ' ' + lastName;
System.debug('fullName ' + fullName);

Integer age = 35;
Boolean isMarried = true;
Decimal salary = 100000.00;
String phone = '+905555555555';

String address; // decleration // null
System.debug('address ' + address);

address = 'Cumhuriyet Mah. Meydan Caddesi .......'; // defination
System.debug('address new Value ' + address);

String details = fullName + ' isimli kişinin yaşı ' + age + ', Maaşı : ' + salary + ', Telefon numarası : ' + phone + ' , Addresi : ' + address;

System.debug('Tum bilgiler ' + details);

phone = '+1666666666'; // phone variable ı update edildi
System.debug('updated phone ' + phone);

Date birthdate = Date.newInstance(1990, 1, 2);
System.debug('birtdate ' + birthdate);

Integer num1 = 2147483647;
System.debug(num1);
Long num2 = 2147483648L;
System.debug(num2);