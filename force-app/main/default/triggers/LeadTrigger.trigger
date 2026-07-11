// 3. Whenever Lead is created with LeadSource as Web then show "Rating should be Cold" message otherwise show "Rating should be hot".

trigger LeadTrigger on Lead (before insert, before update, after insert) {

    if(Trigger.isBefore && Trigger.isInsert){
        for(lead c1 : Trigger.new){
            if(c1.LeadSource == 'Web'){
                System.debug('Rating should be Cold ');
            }else{
                System.debug('Rating should be Hot');
            }
        }
    }

}