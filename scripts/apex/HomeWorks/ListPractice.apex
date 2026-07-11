System.debug(ListPractice.findDay(1));
System.debug(ListPractice.findDay(2));
System.debug(ListPractice.findDay(6));
System.debug(ListPractice.findDay(0));
System.debug(ListPractice.findDay(-7));
System.debug(ListPractice.findDay(9));


List<string> days = new List<string>();
days.add('Monday');
days.add('Tuesday');
days.add('Wednesday');
days.add('Thursday');

ListPractice.listMethods(days);

List<String> strList = new List<String>{'Apple', 'Banana', 'Cherry', 'Banana', 'Dragonfruit', 'Cherry'};

Set<String> strSet = ListSetPractice.removeDups(strList);

System.debug('The created set is: ' + strSet);

System.debug('=========SECOND RUN==========');

List<String> strList45 = new List<String>{'Uranium', 'Torium', 'Uranium', 'Uranium', 'Pineapple'};

Set<String> strSet45 = ListSetPractice.removeDups(strList45);

System.debug('The created set is: ' + ListSetPractice.removeDups(strList45));

//===============================//==================================//===========================================//

List <string> myFruits = new List<string>{'Cherry', 'Mango', 'Strawberry', 'Banana', 'Watermelon', 'Apple', 'Orange', 'Tangerine'};
List <string> finalResult = ListPractice.sortDesc(myFruits);
System.debug('Result List: ' + finalResult);
