// Account acc = new Account();
// acc.Name = null; 
// insert acc;

// System.debug('Kod devam ediyor...');

try{
    Account acc = new Account();
    acc.Name = null; 
    insert acc;
}catch(DMLException dex){
    ErrorController.createError('Anonymous', dex.getMessage(), String.valueOf(dex.getLineNumber()));
    System.debug('DML Exception gercekleşti...');
}catch(Exception e){
    System.debug(e);
    System.debug('Exception type caught: ' + e.getTypeName());    
    System.debug('Message: ' + e.getMessage());    
    System.debug('Cause: ' + e.getCause());    // returns null
    System.debug('Line number: ' + e.getLineNumber());    
    System.debug('Stack trace: ' + e.getStackTraceString());   
}

System.debug('Kod devam ediyor...');

// List<String> list1; // null
// string a = list1[0];
// System.debug(a);

try {
    List<String> list1; // null
    string a = list1[0];
    System.debug(a); 
}catch(DMLException dex){
    System.debug('DML Exception gercekleşti...');
}catch(NullPointerException nex){
    ErrorController.createError('Anonymous', nex.getMessage(), String.valueOf(nex.getLineNumber()));

    System.debug(nex);
} catch (Exception ex) {
    System.debug(ex);
    System.debug(ex.getMessage());
}