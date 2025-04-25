package poo.drivingRecord.library;

public class student{

    private String names;
    private String lastNames;
    private String identification;
    private String address;
    private String telephone;
    private String rh;
    


    public student(String names, String lastNames, String identification, String address, String telephone, String rh){
            this.names = names;
            this.lastNames = lastNames;
            this.identification = identification;
            this.address = address;
            this.telephone = telephone;
            this.rh = rh;
    }

    public String getNames() {
        return this.names;
    }
    public String getLastNames() {
        return this.lastNames;
    }
    public String getIdentification() {
        return this.identification;
    }
    public String getAddress() {
        return this.address;
    }   
    public String getTelephone() {
        return this.telephone;
    }
    public String getRh() {
        return this.rh;
    }
}