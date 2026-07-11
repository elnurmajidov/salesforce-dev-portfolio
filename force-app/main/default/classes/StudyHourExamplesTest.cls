@isTest
public class StudyHourExamplesTest {
    @isTest
    public static void calculateDiscountTest(){

        decimal calValue1 = StudyHourExamples.calculateDiscount(24.5);
        decimal calValue2 = StudyHourExamples.calculateDiscount(-2);

        Assert.areEqual(22.05,calValue1);
        Assert.areEqual(0,calValue2);
    }
}