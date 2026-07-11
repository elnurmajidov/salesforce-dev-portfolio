IfElse s = new IfElse();
s.selam('Hintce');
s.selam('Arapca');
s.selam('Turkce');
s.selam('Rusca');
s.selam('Ingilizce');

IfElse ss = new IfElse();
System.debug(ss.selam2('Hintce'));
System.debug(ss.selam2('Turkce'));
System.debug(ss.selam2('Rusca'));

string company = '';
for(integer i=1 ; i <= 5; i++){
    System.debug(i);
    // System.debug('Salesforce');
    company += 'Salesforce ';
    System.debug(company);
}

IfElse sss = new IfElse();
System.debug(sss.selam(99925, 'Japanise'));