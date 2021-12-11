<%@ page import="jakarta.servlet.annotation.WebServlet,jakarta.servlet.http.HttpServlet,jakarta.servlet.http.HttpServletRequest,
jakarta.servlet.http.HttpServletResponse,java.io.IOException,java.io.PrintWriter,java.sql.*" %>

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
                String productionYear = resultSet.getString(3);
                Long typeId = resultSet.getLong(4);

                writer.println(String.format("{\n  \"id\": %d,\n \"title\": \"%s\",\n \"productionYear\": \"%s\",\n \"typeId\": %d\n}",
                        id, title, productionYear, typeId));
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
