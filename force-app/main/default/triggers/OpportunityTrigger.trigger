trigger OpportunityTrigger on Opportunity (before update) {

    /*Bir opportunitynin stage Name i update edildiğinde: 
     closed lost olarak değiştirildiğinde Description da 'çok üzgünüz' mesajını yazdırsın.
     closed won olarak değiştirildiğinde 'yaşasın' mesajı yazdırsın. 
     Prospecting olarak değiştirilmek istendiğinde izin vermesin hata mesajı olarak 'süreci başa döndüremezsiniz..' 
    mesajını ver.*/

    if(Trigger.isBefore && Trigger.isUpdate){
        for(Opportunity opp : trigger.new){
            String newStageName = opp.StageName;
            String oldStageName = Trigger.oldMap.get(opp.Id).StageName;
            // StageName ın değişip değişmediğini kontrol ederiz
            if(newStageName != oldStageName){
                opp.CloseDate = opp.CloseDate.addDays(5);
                // Guncel değerin closed lost olup olmadıgını kontrol ederiz
                if(newStageName == 'Closed Lost'){
                    opp.Description = 'Çok Üzgünüz';
                }else if(newStageName == 'Closed Won'){
                    opp.Description = 'Yaşasın';
                }else if(newStageName == 'Prospecting'){
                    opp.addError('Sureci Başa donduremezsiniz');
                }
            }
        }
    }

// 5. When an opportunity is created, show a debug message ([OpportunityName] –  [CloseDate] – [Amount]) for each opportunity and print the total number of opportunities created in the transaction. For example: Demo Opportunity – 20/10/2022– 40000.

// 6. When opportunity is created print the StageName, value of description field and opportunity name.

    if(Trigger.isBefore && Trigger.isInsert){
        for(Opportunity o : Trigger.new){
            System.debug(o.Name + ' ' + o.CloseDate + ' ' + o.Amount);
            System.debug(o.StageName + ' ' + O.Description + ' ' + O.Name);

        }
        System.debug('Opprtunity size ' + Trigger.new.size());
    }

// 7. Print the new and old field values for (Opportunity Name and Amount) fields whenever an opportunity is updated
    if(Trigger.isBefore && Trigger.isUpdate){
        for(Opportunity opp: trigger.new) {
            Opportunity oppOld = Trigger.oldMap.get(opp.Id);
            System.debug(' oppNewName' + opp.Name + ' oppNewAm' + opp.Amount);
            System.debug(' oppOldName ' + oppold.Name + ' oppOldAm ' + oppOld.Amount);
        }
    }
// 8. When the StageName of an opportunity is updated, then print the value of description field and opportunity name.
    if(Trigger.isBefore && Trigger.isUpdate){
        for(Opportunity opp: trigger.new) {
                String newStName = opp.StageName;
                String oldStName = Trigger.oldMap.get(opp.Id).StageName;

                    if(newStName != oldStNAme){
                        System.debug(' oppNewDesc ' + opp.description + ' oppNewName ' + opp.Name);
                    }
                

        }
    }
}
//Stage name her degistirildiginde close date tarihi 5 gun ileriye alinsin.