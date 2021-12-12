    <%@ page import="jakarta.servlet.annotation.WebServlet,jakarta.servlet.http.HttpServlet,jakarta.servlet.http.HttpServletRequest,
jakarta.servlet.http.HttpServletResponse,java.io.PrintWriter,java.sql.*" %>

            <%
    String telNumber = request.getParameter("telNumber");
    PrintWriter writer = response.getWriter();
    response.setContentType("application/json");

    try {
        String dbUrl = "jdbc:mysql://localhost/dvd_rental_app?useSSL=false";

        try (Connection connection = DriverManager.getConnection(dbUrl, "root", "root")) {
            PreparedStatement preparedStatement = connection.prepareStatement("CALL client_find(?);");
            preparedStatement.setString(1, telNumber);
            ResultSet resultSet = preparedStatement.executeQuery();

            writer.print(String.format("{\n \"result\": "));
            if (resultSet.next()) {
                String firstName = resultSet.getString(2);
                String lastName = resultSet.getString(3);
                String registrationDate = resultSet.getString(4);
                String telNumberRes = resultSet.getString(5);
                String birthDate = resultSet.getString(6);

                writer.println(String.format("\"OK\",\n \"data\": {\n       \"firstName\": \"%s\"," +
                                "\n       \"lastName\": \"%s\",\n       \"registrationDate\": \"%s\"," +
                                "\n       \"telNumber\": \"%s\",\n       \"birthDate\": \"%s\"\n    }\n}",
                        firstName, lastName, registrationDate, telNumberRes, birthDate));
            } else {
                writer.println(String.format("\"ERROR\",\n \"data\": null\n}"));
            }

        }
    } catch (Exception ex) {
        writer.println(ex);
    } finally {
        writer.close();
    }
%>
