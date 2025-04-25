package poo.gymRegistration.library;

    public class premiumPlan extends user{
        private final double cost = 110000.0; 

    public premiumPlan(String names, String lastnames, int identification, double weight, double height) {
        super(names, lastnames, identification, weight, height);
    }

    public void getShowServices(){
        System.out.println("Plan Basico - Servicios:");
        System.out.println( "Acceso General al Gym ");
        System.out.println("Clases Guiadas (yoga, spinning, etc.) ");
        System.out.println("Entrenador Personal" );
        System.out.println("Accesso al Spa y otras Areas");
    }

    public double getCost(){
        return this.cost;
    }
}