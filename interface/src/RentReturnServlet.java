package ml.thomasmiles.dvdrentalapp;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "RentReturnServlet", value = "/rent/return")
public class RentReturnServlet extends HttpServlet {
    private static final String USERNAME = "root";
    private static final String PASSWORD = "root";

    private static void queryMessages(Connection connection, Long rentId)
            throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement("CALL rent_return(?);");
        preparedStatement.setLong(1, rentId);

        preparedStatement.executeQuery();
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        RentReturnDto rentReturnDto = mapper.readValue(request.getInputStream(), RentReturnDto.class);

        String dbUrl = "jdbc:mysql://localhost/dvd_rental_app?useSSL=false";

        try (Connection connection = DriverManager.getConnection(dbUrl, USERNAME, PASSWORD)) {
            queryMessages(connection, rentReturnDto.getRentId());
        } catch (SQLException e) {
            response.sendError(500);
        }
    }
}