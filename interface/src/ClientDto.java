package ml.thomasmiles.dvdrentalapp;

public class ClientDto {

    private String firstName;

    private String lastName;

    private String telNumber;

    private String birthDate;

    public ClientDto() {
    }

    public ClientDto(String firstName, String lastName, String registrationDate, String telNumber, String birthDate) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.registrationDate = registrationDate;
        this.telNumber = telNumber;
        this.birthDate = birthDate;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getTelNumber() {
        return telNumber;
    }

    public void setTelNumber(String telNumber) {
        this.telNumber = telNumber;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }
}