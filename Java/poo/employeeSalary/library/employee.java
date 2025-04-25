package poo.employeeSalary.library;

public class employee {
    private double salary;
    private int extraHoursDay;
    private int extraNightHours;
    private int extraHolidayHours;
    private int riskLevel;

    public employee(double salary, int riskLevel, int extraHoursDay, int extraNightHours, int extraHolidayHours) {
        this.salary = salary;
        this.riskLevel = riskLevel;
        this.extraHoursDay = extraHoursDay;
        this.extraNightHours = extraNightHours;
        this.extraHolidayHours = extraHolidayHours;
    }

    public double getSalary() {
        return this.salary;
    }

    public double calculateTotalSalary() {
        return this.salary + this.calculateExtraPayments() - this.calculateDeductions();
    }

    public double calculateExtraPayments() {
        double hourlyPay = this.salary / 240;
        return this.extraHoursDay * hourlyPay * 1.25 +
               this.extraNightHours * hourlyPay * 1.75 +
               this.extraHolidayHours * hourlyPay * 2.00;
    }

    public double calculateDeductions() {
        double health = this.salary * 0.04;
        double pension = this.salary * 0.04;
        double arl = this.calculateArl();
        return health + pension + arl;
    }

    public double calculateArl() {
        switch (this.riskLevel) {
            case 1: return this.salary * 0.005;
            case 2: return this.salary * 0.01;
            case 3: return this.salary * 0.02;
            default: return 0;
        }
    }
}

    