package Users;


import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



@WebServlet(name = "ServicioServlet", urlPatterns = {"/ServicioServlet"})
public class ServicioServlet extends HttpServlet {

    // Método que maneja la solicitud HTTP POST
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtenemos el tipo de acción desde el formulario (creación, actualización, eliminación)
        String accion = request.getParameter("accion"); // "crear", "actualizar", "eliminar"
        
        ServicioDAO servicioDAO = new ServicioDAO(); // Instancia del DAO

        // Determinar qué acción realizar con base en el parámetro "accion"
        if (accion != null) {
            if (accion.equals("crear")) {
                // Datos del formulario para crear un servicio
                String nombre = request.getParameter("nombreservicio");
                String descripcion = request.getParameter("descripcion");
                double precio = Double.parseDouble(request.getParameter("precio"));

                // Crear un nuevo objeto Servicio y llenarlo con los datos
                Servicio nuevoServicio = new Servicio();
                nuevoServicio.setNombreservicio(nombre);
                nuevoServicio.setDescripcion(descripcion);
                nuevoServicio.setPrecio(precio);

                // Llamar al método de crear servicio
                servicioDAO.create(nuevoServicio);

                // Redirigir a una página de éxito
                response.sendRedirect("../../../Proyecto-Barberia-BYL/Administrador/pages/servicio.jsp");

            } else if (accion.equals("actualizar")) {
                // Datos del formulario para actualizar un servicio
                int id = Integer.parseInt(request.getParameter("id"));
                String nombre = request.getParameter("nombreservicio");
                String descripcion = request.getParameter("descripcion");
                double precio = Double.parseDouble(request.getParameter("precio"));

                // Crear un objeto Servicio y llenarlo con los datos
                Servicio servicioActualizar = new Servicio();
                servicioActualizar.setIdServicio(id);
                servicioActualizar.setNombreservicio(nombre);
                servicioActualizar.setDescripcion(descripcion);
                servicioActualizar.setPrecio(precio);

                // Llamar al método de actualizar servicio
                servicioDAO.update(servicioActualizar);

                // Redirigir a una página de éxito
                response.sendRedirect("../../../Proyecto-Barberia-BYL/Administrador/pages/servicio.jsp");

            } else if (accion.equals("eliminar")) {
                // Obtener el ID del servicio a eliminar
                int id = Integer.parseInt(request.getParameter("id"));

                // Llamar al método de eliminar servicio
                servicioDAO.delete(id);

                // Redirigir a una página de éxito
                response.sendRedirect("../../../Proyecto-Barberia-BYL/Administrador/pages/servicio.jsp");

            } else {
                // Si no se encuentra una acción válida
                response.sendRedirect("error.jsp");
            }
        } else {
            response.sendRedirect("error.jsp"); // En caso de no recibir acción
        }
    }
}