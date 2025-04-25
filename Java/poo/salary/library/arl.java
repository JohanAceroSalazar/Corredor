package poo.salary.library;

public class arl {

    private double valueArl;

    public arl(double valueArl) {
        this.valueArl = valueArl;
    }

    public double getvalueArl() {
        return this.valueArl;
    }

    public double calculateDiscount() {
        return (this.getvalueArl() * 0.005);
    }
}