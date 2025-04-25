import library.circle;
import library.figureGeometric;
import library.rectangle;
import library.square;
import library.triangle;

public class main{

    public static void main (String[] args) {

            figureGeometric circle = new circle(5);
            figureGeometric triangle= new triangle(10, 12);
            figureGeometric rectangle= new rectangle(7, 2);
            figureGeometric square= new square(8);

        System.out.println("Area Circulo:" + circle.calculateArea());
        System.out.println("Area Triangulo:" + triangle.calculateArea());
        System.out.println("Area Rectangulo:" + rectangle.calculateArea());
        System.out.println("Area Cuadrado:" + square.calculateArea());
        }
}
