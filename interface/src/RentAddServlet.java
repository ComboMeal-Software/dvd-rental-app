package ml.thomasmiles.dvdrentalapp;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "RentAddServlet", value = "/rent/add")
public class RentAddServlet extends HttpServlet {
    private static final String USERNAME = "root";
    private static final String PASSWORD = "root";

    private static void queryMessages(Connection connection, Long dvdId, String clientTelNumber)
            throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement("CALL rent_add(?, ?);");
        preparedStatement.setLong(1, dvdId);
        preparedStatement.setString(2, clientTelNumber);

        preparedStatement.executeQuery();
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        RentAddDto rentAddDto = mapper.readValue(request.getInputStream(), RentAddDto.class);

        String dbUrl = "jdbc:mysql://localhost/dvd_rental_app?useSSL=false";

        try (Connection connection = DriverManager.getConnection(dbUrl, USERNAME, PASSWORD)) {
            queryMessages(connection, rentAddDto.getDvdId(), rentAddDto.getClientTelNumber());
        } catch (SQLException e) {
            response.sendError(500);
        }
    }
}