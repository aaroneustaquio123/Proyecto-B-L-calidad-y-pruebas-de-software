import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class TestConnection {
    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/bdBarberia";
        String user = "root";
        String password = "123456789";

        try (Connection conn = DriverManager.getConnection(url, user, password)) {
            System.out.println("Conexión exitosa");
        } catch (SQLException e) {
            System.out.println("Error al conectar: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
