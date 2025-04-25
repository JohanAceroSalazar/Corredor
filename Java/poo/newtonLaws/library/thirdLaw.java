package poo.newtonLaws.library;

public class thirdLaw extends newtonLaw {

    @Override
    public void explain() {
        System.out.println("Tercera Ley de Newton: Cuando un objeto ejerza una fuerza en otro objeto, el segundo objeto ejerce una fuerza igual frente la fuerza del primer objeto.");
    }

    public void calculate(double actionForce) {
        System.out.println("Fuerza de Acción: " + actionForce + "N");
        System.out.println("Fuerza de Reacción: " + (-actionForce) + "N (reacción opuesta)");
    }
}