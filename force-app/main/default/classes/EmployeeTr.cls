public class EmployeeTr {
    // class variables
    Decimal salary;  // default access modifier private 
    private String name;
    private Integer age;
    String position;
    static String companyName = 'ABC Company';
    static Integer employeeCounter = 0;

    // constructor
    public EmployeeTr(String name, Integer age, Decimal salary, String position){
        this.name = name;
        this.age= age;
        this.salary = salary;
        this.position = position;
        employeeCounter ++ ; // employeeCounter= employeeCounter + 1

    }
    public EmployeeTr(){
         employeeCounter ++ ;
    }

    // getters and setters
    public String getName(){
        return this.name;
    }

    public void setName(String name){
        this.name = name;
    }

    public Integer getAge(){
        return this.age;
    }

    public void setAge(Integer age){
        if(age<18){
            System.debug('Çalışan yaşı 18\'den küçük olamaz!!');
        }else{
            this.age = age;
        }
    }

    public Decimal getSalary(){
        return this.salary;
    }

    public void setSalary(Decimal salary){
        if(salary <28000){
            System.debug('Çalışan maaşı 28000 \'den az olamaz!!!');
        }else{
            this.salary = salary;
        }
    }

    public String getPosition(){
        return this.position;
    }

    public void setPosition(String position){
        this.position = position;
    }

    public String employeeDetails(){
        String details = 'Çalışan Adı : ' + this.name + ', Çalışan Yaşı : ' + this.age + ', Çalışan Maaşı : ' + this.salary + ', Çalışan Pozisyonu : ' + this.position + ' Şirket Adı : ' + companyName + ' , Çalışan Sayısı ' + employeeCounter;
        return details;
    }

    public static Integer getEmployeeCounter(){
        return employeeCounter;
    }

    // static bir variable non-static methodda kullanılabilir
    // non-static bir variable ı static methodda kullanamayız!!!
    // this keyi sadece non-static ile  kullanılabilir
}