package ml.thomasmiles.dvdrentalapp;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "ClientCreateServlet", value = "/client/create")
public class ClientCreateServlet extends HttpServlet {
    private static final String USERNAME = "root";
    private static final String PASSWORD = "root";

    private static void queryMessages(Connection connection, String firstName, String lastName, String telNumber,
                                      String birthDate)
            throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement("CALL client_create(?, ?, ?, ?);");
        preparedStatement.setString(1, firstName);
        preparedStatement.setString(2, lastName);
        preparedStatement.setString(3, telNumber);
        preparedStatement.setString(4, birthDate);

        preparedStatement.executeQuery();
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        ClientDto clientDto = mapper.readValue(request.getInputStream(), ClientDto.class);

        String dbUrl = "jdbc:mysql://localhost/dvd_rental_app?useSSL=false";

        try (Connection connection = DriverManager.getConnection(dbUrl, USERNAME, PASSWORD)) {
            queryMessages(connection, clientDto.getFirstName(), clientDto.getLastName(), clientDto.getTelNumber(),
                    clientDto.getBirthDate());
        } catch (SQLException e) {
            response.sendError(500);
        }
    }
}