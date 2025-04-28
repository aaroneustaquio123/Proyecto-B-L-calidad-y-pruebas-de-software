package Users;


import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



@WebServlet(name = "ProveedorServlet", urlPatterns = {"/ProveedorServlet"})
public class ProveedorServlet extends HttpServlet {

    // Método que maneja la solicitud HTTP POST
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtenemos el tipo de acción desde el formulario (creación, actualización, eliminación)
        String accion = request.getParameter("accion"); // "crear", "actualizar", "eliminar"
        
        ProveedorDAO proveedorDAO = new ProveedorDAO(); // Instancia del DAO

        // Determinar qué acción realizar con base en el parámetro "accion"
        if (accion != null) {
            if (accion.equals("crear")) {
                // Datos del formulario para crear un proveedor
                String nombre = request.getParameter("nombre");
                String ruc = request.getParameter("ruc");
                String telefono = request.getParameter("telefono");
                String direccion = request.getParameter("direccion");
                String descripcion = request.getParameter("descripcion");

                // Crear un nuevo objeto Proveedor y llenarlo con los datos
                Proveedor nuevoProveedor = new Proveedor();
                nuevoProveedor.setNombre(nombre);
                nuevoProveedor.setRuc(ruc);
                nuevoProveedor.setTelefono(telefono);
                nuevoProveedor.setDireccion(direccion);
                nuevoProveedor.setDescripcion(descripcion);

                // Llamar al método de crear proveedor
                proveedorDAO.create(nuevoProveedor);

                // Redirigir a una página de éxito
                response.sendRedirect("../../../Proyecto-Barberia-BYL/Administrador/pages/proveedor.jsp");

            } else if (accion.equals("actualizar")) {
                // Datos del formulario para actualizar un proveedor
                int idProveedor = Integer.parseInt(request.getParameter("idProveedor"));
                String nombre = request.getParameter("nombre");
                String ruc = request.getParameter("ruc");
                String telefono = request.getParameter("telefono");
                String direccion = request.getParameter("direccion");
                String descripcion = request.getParameter("descripcion");

                // Crear un objeto Proveedor y llenarlo con los datos
                Proveedor proveedorActualizar = new Proveedor();
                proveedorActualizar.setIdProveedor(idProveedor);
                proveedorActualizar.setNombre(nombre);
                proveedorActualizar.setRuc(ruc);
                proveedorActualizar.setTelefono(telefono);
                proveedorActualizar.setDireccion(direccion);
                proveedorActualizar.setDescripcion(descripcion);

                // Llamar al método de actualizar proveedor
                proveedorDAO.update(proveedorActualizar);

                // Redirigir a una página de éxito
                response.sendRedirect("../../../Proyecto-Barberia-BYL/Administrador/pages/proveedor.jsp");

            } else if (accion.equals("eliminar")) {
                // Obtener el ID del proveedor a eliminar
                int idProveedor = Integer.parseInt(request.getParameter("idProveedor"));

                // Llamar al método de eliminar proveedor
                proveedorDAO.delete(idProveedor);

                // Redirigir a una página de éxito
                response.sendRedirect("../../../Proyecto-Barberia-BYL/Administrador/pages/proveedor.jsp");

            } else {
                // Si no se encuentra una acción válida
                response.sendRedirect("error.jsp");
            }
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}