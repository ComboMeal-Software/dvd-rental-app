<%@ page import="jakarta.servlet.annotation.WebServlet,jakarta.servlet.http.HttpServlet,jakarta.servlet.http.HttpServletRequest,
jakarta.servlet.http.HttpServletResponse,java.io.IOException,java.io.PrintWriter,java.sql.*,com.fasterxml.jackson.databind.ObjectMapper" %>

<%

    static class DvdDto {

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

    ObjectMapper mapper = new ObjectMapper();
    DvdDto dvdDto = mapper.readValue(request.getInputStream(), DvdDto.class);
    PrintWriter writer = response.getWriter();
    response.setContentType("application/json");

    writer.println(dvdDto.getTitle());
    writer.println(dvdDto.getProductionYear());
    writer.println(dvdDto.getTypeId());
%>
