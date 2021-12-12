package ml.thomasmiles.dvdrentalapp;

public class RentAddDto {

    private Long rentId;

    public RentAddDto() {
    }

    public RentAddDto(Long rentId) {
        this.rentId = rentId;
    }

    public Long getRentId() {
        return rentId;
    }

    public void setRentId(Long rentId) {
        this.rentId = rentId;
    }
}