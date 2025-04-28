package Users;


import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Obtener los datos del formulario
        String email = request.getParameter("email");
        String contraseña = request.getParameter("contraseña");

        // Crear el objeto DAO para acceder a la base de datos
        UsuarioDAO usuarioDAO = new UsuarioDAO();

        // Verificar las credenciales del usuario
        Usuario usuario = usuarioDAO.login(email, contraseña);

        if (usuario != null) {
            // Si el usuario existe, redirigir a la página principal para el usuario
            request.getSession().setAttribute("usuario", usuario); // Guardar usuario en la sesión si es necesario
            response.sendRedirect("../../../Proyecto-Barberia-BYL/index_user.jsp");
        } else {
            // Si el usuario no existe, redirigir a una página de error (loginError.jsp)
            response.sendRedirect("../../../Proyecto-Barberia-BYL/Usuario/login_usuario.jsp");
        }
    }
}
