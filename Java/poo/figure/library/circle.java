package library;

public class circle extends figureGeometric {
    private double radius;

    public circle(double radius){
        super("Circulo");
        this.radius = radius;
    }

    public double getRadius() {
        return this.radius;
    }
    @Override
    public double calculateArea(){
        return Math.PI * radius * radius;
    }
}
