String str='  sAlEsFoRcE oĞrEnEcEğIm Ve DeVeLoPeRxYz1 oLaCaĞıM. ';
//String methodları kullanarak str nin değerini-->
//Salesforce ogreneceğim ve developer olacağim şekline çevirin.

System.debug('First Value ==> ' + str);
Integer karakterSayisi = str.length();
System.debug('Karakter sayısı ==> ' + karakterSayisi ); //52

String str1 = str.trim();
System.debug('Trimmed ' + str1); //sAlEsFoRcE oĞrEnEcEğIm Ve DeVeLoPeRxYz1 oLaCaĞıM.
karakterSayisi = str1.length();
System.debug('karakterSayisi guncel ' + karakterSayisi);//49

str1 = str1.toLowerCase();
System.debug(str1); //salesforce oğreneceğim ve developerxyz1 olacağım.

str1 = str1.remove('xyz1');
System.debug(str1);//salesforce oğreneceğim ve developer olacağım.

str1 = str1.capitalize();
System.debug(str1); //Salesforce oğreneceğim ve developer olacağım.

Boolean isExistDeveloper = str1.contains('DEVELOPER');
System.debug('isExistDeveloper contains ==>' + isExistDeveloper); //false

isExistDeveloper = str1.containsIgnoreCase('DEVELOPER');
System.debug('isExistDeveloper containsIgnoreCase ==>' + isExistDeveloper); //true

Integer indexOfDeveloper = str1.indexOf('developer');
System.debug('indexOfDeveloper ' + indexOfDeveloper); //26

String motto = str1.substring(26).toUpperCase();
System.debug(motto); //DEVELOPER OLACAĞIM.




StringExamples se = new StringExamples();
se.selam();
se.selam('Mehmet');
Integer toplam = se.toplama(15, 25); //40
System.debug(toplam);//40


StringExamples se1 = new StringExamples();
Integer result = se1.karakterSayiHesabi('Return type ogreniyoruz ve developper olacagiz elbet bir gun!');
System.debug(result);//24


StringExamples se2 = new StringExamples();
String result2 = se2.basamakHesabi(44444488);
System.debug(result2); //Girmiş olduğunuz 4444448888 sayısı 10 basamaklıdır.

StringAssignment sa1 = new StringAssignment();
String result2 = sa1.companyName('john@salesforce.com' );
System.debug(result2); 
String result3 = sa1.companyName('marry@audi.com' );
System.debug(result3); 
