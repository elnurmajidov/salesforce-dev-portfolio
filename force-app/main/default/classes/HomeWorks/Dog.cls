public class Dog {
    String name;
    String color;
    Integer age;

    public Dog(){
        age = 1;
        checkAge();
    }
    public Dog (String name, String color, Integer age){
        this.name = name;
        this.color = color;
        this.age = age;
        checkAge();
    }

    public void checkAge(){
        if (age > 0 && age <= 1){
            System.debug('Puppy');
        }else if(age > 1 && age <= 3){
            System.debug('Young Dog');
        }else if(age > 3 && age <= 5){
            System.debug('Adult Dog');
        }else{
            System.debug('Old Dog');
        }
    }
}