package poo.newtonLaws.library;

public class firstLaw extends newtonLaw {

    @Override
    public void explain() {
        System.out.println("Primera Ley de Newton: Un objeto permanece en reposo o en movimiento constante si la fuerza neta es cero.");
    }

    public void calculate(double force) {
        if (force == 0) {
            System.out.println("Fuerza = 0 El objeto esta en reposo o movimiento uniforme.");
        } else {
            System.out.println("Fuerza > 0 El objeto esta en estado de aceleración o desaceleración.");
        }
    }
}
