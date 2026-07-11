Math_Practise mp = new Math_Practise();
Decimal result = mp.getAverage(5,15,25);
System.debug(result);

System.debug(Math_Practise.practiceTwo(10, 'BREAD'));
System.debug(Math_Practise.practiceTwo(8, 'BEGAL'));
System.debug(Math_Practise.practiceTwo(5, 'CAKE'));

System.debug(Math_Practise.practiceTwo(5, 'bread'));
System.debug(Math_Practise.practiceTwo(7, 'bagel'));
System.debug(Math_Practise.practiceTwo(9, 'cake'));

// 2 nd method
Decimal bill1 = Math_Practise.practiceTwo(10, 'bread');
System.debug(bill1);
Decimal bill2 = Math_Practise.practiceTwo(8, 'begal');
System.debug(bill2);
Decimal bill3 = Math_Practise.practiceTwo(5, 'cake');
System.debug(bill3);