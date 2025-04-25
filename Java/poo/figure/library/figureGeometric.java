package library;

    public abstract class figureGeometric{
        private String name;

        public figureGeometric(String name){
            this.name = name;
    }

    public String getName(){
        return this.name;
    }

    public abstract double calculateArea();

}