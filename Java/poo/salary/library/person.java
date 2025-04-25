package poo.salary.library;

public class person  {

    private String name;
    private String lastName;
    private int identification;
    private double dayValue;
    private int daysWorked;

    public person(String name, String lastName, int identification, double dayValue, int daysWorked) {
        this.name = name;
        this.lastName = lastName;
        this.identification = identification;
        this.dayValue = dayValue;
        this.daysWorked = daysWorked;
    }

    public String getName() {
        return this.name;
    }

    public String getLastName() {
        return this.lastName;
    }

    public int getIdentification() {
        return this.identification;
    }

    public double getDayValue() {
        return this.dayValue;
    }

    public int getDaysWorked() {
        return this.daysWorked;
    }

    public double calculateSalary() {
        return this.dayValue * this.daysWorked;
    }
}