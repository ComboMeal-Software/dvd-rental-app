package ml.thomasmiles.dvdrentalapp;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "ClientFindServlet", value = "/сlient/find")
public class ClientFindServlet extends HttpServlet {
    private static final String USERNAME = "root";
    private static final String PASSWORD = "root";

    private static ResultSet queryMessages(Connection connection, String telNumber) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement("CALL client_find(?);");
        preparedStatement.setString(1, telNumber);
        return preparedStatement.executeQuery();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String telNumber = request.getParameter("telNumber");
        PrintWriter writer = response.getWriter();
        response.setContentType("application/json");

        try {
            String dbUrl = "jdbc:mysql://localhost/dvd_rental_app?useSSL=false";

            try (Connection connection = DriverManager.getConnection(dbUrl, USERNAME, PASSWORD)) {
                ResultSet resultSet = queryMessages(connection, telNumber);

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
    }
}