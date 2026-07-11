public class Calculator {
    public static decimal dynamicCalulationMethod(decimal num1, decimal num2, string operator){
        Decimal result;
        switch on operator{
            when 'Addition'{
                result = num1 + num2;           
             }
             when 'Substraction'{
                result = num1 - num2;
             }
             when 'Division'{
                result = num1 / num2;
             }
             when 'Multiplication'{
                result = num1 * num2;
             }
             when else {
                System.debug('Invalid Operator');
                return null;
             }
        }
            return result;
    }
    public static decimal calculateDiscount(decimal a){
      decimal TotalPrice;
      if (a>=1000){
         TotalPrice=a-(a*0.25);
         return TotalPrice;
      }
      else if (a<1000 && a>=800){
         TotalPrice=a-(a*0.15);
         return TotalPrice;
      }
      else  if (a<800 && a>=500){
         TotalPrice=a-(a*0.10);
         return TotalPrice;
      }
      else if (a<500 && a>=100)  { 
         TotalPrice=a-(a*0.5);
         return TotalPrice;
      }
      else if (a>100){
         return TotalPrice;

      }
      return null;
      
   }

public static decimal calculateNetPrice(integer quantity , decimal rate){

        decimal totalPrice = quantity * rate;
        decimal discountPrice =totalPrice * rate;
        decimal netPrice = totalPrice - discountPrice;
        return netPrice;


    }
}

