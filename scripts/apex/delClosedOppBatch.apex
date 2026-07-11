CreateTaskClosed5DaysBatch cas = new CreateTaskClosed5DaysBatch();
Database.executeBatch(cas);

CreateTaskClosed5DaysBatch m = new CreateTaskClosed5DaysBatch();
String sch = '0 0 1 ? * MON *';
String jobID = System.schedule('CreateTaskClosed5DaysBatch', sch, m);




