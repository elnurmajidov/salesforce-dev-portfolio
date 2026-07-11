public class StringAssignment {

    public static void run() {

        // 1) localString oluştur
        String localString = 'Thanks for the session on the string';

        // 2) length (uzunluk)
        Integer len = localString.length();
        System.debug('Length: ' + len);

        // 3) upper case
        String upper = localString.toUpperCase();
        System.debug('Uppercase: ' + upper);

        // 4) "session" var mı? (küçük harf)
        Boolean hasSessionLower = localString.contains('session');
        System.debug('Contains "session": ' + hasSessionLower);

        // 5) "sessions" var mı?
        Boolean hasSessions = localString.contains('sessions');
        System.debug('Contains "sessions": ' + hasSessions);

        // 6) "SESSION" var mı? (büyük harf)
        Boolean hasSESSION = localString.contains('SESSION');
        System.debug('Contains "SESSION": ' + hasSESSION);
    }
    //Write a method using Apex String methods to extract the company name from an email address.
    //john@salesforce .com ====> salesforce
    //marry@audi.com ====> audi
    public string companyName(string email){
        Integer atindex = email.indexOf('@');
        Integer dotindex = email.indexOf('.');
        String companyName = email.substring(atindex + 1, dotindex);
        return companyName.touppercase();

    }
}