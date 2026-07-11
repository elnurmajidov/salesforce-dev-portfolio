ReturnTypeExamples age1 = new ReturnTypeExamples();
// Date birthDate = Date.newInstance(1990, 2, 25);
// age1.yasHesepla(birthDate);
Integer yas1 = age1.yasHesepla(Date.newInstance(1990, 2, 25));
System.debug(yas1); //35


ReturnTypeExamples rt2 = new ReturnTypeExamples();
Decimal result = rt2.convertCelcius(40);
system.debug(result); //4.44

Decimal result1 = rt2.convertCelcius(55);
system.debug(result1); //12.78