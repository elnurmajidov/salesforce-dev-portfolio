List<string> strList1 = new List<string>{'Apple', 'Banana', 'Cherry', 'Banana', 'Dragonfruit', 'Cherry'};
Set<string> strSet = ListSetPractice.removeDups(strList1);
System.debug('The created set is: ' + strSet);
System.debug('=======Second Run=====');

List<string> strList2 = new List<string>{'Pinapple', 'Pinapple', 'Pizza', 'Pinapple', 'Pinapple'};
System.debug('The created set is: ' + ListSetPractice.removeDups(strList2));