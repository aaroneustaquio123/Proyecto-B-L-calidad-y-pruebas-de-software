package Users;

import com.lowagie.text.*;
import com.lowagie.text.pdf.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;

@WebServlet(name = "GenerarReporteEspecialidadPDF", urlPatterns = {"/GenerarReporteEspecialidadPDF"})
public class GenerarReporteEspecialidadPDF extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=reporte_especialidades.pdf");
        
        Document document = new Document();
        try {
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();
            
            // Título del documento
            document.add(new Paragraph("Reporte de Especialidades de Empleados", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16)));
            document.add(new Paragraph(" "));
            
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            
            try {
                // Conexión a la base de datos
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdBarberia", "root", "123456789");
                
                // Consultar especialidad más demandada
                String queryEspecialidadMasDemandada = "SELECT " +
                    "especialidad, " +
                    "COUNT(*) as total_empleados, " +
                    "ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Empleado), 2) as porcentaje " +
                    "FROM Empleado " +
                    "GROUP BY especialidad " +
                    "ORDER BY total_empleados DESC " +
                    "LIMIT 1";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(queryEspecialidadMasDemandada);
                
                if (rs.next()) {
                    document.add(new Paragraph("Especialidad más demandada: " + rs.getString("especialidad")));
                    document.add(new Paragraph("Total de Empleados: " + rs.getInt("total_empleados")));
                    document.add(new Paragraph("Porcentaje: " + rs.getDouble("porcentaje") + "%"));
                    document.add(new Paragraph(" "));
                }
                
                // Crear tabla de resumen de especialidades
                PdfPTable especialidadesTable = new PdfPTable(3);
                especialidadesTable.addCell("Especialidad");
                especialidadesTable.addCell("Total Empleados");
                especialidadesTable.addCell("Porcentaje");
                
                String queryResumenEspecialidades = "SELECT " +
                    "especialidad, " +
                    "COUNT(*) as total_empleados, " +
                    "ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Empleado), 2) as porcentaje " +
                    "FROM Empleado " +
                    "GROUP BY especialidad " +
                    "ORDER BY total_empleados DESC";
                rs = stmt.executeQuery(queryResumenEspecialidades);
                
                while (rs.next()) {
                    especialidadesTable.addCell(rs.getString("especialidad"));
                    especialidadesTable.addCell(String.valueOf(rs.getInt("total_empleados")));
                    especialidadesTable.addCell(rs.getDouble("porcentaje") + "%");
                }
                
                document.add(new Paragraph("Resumen de Especialidades"));
                document.add(especialidadesTable);
                document.add(new Paragraph(" "));
                
                // Crear tabla de detalle de empleados
                PdfPTable empleadosTable = new PdfPTable(5);
                empleadosTable.addCell("Nombre");
                empleadosTable.addCell("Apellido");
                empleadosTable.addCell("Especialidad");
                empleadosTable.addCell("Correo");
                empleadosTable.addCell("Teléfono");
                
                String queryDetalleEmpleados = "SELECT " +
                    "nombre, " +
                    "apellido, " +
                    "especialidad, " +
                    "correo, " +
                    "telefono " +
                    "FROM Empleado " +
                    "ORDER BY especialidad, nombre";
                rs = stmt.executeQuery(queryDetalleEmpleados);
                
                while (rs.next()) {
                    empleadosTable.addCell(rs.getString("nombre"));
                    empleadosTable.addCell(rs.getString("apellido"));
                    empleadosTable.addCell(rs.getString("especialidad"));
                    empleadosTable.addCell(rs.getString("correo"));
                    empleadosTable.addCell(rs.getString("telefono"));
                }
                
                document.add(new Paragraph("Detalle de Empleados"));
                document.add(empleadosTable);
                document.add(new Paragraph(" "));
                
                // Consultar total de empleados
                String queryTotalEmpleados = "SELECT " +
                    "COUNT(*) as total_empleados, " +
                    "COUNT(DISTINCT especialidad) as total_especialidades " +
                    "FROM Empleado";
                rs = stmt.executeQuery(queryTotalEmpleados);
                
                if (rs.next()) {
                    document.add(new Paragraph("Resumen General:"));
                    document.add(new Paragraph("Total de Empleados: " + rs.getInt("total_empleados")));
                    document.add(new Paragraph("Total de Especialidades Únicas: " + rs.getInt("total_especialidades")));
                }
                
            } catch (Exception e) {
                document.add(new Paragraph("Error: " + e.getMessage()));
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
            
        } catch (DocumentException | SQLException e) {
            e.printStackTrace();
        } finally {
            document.close();
        }
    }
}