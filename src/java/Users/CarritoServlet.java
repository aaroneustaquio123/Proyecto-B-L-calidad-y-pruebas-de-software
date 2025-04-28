package Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet(name = "CarritoServlet", urlPatterns = {"/CarritoServlet"})
public class CarritoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener la sesión del usuario
        HttpSession session = request.getSession();

        // Obtener el carrito de la sesión, o crear uno nuevo si no existe
        ArrayList<HashMap<String, Object>> carrito = (ArrayList<HashMap<String, Object>>) session.getAttribute("carrito");
        if (carrito == null) {
            carrito = new ArrayList<>();
        }

        // Determinar la acción a realizar (añadir o eliminar)
        String accion = request.getParameter("accion");

        if ("eliminar".equals(accion)) {
            // Acción: Eliminar un producto del carrito
            String idProducto = request.getParameter("idProducto");

            // Eliminar el producto del carrito
            carrito.removeIf(producto -> producto.get("idProducto").equals(idProducto));

            // Guardar el carrito actualizado en la sesión
            session.setAttribute("carrito", carrito);

            // Redirigir al carrito.jsp
            response.sendRedirect("pages/carrito.jsp");
        } else {
            // Acción: Añadir un producto al carrito

            // Obtener los datos del producto enviados desde el formulario
            String idProducto = request.getParameter("idProducto");
            String nombre = request.getParameter("nombre");
            String precio = request.getParameter("precio");

            // Crear un objeto para el producto
            HashMap<String, Object> producto = new HashMap<>();
            producto.put("idProducto", idProducto);
            producto.put("nombre", nombre);
            producto.put("precio", Double.valueOf(precio));

            // Agregar el producto al carrito
            carrito.add(producto);

            // Guardar el carrito actualizado en la sesión
            session.setAttribute("carrito", carrito);

            // Redirigir al carrito.jsp
            response.sendRedirect("pages/carrito.jsp");
        }
    }
}
