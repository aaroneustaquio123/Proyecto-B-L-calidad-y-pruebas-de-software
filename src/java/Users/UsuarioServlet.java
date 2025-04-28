package Users;


import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



@WebServlet(name = "UsuarioServlet", urlPatterns = {"/UsuarioServlet"})

public class UsuarioServlet extends HttpServlet {

    // Método que maneja la solicitud HTTP POST
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtenemos el tipo de acción desde el formulario (creación, actualización, eliminación)
        String accion = request.getParameter("accion"); // "crear", "actualizar", "eliminar"
        
        UsuarioDAO usuarioDAO = new UsuarioDAO(); // Instancia del DAO

        // Determinar qué acción realizar con base en el parámetro "accion"
        if (accion != null) {
            if (accion.equals("crear")) {
                // Datos del formulario para crear un usuario
                String nombre = request.getParameter("nombres");
                String apellido = request.getParameter("apellidos");
                String email = request.getParameter("correo");
                String numero = request.getParameter("numero");
                String contraseña = request.getParameter("contraseña");
                String genero = request.getParameter("genero");

                // Crear un nuevo objeto Usuario y llenarlo con los datos
                Usuario nuevoUsuario = new Usuario();
                nuevoUsuario.setNombre(nombre);
                nuevoUsuario.setApellido(apellido);
                nuevoUsuario.setEmail(email);
                nuevoUsuario.setNumero(numero);
                nuevoUsuario.setContraseña(contraseña);  // Asegúrate de hashificar la contraseña
                nuevoUsuario.setGenero(genero);

                // Llamar al método de crear usuario
                usuarioDAO.create(nuevoUsuario);

                // Redirigir a una página de éxito
                response.sendRedirect("../../../Proyecto-Barberia-BYL/Usuario/pages/usuarios.jsp");

            } else if (accion.equals("actualizar")) {
                // Datos del formulario para actualizar un usuario
                int id = Integer.parseInt(request.getParameter("id"));
                String nombre = request.getParameter("nombres");
                String apellido = request.getParameter("apellidos");
                String email = request.getParameter("correo");
                String numero = request.getParameter("numero");
                String contraseña = request.getParameter("contraseña");
                String genero = request.getParameter("genero");

                // Crear un objeto Usuario y llenarlo con los datos
                Usuario usuarioActualizar = new Usuario();
                usuarioActualizar.setId(id);
                usuarioActualizar.setNombre(nombre);
                usuarioActualizar.setApellido(apellido);
                usuarioActualizar.setEmail(email);
                usuarioActualizar.setNumero(numero);
                usuarioActualizar.setContraseña(contraseña);  // Asegúrate de hashificar la contraseña
                usuarioActualizar.setGenero(genero);

                // Llamar al método de actualizar usuario
                usuarioDAO.update(usuarioActualizar);

                // Redirigir a una página de éxito
                response.sendRedirect("../../../Proyecto-Barberia-BYL/Usuario/pages/usuarios.jsp");

            } else if (accion.equals("eliminar")) {
                // Obtener el ID del usuario a eliminar
                int id = Integer.parseInt(request.getParameter("id"));

                // Llamar al método de eliminar usuario
                usuarioDAO.delete(id);

                // Redirigir a una página de éxito
                response.sendRedirect("../../../Proyecto-Barberia-BYL/Usuario/pages/usuarios.jsp");

            } else {
                // Si no se encuentra una acción válida
                response.sendRedirect("error.jsp");
            }
        } else {
            response.sendRedirect("error.jsp"); // En caso de no recibir acción
        }
    }
}