package ml.thomasmiles.dvdrentalapp;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "DvdTypesServlet", value = "/dvd/types")
public class DvdTypesServlet extends HttpServlet {
    private static final String USERNAME = "root";
    private static final String PASSWORD = "root";

    private static ResultSet queryMessages(Connection connection) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement("CALL dvd_types();");
        return preparedStatement.executeQuery();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter writer = response.getWriter();
        response.setContentType("application/json");

        try {
            String dbUrl = "jdbc:mysql://localhost/dvd_rental_app?useSSL=false";

            try (Connection connection = DriverManager.getConnection(dbUrl, USERNAME, PASSWORD)) {
                ResultSet resultSet = queryMessages(connection);

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
    }
}