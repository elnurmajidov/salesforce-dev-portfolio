// Accountun industry fieldı Technology olan recordların type ını Customer olarak batchable classla update edelim.
public class UpdateAccountBatch implements Database.Batchable<sObject>, Database.Stateful {
    public Integer totalAccountSize = 0;

    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator([SELECT Id FROM Account WHERE Industry='Technology' AND Type != 'Customer']);
    }

    public void execute(Database.BatchableContext BC, List<Account> scope) {
        for(Account acc: scope){
            acc.Type ='Customer';
            // totalAccountSize ++;
        }

        update scope;
        totalAccountSize += scope.size();
    }

    public void finish(Database.BatchableContext BC) {
        System.debug('İŞLEM TAMAMLANDI!');
        System.debug('Toplam Record Sayısı => ' + totalAccountSize);
    }
}