public class Employee {
    string name;
    Decimal salary;

    //get method of name variable
    public string getName(){
        return this.name;
    }

    //set method of name variable
    public void setName(string name){
        this.name = name;
    }

    //get method of salary variable
    public decimal getSalary(){
        return this.salary;
    }

    //set method of SAlary variable
    public void setSalary(decimal salary){
        this.salary = salary;
    }

    public void details(){
        System.debug('Employee name and salary are: ' + this.name + ', ' + this.salary);
    }
}