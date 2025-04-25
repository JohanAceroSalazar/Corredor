package poo.employeeSalary.library;

public abstract class worker{
    private double salary;
    private int riskLevel;

    public worker(double salary, int riskLevel){
        this.salary = salary;
        this.riskLevel = riskLevel;
    }
    public double getSalary(){
        return this.salary;
    } 
    public int getRiskLevel(){
        return this.riskLevel;
    }
    public abstract double calculateTotalSalary();
}