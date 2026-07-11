public class ParametreliMethodlar {
    public void dersSonucu() {
        string ad = 'Ahmet';
        string ders = 'Turkce';
        integer notu = 70;
        Boolean gecti = True;
    //Ahmet Turkce dersi sinavindan 70 notunu aldi. Basari durumu: True

        System.debug(ad + ' ' + ders + '' + ' dersi sinavindan ' + notu + ' notunu aldi. Basari durumu:' + gecti );
    }

    public void finalSonuclari(string name, string ders, Integer notu, Boolean basariDurumu){
        System.debug(name + '' + ders + ' dersi sinavindan ' + notu + ' notunu aldi. Basari durumu: ' + basariDurumu);
        string nm = name;
        string drs = ders;
        Integer nt = notu;
        Boolean isPs = basariDurumu;
        System.debug(nm + '' + drs + ' dersi sinavindan ' + nt + ' notunu aldi. Basari durumu: ' + isPs);
    }
}