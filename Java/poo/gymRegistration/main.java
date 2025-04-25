package poo.gymRegistration;

import poo.gymRegistration.library.basicPlan;
import poo.gymRegistration.library.mediumPlan;
import poo.gymRegistration.library.premiumPlan;

public class main {
    public static void main(String[] args) {
        basicPlan basicPlan = new basicPlan("Johan", "Gomez Valenzuela", 1138475478, 60.5, 1.60);
        mediumPlan mediumPlan = new mediumPlan("Juan Carlos", "Pérez Guilombo", 36314785, 80.2, 1.80);
        premiumPlan premiumPlan = new premiumPlan("Valentina", "Pedraza Saenz", 55489736, 57.0, 1.72);

        System.out.println(" Basic Plan ");
        System.out.println("Nombre Completo: " + basicPlan.getNames() + " " + basicPlan.getLastNames());
        System.out.println("Identificación: " + basicPlan.getIdentification());
        System.out.println("Peso: " + basicPlan.getWeight() + " kg");
        System.out.println("Altura: " + basicPlan.getHeight() + " m");
        basicPlan.getShowServices();
        System.out.printf("Total Costo: $%,.0f COP\n", basicPlan.getCost());
        System.out.println("-----------------------------");

        System.out.println(" Medium Plan ");
        System.out.println("Nombre Completo: " + mediumPlan.getNames() + " " + mediumPlan.getLastNames());
        System.out.println("Identificación: " + mediumPlan.getIdentification());
        System.out.println("Peso: " + mediumPlan.getWeight() + " kg");
        System.out.println("Altura: " + mediumPlan.getHeight() + " m");
        mediumPlan.getShowServices();
        System.out.printf("Total Costo: $%,.0f COP\n", mediumPlan.getCost());
        System.out.println("-----------------------------");

        System.out.println(" Premium Plan ");
        System.out.println("Nombre Completo: " + premiumPlan.getNames() + " " + premiumPlan.getLastNames());
        System.out.println("Identificación: " + premiumPlan.getIdentification());
        System.out.println("Peso: " + premiumPlan.getWeight() + " kg");
        System.out.println("Altura: " + premiumPlan.getHeight() + " m");
        premiumPlan.getShowServices();
        System.out.printf("Total Costo: $%,.0f COP\n", premiumPlan.getCost());
    }
}