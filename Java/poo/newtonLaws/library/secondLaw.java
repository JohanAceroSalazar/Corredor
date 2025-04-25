package poo.newtonLaws.library;

public class secondLaw extends newtonLaw {

    @Override
    public void explain() {
        System.out.println("Segunda Ley de Newton: Establece que si una fuerza es aplicada en un objeto, la aceleracion del objeto cambiará cuando se le aplica una fuerza para moverlo, esto dependiendo de la masa del objeto.");
    }

    public void calculate(double mass, double acceleration) {
        double force = mass * acceleration;
        System.out.println("Fuerza Resultante: " + force + "N");
    }
}