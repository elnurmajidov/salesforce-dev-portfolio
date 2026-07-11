// trigger CaseTrigger on Case (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
//     System.debug('We are in the triggers');

//     if(Trigger.isAfter){
//         System.debug('We are in the after triggers');
//         if(Trigger.isInsert){
//             System.debug('We are in the after insert triggers');
//         } else if(Trigger.isUpdate){
//             System.debug('We are in the after update triggers');
//         }

//     } else if(Trigger.isBefore){
//         System.debug('We are in the before triggers');
//         if(Trigger.isInsert){
//             System.debug('We are in the before insert triggers');
//         } else if(Trigger.isUpdate){
//             System.debug('We are in the before update triggers');
//         }
//     }

    
// }
trigger CaseTrigger on Case (before insert, before update, after insert, after update) {
// Bir Case recordu create edildiğinde eğer Priority 'High' ise recordun Status ununu 'Escalated' yapalım.
    if(Trigger.isBefore && Trigger.isInsert){
        for(Case cs : trigger.new){
            if(cs.Priority =='High'){
                cs.Status = 'Escalated';
            }
        }
    }

// Bir case recordu create edildiğinde veya update edildiğinde Subject fieldı boş bırakılamaz..

    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
        for(Case cs : trigger.new){
            // if(cs.Subject == null){
            if(String.isBlank(cs.Subject)){
                cs.Subject.addError('Subject fieldı boş bırakılamaz');
            }
        }
    }

// Try to print this message (Case# [caseNumber] was created with id [recordId] on [createdDate].) in all the events where Id is not null.
// For example: when a case with Id as ‘5005j00000C7CRJAA3’ and with case number as ‘11234’ created on 12/7/2021. then the message should be printed as – Case# 11234 was created with id 5005j00000C7CRJAA3 on 12/7/2021

    if(Trigger.isAfter && Trigger.isInsert){
        for(Case cs : Trigger.new){
            System.debug(' Case,,,' + cs.CaseNumber + ' Was created with id ,,, ' + cs.Id + ' on ' + cs.CreatedDate);
            
        }
    }
// 2. Show the message as 'Case origin is changed for [Case Number]' whenever case origin field value is changed.

    if(Trigger.isBefore && Trigger.isUpdate){
    for(Case c : Trigger.new){
        String newOrigin = c.origin;
        String oldOrigin = Trigger.oldMap.get(c.Id).origin;

        if(newOrigin != oldOrigin){
            System.debug(' Case origin is changed for ' + c.CaseNumber);
        }
    }
}

// Bir Case kapatıldıgında (status ='Closed') oldugunda Case ın bağlı oldugu Account objedeki Last Support Date fieldı guncelleyen kodu yazalım

    if(Trigger.isAfter && Trigger.isUpdate){
        CaseTriggerHandler.updateRelatedAccount(Trigger.new);
    }

}