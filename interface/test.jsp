<%@ page import="jakarta.servlet.annotation.WebServlet,jakarta.servlet.http.HttpServlet,jakarta.servlet.http.HttpServletRequest,
jakarta.servlet.http.HttpServletResponse,java.io.IOException,java.io.PrintWriter,java.sql.*,com.fasterxml.jackson.databind.ObjectMapper" %>

<%
    String name = request.getParameter("name");
    PrintWriter writer = response.getWriter();
    response.setContentType("application/json");

    try {
        String dbUrl = "jdbc:mysql://localhost/dvd_rental_app?useSSL=false";

        try (Connection connection = DriverManager.getConnection(dbUrl, "root", "root")) {
            PreparedStatement preparedStatement = connection.prepareStatement("CALL dvd_find(?);");
            preparedStatement.setString(1, name);
            ResultSet resultSet = preparedStatement.executeQuery();

            writer.println("[");
            boolean isFirst = true;

            while (resultSet.next()) {
                if (!isFirst) {
                    writer.println(",");
                }
                Long id = resultSet.getLong(1);
                String title = resultSet.getString(2);
                Long productionYear = resultSet.getLong(3);
                String type = resultSet.getString(4);
                String telNumber = resultSet.getString(5);
                String firstName = resultSet.getString(6);
                String lastName = resultSet.getString(7);
                String offerDt = resultSet.getString(8);
                Long rentId = resultSet.getLong(9);

                writer.println(String.format("{\n  \"id\": %d,\n" +
                                " \"title\": \"%s\",\n" +
                                " \"productionYear\": %d,\n" +
                                " \"type\": \"%s\",\n" +
                                " \"telNumber\": \"%s\",\n" +
                                " \"firstName\": \"%s\",\n" +
                                " \"lastName\": \"%s\",\n" +
                                " \"offerDt\": \"%s\",\n" +
                                " \"rentId\": %d\n" +
                                "}",
                        id, title, productionYear, type, telNumber, firstName, lastName, offerDt, rentId));
                if (isFirst) isFirst = false;
            }

            writer.println("]");
        }
    } catch (Exception ex) {
        writer.println(ex);
    } finally {
        writer.close();
    }
%>
