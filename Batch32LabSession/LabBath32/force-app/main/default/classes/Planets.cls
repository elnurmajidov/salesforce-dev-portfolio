public  class Planets {
    public String name; 

    private Integer planetNumber;
    private Integer numberOfMoons;

    public Planets(){
        this.name= 'Unknown';
        
    }

    public Planets( String name, Integer planetNumber, integer numberOfMoons){
        this.name= name;
        this.planetNumber =planetNumber;
        this.NumberOfMoons = numberOfMoons;


    }

    public Planets(String name){
        this.name = name;
        


    }

    public void details(){
        System.debug('Planet Name: ' + name);
        System.debug('Planet Position: ' + planetNumber);
        System.debug(' Number of Moons: ' + numberOfMoons);

    }
     



   
}