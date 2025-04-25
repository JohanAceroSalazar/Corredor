package poo.salary.library;

public class discount {

    private double health;
    private double pension;
    private double arl;
    private double total;

    public discount(double health, double pension, double arl) {
        this.health = health;
        this.pension = pension;
        this.arl = arl;
        this.total = 0;
    }

    public double calculateTotal() {
        total = health + pension + arl;
        return this.total;
    }

    public double getHealth() {
        return this.health;
    }

    public double getPension() {
        return this.pension;
    }

    public double getArl() {
        return this.arl;
    }

    public double getTotal() {
        return (this.getTotal());
    }
}