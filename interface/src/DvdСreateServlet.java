package ml.thomasmiles.dvdrentalapp;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "DvdCreateServlet", value = "/dvd/create")
public class DvdCreateServlet extends HttpServlet {
    private static final String USERNAME = "root";
    private static final String PASSWORD = "root";

    private static void queryMessages(Connection connection, String name, Long productionYear, Long typeId)
            throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement("CALL dvd_create(?, ?, ?);");
        preparedStatement.setString(1, name);
        preparedStatement.setLong(2, productionYear);
        preparedStatement.setLong(3, typeId);

        preparedStatement.executeQuery();
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        DvdDto dvdDto = mapper.readValue(request.getInputStream(), DvdDto.class);

        try {
            String dbUrl = "jdbc:mysql://localhost/dvd_rental_app?useSSL=false";

            try (Connection connection = DriverManager.getConnection(dbUrl, USERNAME, PASSWORD)) {
                queryMessages(connection, dvdDto.getName(), dvdDto.getProductionYear(), dvdDto.getTypeId());
            }
        } catch (Exception ex) {
            writer.println(ex);
        } finally {
            writer.close();
        }
    }
}