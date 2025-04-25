package poo.drivingRecord;

import poo.drivingRecord.library.student;
import poo.drivingRecord.library.licenseA;
import poo.drivingRecord.library.licenseB;
import poo.drivingRecord.library.licenseC;

public class main {
    public static void main(String[] args) {
        student student = new student("Juan Sebastian", "Sanchez Gomez", "36461278", "Calle 10 #23-45", "3123245849", "O+");
        licenseA licenseA = new licenseA("Motocicleta", 750000, 25);

        System.out.println("Nombre Completo: " + student.getNames() + " " + student.getLastNames());
        System.out.println("Identificación: " + student.getIdentification());
        System.out.println("Dirección: " + student.getAddress());
        System.out.println("Teléfono: " + student.getTelephone());
        System.out.println("RH: " + student.getRh());
        System.out.println("Tipo de Licencia: " + licenseA.getTypeLicense());
        System.out.println("Costo del Curso: $" + String.format("%,d", licenseA.getCost()));
        System.out.println("Duración del Curso: " + licenseA.getDaysDuration() + " días");
        System.out.println("-----------------------------");

        student studentB = new student("Stiven", "Perdomo", "24578954", "Cra 35 n25", "3147815994", "O-");
        licenseB licenseB = new licenseB("Vehiculos Particulares", 900000, 35);

        System.out.println("Nombre Completo: " + studentB.getNames() + " " + studentB.getLastNames());
        System.out.println("Identificación: " + studentB.getIdentification());
        System.out.println("Dirección: " + studentB.getAddress());
        System.out.println("Teléfono: " + studentB.getTelephone());
        System.out.println("RH: " + studentB.getRh());
        System.out.println("Tipo de Licencia: " + licenseB.getTypeLicense());
        System.out.println("Costo del Curso: $" + String.format("%,d", licenseB.getCost()));
        System.out.println("Duración del Curso: " + licenseB.getDaysDuration() + " días");
        System.out.println("-----------------------------");

        student studentC = new student("Johana", "Gutierrez", "77845136", "Calle 25 n23", "1148726548", "A+");
        licenseC licenseC = new licenseC("Vehiculos de Servicio Publico", 950000, 45);

        System.out.println("Nombre Completo: " + studentC.getNames() + " " + studentC.getLastNames());
        System.out.println("Identificación: " + studentC.getIdentification());
        System.out.println("Dirección: " + studentC.getAddress());
        System.out.println("Teléfono: " + studentC.getTelephone());
        System.out.println("RH: " + studentC.getRh());
        System.out.println("Tipo de Licencia: " + licenseC.getTypeLicense());
        System.out.println("Costo del Curso: $" + String.format("%,d", licenseC.getCost()));
        System.out.println("Duración del Curso: " + licenseC.getDaysDuration() + " días");
    }
}