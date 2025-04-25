package poo.salary.library;

public class pension {

    private double valuePension;

    public pension(double valuePension) {
        this.valuePension = valuePension;
    }

    public double getValuePension() {
        return this.valuePension;
    }

    public double calculateDiscount() {
        return (this.getValuePension() * 0.04);
    }
}