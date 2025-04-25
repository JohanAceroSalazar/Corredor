package library;

    public class square extends figureGeometric{
        private double side;
        

    public square(double side){
        super("Cuadrado");
        this.side = side;
    }

    public double getSide(){
        return this.side;

    }

        @Override
        public double calculateArea() {
            return this.side * this.side;
            
        }
    }