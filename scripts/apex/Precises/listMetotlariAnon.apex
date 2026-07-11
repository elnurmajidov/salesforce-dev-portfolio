List<string> isimler = new List<string>();
isimler.add('Esra');
isimler.add('Cavan');
isimler.add('Robert');
isimler.add('Madisson');
isimler.add('Ruslan');

System.debug(isimler);
integer kactanevar = isimler.size();
System.debug(' listenin eleman sayisi = ' + kactanevar);
System.debug('Listem bosmu ? ' + isimler.isEmpty());

Boolean icerik1 = isimler.contains('Madisson');
System.debug(' Madisson ismini iceriyor mu ? ' + icerik1);

Boolean icerik2 = isimler.contains('Drakula');
System.debug('Drakula ismini iceriyor mu ? ' + icerik2);

List<string> isimler1 = new List<string>{'Ali', 'Veli', 'Selami'};
List<string> isimler2 = new List<string>{'Ali', 'Veli', 'Selami'};
List<string> isimler3 = new List<string>{'Musa', 'Sura', 'Canan'};

System.debug(' isimler 1 ile isimler 2 biribirine esit mi ? ' + isimler1.equals(isimler2) );
System.debug(' isimler 1 ile isimler 3 biribirine esit mi ? ' + isimler1.equals(isimler3) );