public  class AccountTriggerHandler {
        // Bir Account create edildiğinde, Amountu Accountun AnualRevenueu sunun 10 da 1 ine eşit olan opp create edelim.
    public static void createOpportunity(List<Account> newAcc){
        List<Opportunity> opportunities = new List<Opportunity>();

        for(Account acc : newAcc){
            Opportunity opp = new Opportunity();
            opp.Name = 'Opp ' + acc.Name;
            opp.StageName = 'Prospecting';
            opp.CloseDate = Date.today().addMonths(3);
            if(acc.AnnualRevenue != null){
                opp.Amount = acc.AnnualRevenue/10;
            }

            // opp.Amount = acc.AnnualRevenue !=null ? acc.AnnualRevenue/10 : null ;

            opp.AccountId = acc.Id;
            opportunities.add(opp);
        }

        if(!opportunities.isEmpty()){
            insert opportunities;
        }
    }

    // Bir Account güncellendiğinde, bu Accounta bağlı olan Status u Open olan taskların hepsinin description fieldını guncelleyelım.

    public static void updateRelatedTasks(Map<Id,Account> triggerNewMap){

        // Map<Id,Account> accNewMap = Trigger.newMap
        // Set<Id> accIds = Trigger.newMap.keySet()
        // Eğer update işlemi gercekleşen tum accountlara bağlı tasklerde işlem yapacaksak map.keyset() methodu ile accountIdlerine ulaşılır

        List<Task> tasks = [SELECT Id 
                            FROM Task
                            WHERE Status != 'Completed' AND WhatId IN :triggerNewMap.keySet()];

        if(!tasks.isEmpty()){
            for(Task t : tasks){
                t.Description = 'Accountunuz update oldu , gerekli kontrolleri sağlayın';
            }

            update tasks;
        }
    }

    // Bir Accountun industry fieldı update edildiğinde bu accounta bağlı Opportunity recordlarının description fieldında "Accountun industry fieldı [eskiIndustry] iken [yeniIndustry] olarak guncellendi." olarak update edilsin.

    // public static void updateRelatedOpportunities(List<Account> triggerNew,Map<Id,Account> triggerOldMap, Map<Id,Account> triggerNewMap){
    //     Set<Id> accIds = new Set<Id>();

    //     for(Account acc : triggerNew){
    //         Account oldAcc = triggerOldMap.get(acc.Id);
    //         if(acc.Industry != oldAcc.Industry){
    //             accIds.add(acc.Id);
    //         }
    //     }

    //     if(!accIds.isEmpty()){
    //         List<Opportunity> opportunities = [SELECT Id,AccountId 
    //                                             FROM Opportunity
    //                                             WHERE AccountId IN : accIds];
    //         if(opportunities.isEmpty()) return;

    //         for(Opportunity opp: opportunities){
    //             Account oldAcc = triggerOldMap.get(opp.AccountId);
    //             Account newAcc = triggerNewMap.get(opp.AccountId);

    //             opp.Description ='Accountun industry fieldı ' + oldAcc.Industry + ' iken ' +  newAcc.Industry + ' olarak guncellendi';
    //         }
    //         update opportunities;
    //     }
    // }


    public static void updateRelatedOpportunities2(Map<Id,Account> triggerOldMap, Map<Id,Account> triggerNewMap){

        Set<Id> accIds = new Set<Id>();

        for(Id Id:triggerNewMap.keySet()){
            Account newAcc = triggerNewMap.get(Id);
            Account oldAcc = triggerOldMap.get(Id);
             if(newAcc.Industry != oldAcc.Industry){
                accIds.add(Id);
            }
        }

        if(!accIds.isEmpty()){
            updateFutureRelatedOpportunities2(accIds);
            // List<Opportunity> opportunities = [SELECT Id,AccountId 
            //                                     FROM Opportunity
            //                                     WHERE AccountId IN : accIds];
            // if(opportunities.isEmpty()) return;

            // for(Opportunity opp: opportunities){
            //     Account oldAcc = triggerOldMap.get(opp.AccountId);
            //     Account newAcc = triggerNewMap.get(opp.AccountId);

            //     opp.Description ='Accountun industry fieldı ' + oldAcc.Industry + ' iken ' +  newAcc.Industry + ' olarak guncellendi';
            // }
            // update opportunities;
        }
    }

    @future
    public static void updateFutureRelatedOpportunities2(Set<Id> accountIds){

         List<Opportunity> opportunities = [SELECT Id,AccountId 
                                                FROM Opportunity
                                                WHERE AccountId IN : accountIds];
            if(opportunities.isEmpty()) return;

            for(Opportunity opp: opportunities){
                // Account oldAcc = triggerOldMap.get(opp.AccountId);
                // Account newAcc = triggerNewMap.get(opp.AccountId);

                opp.Description ='Accountun industry fieldı ' +  ' guncellendi';
            }
            update opportunities;
    }

    // Bir Opportunity Closed Won oldugunda bağlı oldugu Accountun Type ını Customer yapan kodu yazalım. // after update  (ODEV)

    
    // Bir Account recordu silinirken bu accounta bağlı Priority si 'High' olan Status'Completed' olmayan taskleri GENERAL ACCOUNT recorduna bağlayın

    public static void reparentDeletedTask(Set<Id> accIds){
        // Triggerı tetikleyen tüm acc larda işlem yapacağız
        // Bu accountlara bağlı olan uygun task var mı
        // taskleri reparent işlemi yapacağız

        List<Task> tasks = [SELECT Id 
                            FROM Task 
                            WHERE WhatId IN :accIds AND Priority = 'High' AND Status != 'Completed'];
        
        Account generalAccount = [SELECT Id FROM Account WHERE Name = 'GENERAL ACCOUNT' LIMIT 1];

        if(!tasks.isEmpty()){
            for(Task ts : tasks){
                ts.WhatId = generalAccount.Id;
            }
            update tasks;
        }
    }


    public static void createRelatedContact(List<Account> triggerNew){
         List<Contact> contacts = new List<Contact>();
        for(Account acc : triggerNew){
            Contact con = new Contact();
            con.FirstName = acc.Name;
            con.LastName = 'Contact';
            con.AccountId = acc.Id;
            contacts.add(con);
        }

        insert contacts;
    }

    @future
    public static void createFutureRelatedContact(Set<Id> accIds){

        List<Contact> contacts = new List<Contact>();
        for(Id accId : accIds){
            Contact con = new Contact();
            con.LastName = 'Contact';
            con.AccountId = accId;
            contacts.add(con);
        }

        if(!contacts.isEmpty()){
            insert contacts;
        }
    }




}