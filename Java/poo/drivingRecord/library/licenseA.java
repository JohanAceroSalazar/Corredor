package poo.drivingRecord.library;

    public class licenseA{
        private String typeLicense;
        private int cost;
        private int daysDuration;

        public licenseA(String typeLicense, int cost, int daysDuration){
            this.typeLicense = typeLicense;
            this.cost = cost;
            this.daysDuration = daysDuration;
        }
        public String getTypeLicense(){
            return this.typeLicense;
        }
        public int getCost(){
            return this.cost;
        }
        public int getDaysDuration(){
            return this.daysDuration;
        }
    }