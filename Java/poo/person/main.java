public class main {

    public static void main(String[] args) {
        apprentices apprentices = new apprentices();
        teacher teacher = new teacher();

        teacher.setTeacher("Andres Moreno");
        teacher.setTitle("Ing. System");
        apprentices.setNames("Johan Alexander");
        apprentices.setLastNames("Acero Salazar");
        apprentices.setIdentification(1138274651);
        apprentices.setBirthDay("25-09-2007");
        apprentices.setTelephoneContact(320922026);

        System.out.println("Teacher: " + teacher.getTeacher());
        System.out.println("Title: " + teacher.getTitle());
        System.out.println("Student: " + apprentices.getNames());
        System.out.println("Last Name: " + apprentices.getLastNames());
        System.out.println("Identification: " + apprentices.getIdentification());
        System.out.println("BirthDay: " + apprentices.getBirthDay());
        System.out.println("Telephone: " + apprentices.getTelephoneContact());
    }
}

