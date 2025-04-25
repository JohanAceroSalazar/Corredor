package poo.gymRegistration.library;

    public class basicPlan extends user{
        private final double cost = 60000.0; 

    public basicPlan(String names, String lastnames, int identification, double weight, double height) {
        super(names, lastnames, identification, weight, height);
    }

    public void getShowServices(){
        System.out.println("Plan Basico - Servicios:");
        System.out.println( "Acceso General al Gym ");
    }

    public double getCost(){
        return this.cost;
    }
}
