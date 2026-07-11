Datetime simdi = Datetime.now();
System.debug(simdi);//GMT değerini verir // 2026-01-07 03:02:48

Datetime dt = Datetime.newInstance(2035, 2, 25, 11, 30, 00);
System.debug(dt); //2035-02-25 08:30:00

Datetime dt1 = Datetime.newInstanceGMT(2035, 2, 25, 11, 30, 00);
System.debug(dt1); //2035-02-25 11:30:00

Integer saat = dt1.hour();
System.debug(saat); //14
Integer saatGMT = dt1.hourGMT();
System.debug(saatGMT); //11

Long lg = Datetime.now().getTime();
system.debug(lg);//1767755443721

Datetime lg1 = Datetime.newInstance(lg);
System.debug(lg1); //2026-01-07 03:12:54