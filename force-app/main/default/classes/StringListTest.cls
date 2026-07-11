public class StringListTest {
    public static List<String> generateStringList(Integer n) {
        List<String> testStrings = new List<String>();

        for (Integer i = 0; i < n; i++) {
            testStrings.add('Test ' + i);
        }

        return testStrings;
    }
}
