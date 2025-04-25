package library;

public class triangle extends figureGeometric {
    private double base;
    private double height;

    public triangle(double base, double height) {
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
        return (this.getBase() * this.getHeight())/2;
    }
}