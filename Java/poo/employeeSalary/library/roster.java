package poo.employeeSalary.library;

public class roster {
    private static final double MIN_WAGE = 1300000;

    public double calculateSubsidy(double salary) {
        return salary < (2 * MIN_WAGE) ? MIN_WAGE : 0;
    }
    public double calculateTotalSalary(employee employee) {
        double salary = employee.getSalary();
        double subsidy = this.calculateSubsidy(salary);
        double netSalary = employee.calculateTotalSalary();
        return subsidy + netSalary;
    }
}


