public class SoqlKonulari {
    public static void allContacts(){
        List<contact> listContacts = [SELECT name, phone FROM contact];
        System.debug(listContacts);
    }

    public static void latestContactOnly(){
        Contact latestCnt = [SELECT name, email FROM contact ORDER BY CreatedDate DESC LIMIT 1];
        System.debug( 'son olusturulan contact rekordu = ' + latestCnt);
        System.debug(latestCnt.name);
        System.debug(latestCnt.email);
    }

    public static void contactWithEmail (){
        List <contact> listEmailContacts = [SELECT Id, Name, Email FROM contact WHERE email != ''];
        System.debug(' Listemizin kayit sayisi = ' + listEmailContacts.size());
        for(contact eachCnt : listEmailContacts){
            System.debug(eachCnt.name);
            System.debug(eachCnt.Email);
            // System.debug(eachCnt.Phone); ==> gelmeyecek cunku yukarida listeye eklemedik!
            System.debug('===============');
        }
    }

    public static void contactFilterName ( string fName){
        List<contact> filteredContacts = [SELECT name, email, phone FROM contact WHERE firstName =: fName];
        System.debug(filteredContacts);
    }

    public static void fetchOppsAndAccount(){
        List<Opportunity> listOfOpp = [SELECT Id, Name, Amount, StageName, AccountId, account.name, account.phone, account.type, account.industry FROM Opportunity where stageName != 'Closed Won' and stageName != 'Closed Lost'];

        System.debug('List Of Opps = ' + listOfOpp);

        for(Opportunity opp : listOfOpp){
            System.debug(opp);
            System.debug('Opp name is ' + opp.Name + ', amount and stage name of opp is ' + opp.Amount + ' &' + opp.StageName);
            if(opp.AccountId != null){
                System.debug(' Bu opp nin bagli oldugu account ' + opp.Account.Name + ' ' + opp.Account.Phone + ' ' + opp.Account.Industry);
            }else {
                System.debug('Bu opp bir accounta bagli degil');
            }
        }
    }
}