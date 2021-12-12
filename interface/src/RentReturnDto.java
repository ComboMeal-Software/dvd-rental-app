package ml.thomasmiles.dvdrentalapp;

public class RentReturnDto {

    private Long rentId;

    public RentReturnDto() {
    }

    public RentReturnDto(Long rentId) {
        this.rentId = rentId;
    }

    public Long getRentId() {
        return rentId;
    }

    public void setRentId(Long rentId) {
        this.rentId = rentId;
    }
}