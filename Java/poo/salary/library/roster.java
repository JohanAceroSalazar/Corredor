package poo.salary.library;

public class roster {

    public static final double SALARY_MINIMUM = 1300000;
    public static final double SUBSIDY_TRANSPORTATION = 140650;

    private double salary;
    private double totalDiscount;
    private double subsidy = 0.0;
    private double totalPay = 0.0;

    public roster(double salary, double totalDiscount) {
        this.salary = salary;
        this.totalDiscount = totalDiscount;
    }

    public double calculatePay() {
        subsidy = (salary < 2 * SALARY_MINIMUM) ? SUBSIDY_TRANSPORTATION : 0;
        totalPay = (salary + subsidy) - totalDiscount;
        return this.totalPay;
    }

    public double getSubsidy() {
        return this.subsidy;
    }

    public double getTotalPay() {
        return (this.getTotalPay());
    }
}

