public  class AccountTriggerHandler {
    public static void AccountRevenueValue(list<Account> TriggerNew,Map<Id,Account> OldMap) {
// When the Annual revenue value of an Account is reduced from the previous value then Throw
// error with the following message:
// a. 'Annual Revenue for an account cannot be reduced'.
// And do not allow the user to save the record
            for(Account acc:TriggerNew){
                decimal oldAnnualRevenue = OldMap.get(acc.Id).AnnualRevenue;
                if(acc.AnnualRevenue < oldAnnualRevenue){
                    acc.AnnualRevenue.addError('Annual Revenue for an account cannot be reduced');

                }              


            }

    }

//     public static void createNewContact(List<Account> newList) {
//         List<Contact> listNew = new List<Contact>();
//         for (Account a : newList) {
//             Contact newCon = new Contact();
//             newCon.LastName = a.Name;
//             newCon.Phone = a.Phone;
//             newCon.AccountId = a.Id;
//             listNew.add(newCon);
//         }
//         if(!newList.isEmpty()) {
//             insert listNew;
//         } 

//     //4. Write a trigger on the Account when the Account is updated, check all opportunities related to the account. Update all Opportunity Stage to close lost if stage name not already set to closed won.

//         public static void updateOppWhenAccountChanged(List<Account> newList) {
//         List<Opportunity> listOpp = [
//             SELECT Id, StageName
//             FROM Opportunity
//             WHERE StageName NOT IN ('Closed Lost', 'Closed Won') AND AccountId IN :newList
//         ];
//         if(!listOpp.isEmpty()) {
//             for (Opportunity o : listOpp) {
//                o.StageName = 'Closed Won';
//             }
//             update listOpp;
//         }
//     }
//     }

// // 5. Whenever an Account phone number is modified, update all the contacts of the Account as follows:
// // - Contacts otherPhone as Old phone no of account
// // - Contacts mobilePhone as New phone no of Account

//     public static void AccountRelatedContact(List<Account> Triggernew,Map<Id,Account> oldMap){
//         set<Id>accList = new set<Id>();
//         for(Account acc : Triggernew){
//             if(acc.Phone != oldMap.get(acc.Id).Phone){
//                 accList.add(acc.Id);
//             }
//         }
//         List<Contact> conList = [SELECT Id, OtherPhone,MobilePhone,AccountId FROM Contact WHERE AccountId IN : accList];
//         if(!conList.isEmpty()){
//             for(Contact c : conList){
//                 c.OtherPhone = oldMap.get(c.AccountId).Phone;
//                 c.MobilePhone = TriggerNew.get(c.AccountId).Phone;
                
//             }
//             update conList;
//         }
//     }
}