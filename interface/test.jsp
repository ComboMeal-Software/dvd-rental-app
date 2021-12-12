<%@ page import="jakarta.servlet.annotation.WebServlet,jakarta.servlet.http.HttpServlet,jakarta.servlet.http.HttpServletRequest,
jakarta.servlet.http.HttpServletResponse,java.io.IOException,java.io.PrintWriter,java.sql.*,com.fasterxml.jackson.databind.ObjectMapper" %>

<%
    PrintWriter writer = response.getWriter();
    response.setContentType("application/json");

    try {
        String dbUrl = "jdbc:mysql://localhost/dvd_rental_app?useSSL=false";

        try (Connection connection = DriverManager.getConnection(dbUrl, "root", "root")) {
            PreparedStatement preparedStatement = connection.prepareStatement("CALL dvd_types();");
            ResultSet resultSet = preparedStatement.executeQuery();

            writer.println("[");
            boolean isFirst = true;

            while (resultSet.next()) {
                if (!isFirst) {
                    writer.println(",");
                }
                Long id = resultSet.getLong(1);
                String type = resultSet.getString(2);

                writer.print(String.format("  {\n     \"id\": %d,\n       \"type\": \"%s\"\n  }",
                        id, type));
                if (isFirst) isFirst = false;
            }

            writer.println();
            writer.println("]");
        }
    } catch (Exception ex) {
        writer.println(ex);
    } finally {
        writer.close();
    }
%>
