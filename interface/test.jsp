<%@ page import="jakarta.servlet.annotation.WebServlet,jakarta.servlet.http.HttpServlet,jakarta.servlet.http.HttpServletRequest,
jakarta.servlet.http.HttpServletResponse,java.io.IOException,java.io.PrintWriter,java.sql.*,com.fasterxml.jackson.databind.ObjectMapper" %>

<%
    String title = request.getParameter("title");
    Long productionYear = Long.parseLong(request.getParameter("productionYear"));
    Long typeId = Long.parseLong(request.getParameter("typeId"));
    PrintWriter writer = response.getWriter();
    response.setContentType("application/json");

    try {
        String dbUrl = "jdbc:mysql://localhost/dvd_rental_app?useSSL=false";

        try (Connection connection = DriverManager.getConnection(dbUrl, "root", "root")) {
            PreparedStatement preparedStatement = connection.prepareStatement("CALL dvd_create(?, ?, ?);");
            preparedStatement.setString(1, title);
            preparedStatement.setLong(2, productionYear);
            preparedStatement.setLong(3, typeId);

            preparedStatement.executeQuery();
        }
    } catch (Exception ex) {
        writer.println(ex);
    } finally {
        writer.close();
    }
%>
