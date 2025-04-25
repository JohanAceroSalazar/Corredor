package poo.salary;

import poo.salary.library.person;

public class main {
    public static void main(String[] args) {
        person persona = new person("Laura", "Martínez", 36304597, 50000, 30);
        double salary = new person("Laura", "Martínez", 36304597, 50000, 30).calculateSalary();
        double health = salary * 0.04;
        double pension = salary * 0.04;
        double arl = salary * 0.005;
        double totalDiscounts = health + pension + arl;
        double subsidy = (salary < 2 * 1300000) ? 140650 : 0;
        double totalPay = (salary + subsidy) - totalDiscounts;
        

        System.out.println("Persona: " + persona.getName() + " " + persona.getLastName());
        System.out.println("Identificación: " + persona.getIdentification());
        System.out.println("Salario: $" + format(salary));
        System.out.println("Salud: $" + format(health));
        System.out.println("Pensión: $" + format(pension));
        System.out.println("ARL: $" + format(arl));
        System.out.println("Descuento total: $" + format(totalDiscounts));
        System.out.println("Subsidio de transporte: $" + format(subsidy));
        System.out.println("Total a pagar: $" + format(totalPay));
    }

    private static String format(double value) {
        return String.format("%,.0f", value);
    }
}
