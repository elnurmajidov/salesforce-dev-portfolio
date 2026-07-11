Calculator c = new Calculator();
integer x = 10;
integer y = 15;
integer sum1 = c.add(x, y); //add formulunu yukaridaki loop demo class icine yaz!!!
system.debug('sum1 is ' + sum1);





c.printAndReturnMessage ('print this for batch 32'); //this will work. we are NOT storing in any variable.
//string result = c.printAndReturnMessage('print this for batch 32'); //this will also work. We ARE storing in one variable.
//System.debug(result);


string m = 'print this now. ';
c.printNewMessage(m); //will this work?
string msg = 'print this now too. ';
c.printNewMessage(msg);
c.printNewMessage(77); 

String result = GeometricCalculation.calcPerimeter(10, 15);
System.debug(result);

List<Integer> CalculatorSt = new List<Integer>();
List<Integer> listInteger = new List<Integer>();
listInteger.add(10);
listInteger.add(15);
listInteger.add(21);
listInteger.add(15);
listInteger.add(15);
CalculatorSt.addAll(listInteger);

integer sum = 0;

for (integer eachInt : listInteger){
    System.debug(eachInt);
    sum += eachInt;
    //sum = sum + eachInt
}

System.debug(sum);