/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Users;

import com.lowagie.text.*;
import com.lowagie.text.pdf.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;

/**
 *
 * @author Liz
 */
@WebServlet(name = "GenerarReportePDF", urlPatterns = {"/GenerarReportePDF"})
public class GenerarReportePDF extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Configurar el encabezado para el archivo PDF
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=reporte_ventas.pdf");

        // Crear el documento PDF
        Document document = new Document();
        try {
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            // Título del reporte
            document.add(new Paragraph("Reporte de Ventas", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16)));
            document.add(new Paragraph(" "));

            // Conexión a la base de datos
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                // Configuración de la conexión
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdBarberia", "root", "123456789");

                stmt = conn.createStatement();

                // Consultar el empleado con más citas
                String queryEmpleado = "SELECT empleado, COUNT(*) as total_citas FROM citas GROUP BY empleado ORDER BY total_citas DESC LIMIT 1";
                rs = stmt.executeQuery(queryEmpleado);

                String empleadoMasCitas = "";
                if (rs.next()) {
                    empleadoMasCitas = rs.getString("empleado");
                    document.add(new Paragraph("Empleado con más citas: " + empleadoMasCitas));
                    document.add(new Paragraph(" "));
                }

                // Consultar las citas del empleado con más citas
                String queryCitas = "SELECT * FROM citas WHERE empleado = '" + empleadoMasCitas + "'";
                rs = stmt.executeQuery(queryCitas);

                // Crear una tabla para mostrar las citas
                PdfPTable table = new PdfPTable(5); // Número de columnas
                table.addCell("ID Cita");
                table.addCell("Servicio");
                table.addCell("Sede");
                table.addCell("Fecha");
                table.addCell("Cliente");

                // Agregar datos a la tabla
                while (rs.next()) {
                    table.addCell(String.valueOf(rs.getInt("id_cita")));
                    table.addCell(rs.getString("servicio"));
                    table.addCell(rs.getString("sede"));
                    table.addCell(rs.getDate("fecha").toString());
                    table.addCell(rs.getString("cliente_nombre"));
                }

                // Agregar la tabla al documento
                document.add(table);
            } catch (DocumentException | ClassNotFoundException | SQLException e) {
                document.add(new Paragraph("Error: " + e.getMessage()));
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        } catch (DocumentException | IOException | SQLException e) {
        } finally {
            document.close();
        }
    }
}
