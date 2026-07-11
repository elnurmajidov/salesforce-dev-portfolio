public with sharing class SomeMethods {
    Public void sayHello(){
        system.debug('Hello');
    }
    Public void sayHello2(string name){
        system.debug('Hello '+ name);
    }

    public string greeting(time myTime){
        integer myHour=myTime.hour();
        string greeting;
        if(myHour<10){
            greeting='Good Morning';
        }else if(myHour<20){ 
            greeting='Good day';
        }else{
            greeting='Good evening';
        }
        return greeting;
    }

    public integer forLoopExample(integer n){
        integer toplam=0;
        for (Integer i = 1; i <= n; i++) {
            System.debug(i);
            toplam += i;
            System.debug(toplam);
        }
        System.debug(toplam);
        return toplam;
    }

    public decimal getAvarege(integer num1,integer num2,integer num3){
        decimal avg=(num1+num2+num3)/3;
        return avg;
   }

    public static void insertAccount(string accName){
        Account acc=new Account();
        acc.name=accName;
        insert acc;
    }

    public static integer getAccount2() {
        list<account> accList=[select id,name from Account where id IN (select accountId from opportunity where AccountId!=null)];
        return accList.size();
    }
}