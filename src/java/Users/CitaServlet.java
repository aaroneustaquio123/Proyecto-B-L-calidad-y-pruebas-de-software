package Users;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "CitaServlet", urlPatterns = {"/CitaServlet"})
public class CitaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Establecer codificación para manejar caracteres especiales
        request.setCharacterEncoding("UTF-8");

        // Obtener el tipo de acción desde el formulario
        String accion = request.getParameter("accion"); // "crear", "actualizar", "eliminar"
        
        CitaDAO citaDAO = new CitaDAO(); // Instancia del DAO

        try {
            // Determinar qué acción realizar
            if (accion != null) {
                if (accion.equals("crear")) {
                    // Datos del formulario para crear una cita
                    String empleado = request.getParameter("empleado");
                    String servicio = request.getParameter("servicio");
                    String sede = request.getParameter("sede");
                    
                    // Validación de campos de fecha y hora
                    String fechaStr = request.getParameter("fecha");
                    String horaInicioStr = request.getParameter("horaInicio");
                    String horaFinStr = request.getParameter("horaFin");
                    
                    // Validación de campos nulos o vacíos
                    if (fechaStr == null || horaInicioStr == null || horaFinStr == null ||
                        fechaStr.trim().isEmpty() || horaInicioStr.trim().isEmpty() || horaFinStr.trim().isEmpty()) {
                        throw new IllegalArgumentException("Fecha u hora no pueden estar vacías");
                    }
                    
                    // Convertir fecha y tiempo con manejo de formato
                    Date fecha = Date.valueOf(fechaStr);
                    
                    // Asegurar que el formato de hora sea HH:MM (24 horas)
                    Time horaInicio = validateAndConvertTime(horaInicioStr);
                    Time horaFin = validateAndConvertTime(horaFinStr);
                    
                    String clienteNombre = request.getParameter("clienteNombre");
                    String estado = request.getParameter("estado");

                    // Crear un nuevo objeto Cita
                    Cita nuevaCita = new Cita(
                        0, // El ID será generado automáticamente
                        empleado, 
                        servicio, 
                        sede, 
                        fecha, 
                        horaInicio, 
                        horaFin, 
                        clienteNombre, 
                        estado
                    );

                    // Llamar al método de crear cita
                    citaDAO.create(nuevaCita);

                    
                    // Redirigir a la página de citas
                    response.sendRedirect("../../../Proyecto-Barberia-BYL/Administrador/pages/citas.jsp");

                } else if (accion.equals("actualizar")) {
                    // Código de actualización similar al de crear, con validaciones
                    int idCita = Integer.parseInt(request.getParameter("idCita"));
                    String empleado = request.getParameter("empleado");
                    String servicio = request.getParameter("servicio");
                    String sede = request.getParameter("sede");
                    Date fecha = Date.valueOf(request.getParameter("fecha"));
                    Time horaInicio = validateAndConvertTime(request.getParameter("horaInicio"));
                    Time horaFin = validateAndConvertTime(request.getParameter("horaFin"));
                    String clienteNombre = request.getParameter("clienteNombre");
                    String estado = request.getParameter("estado");

                    // Crear un objeto Cita para actualizar
                    Cita citaActualizar = new Cita(
                        idCita, 
                        empleado, 
                        servicio, 
                        sede, 
                        fecha, 
                        horaInicio, 
                        horaFin, 
                        clienteNombre, 
                        estado
                    );

                    // Llamar al método de actualizar cita
                    citaDAO.update(citaActualizar);

                    // Redirigir a la página de citas
                    response.sendRedirect("../../../Proyecto-Barberia-BYL/Administrador/pages/citas.jsp");

                } else if (accion.equals("eliminar")) {
                    // Obtener el ID de la cita a eliminar
                    int idCita = Integer.parseInt(request.getParameter("idCita"));

                    // Llamar al método de eliminar cita
                    citaDAO.delete(idCita);

                    // Redirigir a la página de citas
                    response.sendRedirect("../../../Proyecto-Barberia-BYL/Administrador/pages/citas.jsp");

                } else {
                    // Si no se encuentra una acción válida
                    response.sendRedirect("error.jsp");
                }
            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (IllegalArgumentException e) {
    // Manejo de errores de conversión
    e.printStackTrace();
    request.setAttribute("errorMensaje", "Error en los datos ingresados: " + e.getMessage());
    request.getRequestDispatcher("../../../Proyecto-Barberia-BYL/Administrador/pages/citas.jsp").forward(request, response);
}
 catch (Exception e) {
            // Manejo de otros errores
            e.printStackTrace();
            request.setAttribute("errorMensaje", "Ocurrió un error inesperado: " + e.getMessage());
            request.getRequestDispatcher("../../../Proyecto-Barberia-BYL/Administrador/pages/citas.jsp").forward(request, response);
        }
    }

    // Método auxiliar para validar y convertir tiempo
    private Time validateAndConvertTime(String timeStr) {
        if (timeStr == null || timeStr.trim().isEmpty()) {
            throw new IllegalArgumentException("La hora no puede estar vacía");
        }
        
        // Asegurar formato HH:MM
        if (!timeStr.matches("\\d{2}:\\d{2}")) {
            throw new IllegalArgumentException("Formato de hora inválido. Use HH:MM");
        }
        
        return Time.valueOf(timeStr + ":00");  // Añadir segundos
    }
}