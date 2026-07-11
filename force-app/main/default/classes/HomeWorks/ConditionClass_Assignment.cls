// public class ConditionClass_Assignment {
//     public String IfClassMethod(Integer monthNumber) {

//     }
// }

// public class ConditionClass_Assignment {

//     1️⃣ IF ile: Integer ver → Month döndür
//     public static String IfClassMethod(Integer inputNumber) {

//       / default (başlangıç) değer
//         String output_Month = 'Not a valid Month';

//          şartlar
//         if (inputNumber == 1) {
//             output_Month = 'January';
//         } else if (inputNumber == 2) {
//             output_Month = 'February';
//         } else {
//             output_Month = 'Not a valid Month';
//         }

//         return output_Month;
//     }


//     2️⃣ CASE ile: Month name ver → Quarter döndür
//     public static String caseMethod(String monthName) {

// default değer
//         String output_Quarter = 'Enter a proper Month name';

//          boş/null kontrolü (güvenli olsun diye)
//         if (monthName == null) {
//             return output_Quarter;
//         }

//         /yazım farklarını azaltmak için normalize edelim
//         String m = monthName.trim().toLowerCase();

//          Switch/Case (Apex'te switch on String var)
//         switch on m {
//             when 'january', 'february', 'march' {
//                 output_Quarter = 'Quarter 1';
//             }
//             when else {
//                 output_Quarter = 'Not a valid Quarter';
//             }
//         }

//         return output_Quarter;
//     }
// }


public class ConditionClass_Assignment {
    public String IfClassMethod(Integer monthNumber) {
        string output_Month ='' ;
        if(monthNumber == 1){
            output_Month = 'January';
        }else if(monthNumber == 2){
            output_Month = 'Feburary';
        }else{output_Month = 'Not a valid month' ;}
        return output_Month;

    }

public string caseMethod (string monthName){
    string output_Quarter ='';
    if(monthName == 'January' || monthName == 'Feburary' || monthName == 'March'){
        output_Quarter = 'Quarter 1';
    }else{output_Quarter = 'Not a valid month Quarter';}
    return output_Quarter;

    }
}