trigger ContactTrigger on Contact (before insert, before update, before delete, after insert, after update, after delete, after undelete) {

    /* Contact lastName her değiştirildiğinde, Contact Trigger Contact ın description fieldına aşağıdaki mesajı yazdırsın.
    Mesaj : lastName değiştirildi - [OldLastName], [NewLastName] olarak değiştirildi.
    Örneğin: Soyadı 'Yilmaz' olan bir kişi 'Erdi' olarak değiştirilirse, aşağıdaki mesaj yazdırılmalıdır:
    •   lastName değiştirildi - Yilmaz, Erdi olarak değiştirildi.
    Lütfen unutmayın, Yukarıdaki mesajın yalnızca recordun  LastName fieldi değiştirildiğinde yazdırılması gerekir.*/

    Map<Id,Contact> oldMap = trigger.oldMap;

        if(Trigger.isBefore && Trigger.isUpdate){
            for(Contact con : Trigger.new){
                Contact oldContact = Trigger.oldMap.get(con.Id);
                if(con.LastName  != oldContact.LastName){
                    con.Description = 'LastName değiştirildı - ' + oldContact.LastName + ', ' + con.LastName + ' olarak değiştirildi.';
                }
            }
        }











    // List<Contact> newVersion = trigger.new;
    // List<Contact> oldVersion = trigger.old;
    // Map<Id,Contact> newVersionMap = trigger.newMap;
    // Map<Id,Contact> oldVersionMap = trigger.oldMap;

    
    // System.debug('Trigger çalıştı');
    // if(Trigger.isBefore && Trigger.isInsert){
    //     System.debug('Trigger Before Insert Calıstı');
    //     system.debug('Before Insert New ' + Trigger.new);
    //     system.debug('Before Insert Old ' + Trigger.old); //null
        
    //     for(Contact con : trigger.new){
    //         System.debug(con);
    //         System.debug(con.LastName);
    //         System.debug(con.FirstName);
    //         System.debug('Before Insert' + con.Id); //null
    //     }
    //     System.debug('Before Insert New Map ' + trigger.newMap); //null
    //     System.debug('Before Insert OldMap ' + trigger.oldMap); //null
    // }
    // else if(Trigger.isAfter && Trigger.isInsert){
    //     System.debug('Trigger After Insert Calıstı');
    //     system.debug('After Insert New ' + Trigger.new);
    //     system.debug('After Insert Old ' + Trigger.old); // null

    //     for(Contact con : trigger.new){
    //         System.debug(con);
    //         System.debug(con.LastName);
    //         System.debug(con.FirstName);
    //         System.debug('After Insert' + con.Id);
    //     }
    //     System.debug('After Insert New Map ' + trigger.newMap); 
    //     System.debug('After Insert OldMap ' + trigger.oldMap); //null
    // }
    // else if(Trigger.isBefore && Trigger.isUpdate){
    //     System.debug('Trigger Before Update Calıstı');
    //     System.debug('Before Update New ' + Trigger.new);
    //     System.debug('Before Update Old ' + Trigger.old);
    // }
    // else if(Trigger.isAfter && Trigger.isUpdate){
    //     System.debug('Trigger After Update Calıstı');
    //     System.debug('After Update New ' + Trigger.new);
    //     System.debug('After Update Old ' + Trigger.old);
    // }
    // else if(Trigger.isBefore && Trigger.isDelete){
    //     System.debug('Trigger Before Delete Calıstı');
    // }
    // else if(Trigger.isAfter && Trigger.isDelete){
    //     System.debug('Trigger After Delete Calıstı');
    // }
    // else if(Trigger.isAfter && Trigger.isUndelete){
    //     System.debug('Trigger After UnDelete Calıstı');
    // }

// 4. Whenever Contact is created with ‘Account’ then print ‘[Contact Name] contact created WITH Account’. If contact is created without ‘Account’ then print ‘[Contact Name]
// contact create WITHOUT Account’
// examples:
// Sachin contact created with Account.
// Jake contact created WITHOUT Account
// 
        if(Trigger.isBefore && Trigger.isInsert){
            for(Contact c : TRigger.new){
                if(c.AccountId != null){
                    System.debug(c.LastName + ' Contact created WITH account. ');
                }else{
                    System.debug(c.LastName + ' Contact created WITHOUT Account. ');
                }
            }
        }

// bir contact create olursa, delete veya undelete olursa veya AccountId si değişirse accountun Number of contacts fieldı guncellensin

    if(Trigger.isAfter){
        if(Trigger.isInsert || Trigger.isUndelete){
            ContactTriggerHandler.insertUndeleteMethod(trigger.new);
        }
        if(Trigger.isUpdate){
            ContactTriggerHandler.updateMethod(trigger.new, trigger.oldMap);  
        }
        if(Trigger.isDelete){
            ContactTriggerHandler.deleteMethod(trigger.old);
        }
    }
}