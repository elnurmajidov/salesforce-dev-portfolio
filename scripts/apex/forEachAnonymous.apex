//LIST
List<string> listStr = new List<string> ();
listStr.add('Out of bond');
listStr.add('yes');
listStr.add('alright');
listStr.add('yes sir');
listStr.add('❤️🐿️❤️');
// || out of bond || yes || allright

string concateStr = '';

//for each loop
//left: create (or define) a new variable to be used inside the for loop
//right: list variable name
for(string eachStr: listStr){
    concateStr += ' || ' + eachStr;
}
System.debug(concateStr);