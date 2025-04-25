package poo.gymRegistration.library;

public class user{

    private String names;
    private String lastNames;
    private int identification;
    private double weight;
    private double height;
    
    public  user(String names, String lastNames, int identification, double weight, double height){
            this.names = names;
            this.lastNames = lastNames;
            this.identification = identification;
            this.weight = weight;
            this.height = height;
    }

    public String getNames(){
        return this.names;
    }
    public String getLastNames(){
        return this.lastNames;
    }
    public int getIdentification(){
        return this.identification;
    }
    public double getWeight(){
        return this.weight;
    }   
    public double getHeight(){
        return this.height;
    }
}