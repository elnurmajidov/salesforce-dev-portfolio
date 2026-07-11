// System.debug(ConditionClass_Assignment.IfClassMethod(1)); // January
// System.debug(ConditionClass_Assignment.IfClassMethod(2)); // February
// System.debug(ConditionClass_Assignment.IfClassMethod(10)); // Not a valid Month

// System.debug(ConditionClass_Assignment.caseMethod('January')); // Quarter 1
// System.debug(ConditionClass_Assignment.caseMethod('MARCH'));   // Quarter 1
// System.debug(ConditionClass_Assignment.caseMethod('April'));   // Not a valid Quarter
// System.debug(ConditionClass_Assignment.caseMethod(null));      // Enter a proper Month name

ConditionClass_Assignment cls = new ConditionClass_Assignment();
System.debug(cls.IfClassMethod(1));
System.debug(cls.IfClassMethod(2));
System.debug(cls.IfClassMethod(8));
System.debug(cls.caseMethod('January'));
System.debug(cls.caseMethod('Feburary'));
System.debug(cls.caseMethod('March'));
System.debug(cls.caseMethod('April'));
