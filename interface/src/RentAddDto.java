package ml.thomasmiles.dvdrentalapp;

public class RentAddDto {

    private Long dvdId;

    private String clientTelNumber;

    public RentAddDto() {
    }

    public RentAddDto(Long dvdId, String clientTelNumber) {
        this.dvdId = dvdId;
        this.clientTelNumber = clientTelNumber;
    }

    public Long getDvdId() {
        return dvdId;
    }

    public void setDvdId(Long dvdId) {
        this.dvdId = dvdId;
    }

    public String getClientTelNumber() {
        return clientTelNumber;
    }

    public void setClientTelNumber(String clientTelNumber) {
        this.clientTelNumber = clientTelNumber;
    }
}