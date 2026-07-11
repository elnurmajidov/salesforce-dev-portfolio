StatementExamples ste = new StatementExamples();
Time myTime1 = Time.newInstance(8, 15, 00, 00);
String result1 = ste.greetingTime(myTime1);
System.debug(result1); //Gunaydın

String result2 = ste.greetingTime(Time.newInstance(18, 25, 10, 28));
System.debug(result2); //Iyi gunler

String result3= ste.greetingTime(Time.newInstance(22, 19, 10, 28));
System.debug(result3); //Iyi aksamlar


StatementExamples sw = new StatementExamples();
String msg1 = sw.switchMethod('Apple');
System.debug(msg1); //Elmanın fiyatı 0.32 pound

String msg2 = sw.switchMethod('Watermelon');
System.debug(msg2); //Karpuz fiyatı 6.89 pound
String msg3 = sw.switchMethod('Melon');
System.debug(msg3); //Aradığınız urun bulunmamaktadır