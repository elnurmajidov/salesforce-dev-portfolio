public  class PrimitiveDataTypeDemo {
   //creating a method
   public void printBasicDataType(){
    //this is method body.
    string batchName = 'Batch 32';
    integer totalCandidates = 40;
    boolean isAdminCompleted = true;

    system.debug('total candidates ==> ' + totalCandidates);

    string batchDescription = batchName + ' is the best';
    system.debug(batchDescription);

    Decimal dec = 74.28;
    system.debug('decimal value is .. ' + dec);

    Long longValue = 7876798989L;
    system.debug('long value is .. ' + longValue);

   } 
}