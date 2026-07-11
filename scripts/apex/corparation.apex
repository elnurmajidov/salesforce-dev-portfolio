Integer x = 5;

Boolean rs1 = (x == 5);
System.debug(rs1); //true

Boolean rs2 = (x != 5);
System.debug(rs2); //false

Boolean rs3 = (x != 7);
System.debug(rs3); //true

Boolean rs4 = (x < 7);
System.debug(rs4); //true

Boolean rs5 = (x > 17);
System.debug(rs5); //false

Boolean rs6 = rs1 && rs2 ; // true && false
System.debug(rs6); //false

Boolean rs7 = rs1 && rs3 && rs4; // true && true && true;
System.debug(rs7); // true

Boolean rs8 = rs1 || rs2 || rs5 || rs6 ;
System.debug(rs8); //true

Boolean rs9 = !rs8;
System.debug(rs9); //false

Boolean rs10 = (rs1 && rs2 ) || (rs3 && rs4);
            //  ( true && false) || (true && true)
            //  false || true
            // true
System.debug(rs10); //true

Integer y = 3;

y += 2; // y = y+2;
System.debug(y); //5

y -= 3 ; // y = y-3;
System.debug(y); // 2

y++; //y = y+1;
System.debug(y);//3

y--; // y =y-1;
System.debug(y); // 2