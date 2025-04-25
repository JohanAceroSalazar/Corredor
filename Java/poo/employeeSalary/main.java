package poo.employeeSalary;

import poo.employeeSalary.library.employee;
import poo.employeeSalary.library.roster;


public class main {
    public static void main(String[] args) {
        double salary = 1300000;
        int riskLevel = 2;
        int extraHoursDay = 6;
        int extraNightHours = 2;
        int extraHolidayHours = 5;

        employee employee = new employee(salary, riskLevel, extraHoursDay, extraNightHours, extraHolidayHours);
        roster roster = new roster();

        double extras = employee.calculateExtraPayments();
        double deductions = employee.calculateDeductions();
        double netSalary = employee.calculateTotalSalary();
        double subsidy = roster.calculateSubsidy(salary);
        double totalWithSubsidy = roster.calculateTotalSalary(employee);

        System.out.println("Pago total del empleado:");
        System.out.printf("Salario base: $%,.2f%n", salary);
        System.out.printf("Horas extra: $%,.2f%n", extras);
        System.out.printf("Deducciones (Salud + Pensión + ARL): $%,.2f%n", deductions);
        System.out.printf("Salario neto: $%,.2f%n", netSalary);
        System.out.printf("Subsidio de transporte: $%,.2f%n", subsidy);
        System.out.printf("Pago total (neto + subsidio): $%,.2f%n", totalWithSubsidy);
    }
}