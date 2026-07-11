public class IfElse {
    public string selam(string dil){
        string slm;
        if(dil == 'Hintce'){
            slm = 'Namaste';
        } else if(dil == 'Rusca'){
            slm = 'Privet';
        } else if(dil == 'Ingilizce'){
            slm = 'Hello';
        } else {
            slm = 'Merhaba';
        }
        System.debug(slm);
        return slm;
    }

    public string selam2 (string language){
        string selam;
        switch on language{
            when 'Hintce' {
                selam = 'Namaste Namaste';
            }
            when 'Ingilizce' {
                selam = 'Hello Hello';
            }
            when 'Rusca'{
                selam = 'Privet Privet';
            } when else {
                selam = 'Merhaba Merhaba';
            }
        }
        return selam;
    
    }

    public string selam(integer n, string language){
        string selam = selam (language);
        string tekrarliSelam = '';
        for(integer i=1; i<=n; i++){
            tekrarliSelam = tekrarliSelam + ' ' + selam;
        }
        return tekrarliSelam;
    }
}