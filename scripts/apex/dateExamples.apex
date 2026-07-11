Integer yil = 2025;
Integer ay = 1;
Integer gun = 6;

//Date.newInstance(yıl,ay,gun)
Date tarih = Date.newInstance(yil, ay, gun);
System.debug(tarih); //2025-01-06 00:00:00

Date bugun = Date.today();
System.debug(bugun);//local time zone kullanır //2026-01-07 00:00:00

Integer buYil = bugun.year();
Integer buAy = bugun.month();
Integer bugunum = bugun.day();

System.debug('Tarih ' + bugun + ' , yıllardan ' + buYil + ' , aylardan ' + buAy + ', gunlerden ' + bugunum); //Tarih 2026-01-07 00:00:00 , yıllardan 2026 , aylardan 1, gunlerden 7

Date yeniYil = Date.newInstance(2026, 12, 31);
Integer  kalanGunSayisi = bugun.daysBetween(yeniYil);
System.debug(kalanGunSayisi); //358

Integer yilinKacinciGunu = bugun.dayOfYear();
System.debug(yilinKacinciGunu); //7

Integer kalanGunSayisi2 = 365 - yilinKacinciGunu;
System.debug(kalanGunSayisi2); //358

// Boolean artikYilMi = Date.isLeapYear(buYil);
// Boolean artikYilMi = Date.isLeapYear(bugun.year());
Boolean artikYilMi = Date.isLeapYear(Date.today().year());
System.debug(artikYilMi); //false