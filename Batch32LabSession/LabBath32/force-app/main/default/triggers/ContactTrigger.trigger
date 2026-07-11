trigger ContactTrigger on Contact (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    List<Contact> newVersion = trigger.new;
    List<Contact> oldVersion = trigger.old;
    Map<Id,Contact> newVersionMap = trigger.newMap;
    Map<Id,Contact> oldVersionMap = trigger.oldMap;

    
    System.debug('Trigger çalıştı');
    if(Trigger.isBefore && Trigger.isInsert){
        System.debug('Trigger Before Insert Calıstı');
        system.debug('Before Insert New ' + Trigger.new);
        system.debug('Before Insert Old ' + Trigger.old); //null
        
        for(Contact con : trigger.new){
            System.debug(con);
            System.debug(con.LastName);
            System.debug(con.FirstName);
            System.debug('Before Insert' + con.Id); //null
        }
        System.debug('Before Insert New Map ' + trigger.newMap); //null
        System.debug('Before Insert OldMap ' + trigger.oldMap); //null
    }
    else if(Trigger.isAfter && Trigger.isInsert){
        System.debug('Trigger After Insert Calıstı');
        system.debug('After Insert New ' + Trigger.new);
        system.debug('After Insert Old ' + Trigger.old); // null

        for(Contact con : trigger.new){
            System.debug(con);
            System.debug(con.LastName);
            System.debug(con.FirstName);
            System.debug('After Insert' + con.Id);
        }
        System.debug('After Insert New Map ' + trigger.newMap); 
        System.debug('After Insert OldMap ' + trigger.oldMap); //null
    }
    else if(Trigger.isBefore && Trigger.isUpdate){
        System.debug('Trigger Before Update Calıstı');
        System.debug('Before Update New ' + Trigger.new);
        System.debug('Before Update Old ' + Trigger.old);
    }
    else if(Trigger.isAfter && Trigger.isUpdate){
        System.debug('Trigger After Update Calıstı');
        System.debug('After Update New ' + Trigger.new);
        System.debug('After Update Old ' + Trigger.old);
    }
    else if(Trigger.isBefore && Trigger.isDelete){
        System.debug('Trigger Before Delete Calıstı');
    }
    else if(Trigger.isAfter && Trigger.isDelete){
        System.debug('Trigger After Delete Calıstı');
    }
    else if(Trigger.isAfter && Trigger.isUndelete){
        System.debug('Trigger After UnDelete Calıstı');
    }
}