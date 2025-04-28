package Users;


import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ProductoServlet", urlPatterns = {"/ProductoServlet"})
public class ProductoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Establecer codificación para evitar problemas con caracteres especiales
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // Obtener acción
        String accion = request.getParameter("accion");
        ProductoDAO productoDAO = new ProductoDAO();

        try {
            if (accion != null) {
                switch (accion) {
                    case "crear":
                        // Validar y capturar los datos del formulario
                        String nombre = request.getParameter("nombre");
                        double precio = Double.parseDouble(request.getParameter("precio"));
                        int stock = Integer.parseInt(request.getParameter("stock"));
                        String sede = request.getParameter("sede");
                        String descripcion = request.getParameter("descripcion");

                        // Crear un nuevo producto
                        Producto nuevoProducto = new Producto(0, nombre, precio, stock, sede, descripcion);
                        productoDAO.create(nuevoProducto);

                        // Redirigir a una página de éxito
                        response.sendRedirect("../../../Proyecto-Barberia-BYL/Administrador/pages/productos.jsp");
                        break;

                    case "actualizar":
                        // Validar y capturar los datos del formulario
                        int idActualizar = Integer.parseInt(request.getParameter("id"));
                        String nombreActualizar = request.getParameter("nombre");
                        double precioActualizar = Double.parseDouble(request.getParameter("precio"));
                        int stockActualizar = Integer.parseInt(request.getParameter("stock"));
                        String sedeActualizar = request.getParameter("sede");
                        String descripcionActualizar = request.getParameter("descripcion");

                        // Actualizar el producto existente
                        Producto productoActualizar = new Producto(idActualizar, nombreActualizar, precioActualizar, stockActualizar, sedeActualizar, descripcionActualizar);
                        productoDAO.update(productoActualizar);

                        // Redirigir a una página de éxito
                        response.sendRedirect("../../../Proyecto-Barberia-BYL/Administrador/pages/productos.jsp");
                        break;

                    case "eliminar":
                        // Capturar el ID del producto a eliminar
                        int idEliminar = Integer.parseInt(request.getParameter("id"));

                        // Eliminar el producto
                        productoDAO.delete(idEliminar);

                        // Redirigir a una página de éxito
                        response.sendRedirect("../../../Proyecto-Barberia-BYL/Administrador/pages/productos.jsp");
                        break;

                    default:
                        // Redirigir a una página de error si la acción no es válida
                        response.sendRedirect("error.jsp");
                        break;
                }
            } else {
                // Redirigir a una página de error si no hay acción definida
                response.sendRedirect("error.jsp");
            }
        } catch (NumberFormatException e) {
            // Manejar errores de conversión de datos numéricos
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        } catch (Exception e) {
            // Manejar cualquier otra excepción
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}