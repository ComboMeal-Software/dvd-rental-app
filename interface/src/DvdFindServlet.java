package ml.thomasmiles.block02;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "DvdFindServlet", value = "/dvd/find")
public class DvdFindServlet extends HttpServlet {
    private static final String USERNAME = "root";
    private static final String PASSWORD = "root";

    private static ResultSet queryMessages(Connection connection, String name) throws SQLException {
        PreparedStatement preparedStatement = connection.prepareStatement("CALL dvd_find(?);");
        preparedStatement.setString(1, name);
        return preparedStatement.executeQuery();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        PrintWriter writer = response.getWriter();
        response.setContentType("application/json");

        try {
            String dbUrl = "jdbc:mysql://localhost/dvd_rental_app?useSSL=false";

            try (Connection connection = DriverManager.getConnection(dbUrl, USERNAME, PASSWORD)) {
                ResultSet resultSet = queryMessages(connection, name);

                writer.println("[");
                boolean isFirst = true;

                while (resultSet.next()) {
                    if (!isFirst) {
                        writer.println(",");
                    }
                    Long id = resultSet.getLong(1);
                    String title = resultSet.getString(2);
                    Long productionYear = resultSet.getLong(3);
                    Long typeId = resultSet.getLong(4);

                    writer.println(String.format("{\n  \"id\": %d,\n \"title\": \"%s\",\n \"productionYear\": %d,\n \"typeId\": %d\n}",
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
    }
}