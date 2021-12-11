package ml.thomasmiles.dvdrentalapp;

public class DvdDto {

    private String title;

    private Long productionYear;

    private Long typeId;

    public DvdDto(String title, Long productionYear, Long typeId) {
        this.title = title;
        this.productionYear = productionYear;
        this.typeId = typeId;
    }

    public DvdDto() {
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Long getProductionYear() {
        return productionYear;
    }

    public void setProductionYear(Long productionYear) {
        this.productionYear = productionYear;
    }

    public Long getTypeId() {
        return typeId;
    }

    public void setTypeId(Long typeId) {
        this.typeId = typeId;
    }
}