package poo.gymRegistration.library;

    public class mediumPlan extends user{
        private final double cost = 85000.0; 

    public mediumPlan(String names, String lastnames, int identification, double weight, double height) {
        super(names, lastnames, identification, weight, height);
    }

    public void getShowServices(){
        System.out.println("Plan Basico - Servicios:");
        System.out.println( "Acceso General al Gym ");
        System.out.println("Clases Guiadas (yoga, spinning, etc.) ");
    }

    public double getCost(){
        return this.cost;
    }
}
