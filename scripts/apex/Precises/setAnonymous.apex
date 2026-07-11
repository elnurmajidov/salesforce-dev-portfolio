Set<Integer> sayilar = new set<Integer>{1,2,2,3,4,4,5,5};
// sayilar.add('yedi');
System.debug(sayilar);

set<string> meyveler = new set<string>();
meyveler.add('elma');
meyveler.add('elma');
meyveler.add('eLma');
meyveler.add('Elma');
meyveler.add('armut');
meyveler.add('uzum');
meyveler.add('armut');

System.debug(meyveler);

list<string> sebzeler = new List<string>();
sebzeler.add('havuc');
sebzeler.add('patates');
sebzeler.add('havuc');
sebzeler.add('patlican');
sebzeler.add('havuc');
sebzeler.add('patates');

System.debug(sebzeler);

set<string> setSebzeler = new set<string>();
setSebzeler.addAll(sebzeler);
System.debug(setSebzeler);