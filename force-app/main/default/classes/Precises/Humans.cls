public class Humans {
    public string fullName(string firstName, string lastName){
        string upperFirstName = firstName.toUpperCase();
        string upperLastName = lastName.toUpperCase();
        String fullName = upperFirstName + ' ' + upperLastName;
        return fullName;
    }
    public integer yas(date dogumTarihi){
        date today = date.today();
        integer toplamGunSayisi = dogumTarihi.daysBetween(today);
        integer a = integer.valueOf(toplamGunSayisi/365);
        return a;
    }
}