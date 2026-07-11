/*
{'super', 'bat', 'he', 'iron', 'spider', 'ant', 'super', 'spider'} elemanlarını içeren bir list create edin. 
 Listenin her bir elemaninin sonuna 'man' ekleyin ve bu isimleri set içerisinde toplayın. (heman i he-man olarak yazsin). 
*/

List<String> heroList = new List<String> {'super', 'bat', 'he', 'iron', 'spider', 'ant', 'super', 'spider'};

Set<String> heroSet = new Set<String>();

for(String hero : heroList){
    if(hero == 'he'){
        // heroSet.add('he-man');
        heroSet.add( hero + '-man'); // he için -man ekle
    }else{
        heroSet.add(hero + 'man'); // diğerleri için man ekle
    }
}
// Set duplicate elemanları barındırmaz
System.debug('HeroSet ' + heroSet); //{antman, batman, he-man, ironman, spiderman, superman}




//======================================

List<Decimal> listPrices = new List<Decimal>{12.24,45.56,23.11,4,39.39,65.67,39.39,39.39};
Set<Decimal> prices = SetExamples.findPricesInRange(listPrices, 30.05, 46);
// Set<Decimal> prices = SetExamples.findPricesInRange(new List<Decimal>{12.24,45.56,23.11,4,39.39,65.67,39.39,39.39}, 30.05, 46);


System.debug(prices); //{39.39, 45.56}