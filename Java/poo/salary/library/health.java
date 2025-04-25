package poo.salary.library;

public class health {
    private double valueHealth;

    public health(double valueHealth) {
        this.valueHealth = valueHealth;
    }

    public double getValueHealth() {
        return this.valueHealth;
    }

    public double calculateDiscount() {
        return (this.getValueHealth() * 0.04);
    }
}