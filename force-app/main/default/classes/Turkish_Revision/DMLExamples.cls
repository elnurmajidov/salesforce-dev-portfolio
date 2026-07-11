public class DMLExamples {
    // En yüksek annualRevenue ya sahip accountun description fieldına mesaj ekleyen bir method yazalım
    public static Id updateHighestAccount(){
        Account acc = [SELECT Id ,Name, AnnualRevenue FROM Account WHERE AnnualRevenue != null ORDER BY AnnualRevenue DESC LIMIT 1];
        String message = Date.today() + ' tarihi itibariyle ' + acc.Name + ' recordu, annualRevenuesu ' + acc.AnnualRevenue + ' ile en buyuk değere sahip olan recorddur .';
        acc.Description = message;
        update acc;

        return acc.Id;
    }

    // Accountunun Industry fieldı 'Technology' olan,
    // Phone fieldı boş olmayan,
    // Son 7 gün içinde olusturulmus olan
    // Contact recordlarının description fieldını mesaj ekleyelim.

    public static Set<Id> updateContacts(){
        Set<Id> conIds = new Set<Id>();
        List<Contact> contacts = [SELECT Id 
                                    FROM Contact
                                    WHERE Account.Industry = 'Technology'
                                    AND Phone != null
                                    AND CreatedDate = LAST_N_DAYS:7
                                 ];
        if(!contacts.isEmpty()){
            for(Contact con : contacts){
                con.Description = 'Updated Contact';
                conIds.add(con.Id);
            }

            update contacts;
        }

        return conIds;
    }

    // Son 15 gün içinde create edilmiş olan ,
    // Henuz sonuclanmamıs (Closed olmamıs)
    // Amountu en buyuk olan 
    // Opportunity recorduna bağlı task recordu olusturalım

    public static Id createTaskForTopAmountOpportunity(){
        List<Opportunity> oppList = [SELECT Id ,OwnerId
                                    FROM Opportunity
                                    WHERE isClosed = false
                                    AND CreatedDate = LAST_N_DAYS:15
                                    AND Amount != null
                                    ORDER BY Amount DESC
                                    LIMIT 1
                                    ];
        if(!oppList.isEmpty()){
            Opportunity opp = oppList[0];

            Task task = new Task();
            task.Subject = 'Amountu en yüksek olan Opportunityi Takip Et';
            task.WhatId = opp.Id;
            task.Priority = 'High';
            task.Description = 'Bu record amountu en yüksek olan henuz sonuclanmamıs opp ıcın olusturulmustur.';
            task.ActivityDate = Date.today().addDays(3);
            task.OwnerId = opp.OwnerId;

            insert task;

            return opp.Id;
        }

        return null;
    }
    /*
    Parametrede verilen namene ait account recorduna bagli bir tane contact cretae edelim contactin kendisini return edelim.
    */

    public static Contact createContactRelatedAccount(string accName){
        List<Account> listAcc = [SELECT Id, Name, OwnerId
                                 FROM Account
                                 WHERE Name =: accName 
                                 LIMIT 1 ];
        if (!listAcc.isEmpty()){
            Contact con = new Contact();
            con.LastName = listAcc[0].name + ' Contact ';
            con.AccountId = listAcc[0].Id;
            con.OwnerId = listAcc[0].OwnerId;
            insert con;
            return con;
        }
        return null;
    }
}