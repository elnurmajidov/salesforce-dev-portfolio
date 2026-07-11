// if(boolean condition){
//}
//elseif(boolean condition){
//}else{}

Integer x = 7;
if(x>6){
    System.debug('x 6dan buyuktur');
}
else if( x > 10){
    System.debug('x 10dan buyuktur');
}
else if( x > 15){
    System.debug('x 15 dan buyuktur');
}
else{
    System.debug('Bunların dısındaki her durumu kapsayan alan');
}

System.debug('ıf den sonra devam eden kod bloğu');



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



String sonuc1 = StatementExamples.phoneNumber('2163554545');
String sonuc2 = StatementExamples.phoneNumber('2124553333');
String sonuc3 = StatementExamples.phoneNumber('3125555555');
String sonuc4 = StatementExamples.phoneNumber('03125555555');
String sonuc5 = StatementExamples.phoneNumber('031255as555');

System.debug('sonuc1 ' + sonuc1);
System.debug('sonuc2 ' + sonuc2);
System.debug('sonuc3 ' + sonuc3);
System.debug('sonuc4 ' + sonuc4);
System.debug('sonuc5 ' + sonuc5);

String snc1 = StatementExamples.tasKagitMakas('kağıt', 'taş');
System.debug(snc1);

String snc2 = StatementExamples.tasKagitMakas('makas', 'taş');
System.debug(snc2);


String snc3 = StatementExamples.tasKagitMakas('makas', 'makas');
System.debug(snc3);

String snc4 = StatementExamples.tasKagitMakas('papper', 'makas');
System.debug(snc4);