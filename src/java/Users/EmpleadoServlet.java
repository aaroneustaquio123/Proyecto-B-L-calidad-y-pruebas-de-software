package Users;


import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "EmpleadoServlet", urlPatterns = {"/EmpleadoServlet"})
public class EmpleadoServlet extends HttpServlet {

    // Método que maneja la solicitud HTTP POST
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtenemos el tipo de acción desde el formulario (crear, actualizar, eliminar)
        String accion = request.getParameter("accion"); // "crear", "actualizar", "eliminar"
        
        EmpleadoDAO empleadoDAO = new EmpleadoDAO(); // Instancia del DAO

        // Determinar qué acción realizar con base en el parámetro "accion"
        if (accion != null) {
            if (accion.equals("crear")) {
                // Datos del formulario para crear un empleado
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String correo = request.getParameter("correo");
                String especialidad = request.getParameter("especialidad");
                String telefono = request.getParameter("telefono");

                // Crear un nuevo objeto Empleado y llenarlo con los datos
                Empleado nuevoEmpleado = new Empleado();
                nuevoEmpleado.setNombre(nombre);
                nuevoEmpleado.setApellido(apellido);
                nuevoEmpleado.setCorreo(correo);
                nuevoEmpleado.setEspecialidad(especialidad);
                nuevoEmpleado.setTelefono(telefono);

                // Llamar al método de crear empleado
                empleadoDAO.create(nuevoEmpleado);

                // Redirigir a una página de éxito
                response.sendRedirect("../../../Proyecto-Barberia-BYL/Administrador/pages/empleado.jsp");

            } else if (accion.equals("actualizar")) {
                // Datos del formulario para actualizar un empleado
                int id = Integer.parseInt(request.getParameter("id"));
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String correo = request.getParameter("correo");
                String especialidad = request.getParameter("especialidad");
                String telefono = request.getParameter("telefono");

                // Crear un objeto Empleado y llenarlo con los datos
                Empleado empleadoActualizar = new Empleado();
                empleadoActualizar.setId(id);
                empleadoActualizar.setNombre(nombre);
                empleadoActualizar.setApellido(apellido);
                empleadoActualizar.setCorreo(correo);
                empleadoActualizar.setEspecialidad(especialidad);
                empleadoActualizar.setTelefono(telefono);

                // Llamar al método de actualizar empleado
                empleadoDAO.update(empleadoActualizar);

                // Redirigir a una página de éxito
                response.sendRedirect("../../../Proyecto-Barberia-BYL/Administrador/pages/empleado.jsp");

            } else if (accion.equals("eliminar")) {
                // Obtener el ID del empleado a eliminar
                int id = Integer.parseInt(request.getParameter("id"));

                // Llamar al método de eliminar empleado
                empleadoDAO.delete(id);

                // Redirigir a una página de éxito
                response.sendRedirect("../../../Proyecto-Barberia-BYL/Administrador/pages/empleado.jsp");

            } else {
                // Si no se encuentra una acción válida
                response.sendRedirect("error.jsp");
            }
        } else {
            response.sendRedirect("error.jsp"); // En caso de no recibir acción
        }
    }
}