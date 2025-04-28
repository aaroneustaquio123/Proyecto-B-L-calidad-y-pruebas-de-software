package Users;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "svAdministrador", urlPatterns = {"/svAdministrador"})
public class svAdministrador extends HttpServlet {

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
     try {
        Class.forName("com.mysql.cj.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    // Obtener los datos del formulario de inicio de sesión
    String usuario = request.getParameter("username");
    String contrasena = request.getParameter("password");

    // Datos de conexión a la base de datos
    String dbURL = "jdbc:mysql://localhost:3306/bdBarberia";
    String dbUser = "root";  // Verifica que sea tu usuario
    String dbPassword = "123456789";  // Verifica que sea tu contraseña

    try {
        // Conectar a la base de datos
        Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
        
        // Consulta para verificar las credenciales
        String sql = "SELECT * FROM Administrador WHERE usuario = ? AND contrasena = ?";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, usuario);
        statement.setString(2, contrasena);
        
        ResultSet resultSet = statement.executeQuery();
        
        if (resultSet.next()) {
            // Credenciales válidas
            System.out.println("Inicio de sesión exitoso para el usuario: " + usuario);
            
            // Inicia la sesión y redirige a la página en el servidor
            HttpSession session = request.getSession();
            session.setAttribute("username", usuario);
            response.sendRedirect(request.getContextPath() + "/Administrador/pages/citas.jsp");

        } else {
            // Credenciales inválidas
            System.out.println("Credenciales inválidas para el usuario: " + usuario);
            response.sendRedirect(request.getContextPath() + "/Administrador/login_administrador.jsp?error=invalid");
        }
        
        // Cerrar la conexión a la base de datos
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    System.out.println("Error específico: " + e.getMessage());  // AÑADE ESTA LÍNEA
    response.sendRedirect(request.getContextPath() + "/Administrador/login_administrador.jsp?error=error");
    }
}


    // Método doGet agregado para manejar solicitudes GET de manera controlada
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().write("Este servlet no soporta GET para el inicio de sesión. Usa POST.");
    }

    @Override
    public String getServletInfo() {
        return "Servlet para manejar el inicio de sesión de administradores";
    }
}
