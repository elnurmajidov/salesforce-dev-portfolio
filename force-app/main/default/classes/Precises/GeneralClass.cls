public class GeneralClass {
    public void createStudents(){
    Student s1 = new Student();
    s1.Name = 'Adam';
    s1.Birthdate = date.newInstance(1995, 10, 10);
    s1.SchoolName = 'Oxford University';
    System.debug(s1);

    Student s2 = new Student();
    s2.Name = 'Enes';
    s2.Birthdate = date.newInstance(1993, 11, 5);
    s2.SchoolName = 'Harward University';
    System.debug(s2);
    }

    public void method2(){
        integer i = 5 + 5 + 5 + 5;
        System.debug(i);
    }
}