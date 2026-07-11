public class SetMetodlariDemo {
    public static void tekCift(set<integer> numbers){
        set<integer> tekSayilar = new set<integer>();
        set<integer> ciftSayilar = new set<integer>();
        for(integer i : numbers ){
            if(math.mod(i, 2) == 0){
                System.debug(i + 'sayisi ciftdir..');
                ciftSayilar.add(i);
            }else{
                System.debug(i + 'sayisi tekdir..');
                tekSayilar.add(i);
            }
        }
        System.debug('tek sayilar => ' + tekSayilar);
        System.debug('cift sayilar => ' + ciftSayilar);
    }
}