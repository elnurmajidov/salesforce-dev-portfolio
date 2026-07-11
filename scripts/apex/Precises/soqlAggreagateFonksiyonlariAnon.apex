Integer leedSayisi = [select count() from lead];
System.debug(' lead sayisi = ' + leedSayisi);

aggregateResult toplam = [select sum(amount), avg(amount), min(amount), max(amount) from opportunity];
System.debug('Toplam = ' + toplam);
System.debug('Toplam = ' + toplam.get('expr0'));
decimal sonuc = (Decimal)toplam.get('expr0');
System.debug('Sonuc = ' + sonuc);

System.debug('Ortalama = ' + toplam.get('expr1'));
decimal ort = (Decimal)toplam.get('expr1');
System.debug('Ortalama = ' + ort);
System.debug('Ortalama + =' + ort.setScale(2));