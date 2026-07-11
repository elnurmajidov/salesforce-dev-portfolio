// for (başlangıç ; koşul ; artış/azalış miktarını){
//     // İşlemi burda yapıyoruz
// }

for(Integer i = 0 ; i<5 ; i++){
    // i 0'dan başlasın , i 5'den küçük oldugu müddetce loop devam etsin , her bir turda i 1 artsın
    System.debug(i); // 0 // 1 //2 //3 //4
}

Integer total1 = LoopExamples.sumNumbers(5);
System.debug(total1);

Integer total2 = LoopExamples.sumNumbers(10);
System.debug(total2);

LoopExamples.multiplaction(6);


Integer result1 = LoopExamples.findMultipleOfThree(10);
System.debug(result1); //3

Integer result2 = LoopExamples.findMultipleOfThree(100);
System.debug(result2); //33