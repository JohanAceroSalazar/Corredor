package library;

public class rectangle extends figureGeometric {
    private double base;
    private double height;

    public rectangle(double base, double height) {
        super("Rectángulo");
        this.base = base;
        this.height = height;
    }

    public double getBase() {
        return this.base;
    }

    public double getHeight() {
        return this.height;
    }

    @Override
    public double calculateArea() {
        return this.base * this.height;
    }
}
