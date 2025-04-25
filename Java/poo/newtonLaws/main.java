package poo.newtonLaws;

    import poo.newtonLaws.library.firstLaw;
    import poo.newtonLaws.library.secondLaw;
    import poo.newtonLaws.library.thirdLaw;

    class main {
        public static void main(String[] args){
            int opcion = 3; 

        switch (opcion) {
            case 1:
                firstLaw first = new firstLaw();
                first.explain();
                first.calculate(0);
                break;

            case 2:
                secondLaw second = new secondLaw();
                second.explain();
                second.calculate(8, 3);
                break;

            case 3:
                thirdLaw third = new thirdLaw();
                third.explain();
                third.calculate(15); // fuerza de acción = 15 N
                break;

            default:
                System.out.println("Opción inválida.");
        }
    }
}