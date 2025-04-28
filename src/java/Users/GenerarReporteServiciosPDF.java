package Users;

import com.lowagie.text.*;
import com.lowagie.text.pdf.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;

@WebServlet(name = "GenerarReporteServiciosPDF", urlPatterns = {"/GenerarReporteServiciosPDF"})
public class GenerarReporteServiciosPDF extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=reporte_servicios.pdf");
        
        Document document = new Document();
        try {
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();
            
            // Title
            document.add(new Paragraph("Reporte de Servicios", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16)));
            document.add(new Paragraph(" "));
            
            // Database connection
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            
            try {
                // Database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdBarberia", "root", "123456789");
                
                // Query for most requested service
                String queryMostRequested = "SELECT servicio, COUNT(*) as total_solicitudes " +
                    "FROM citas " +
                    "GROUP BY servicio " +
                    "ORDER BY total_solicitudes DESC " +
                    "LIMIT 1";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(queryMostRequested);
                
                if (rs.next()) {
                    document.add(new Paragraph("Servicio más solicitado: " + 
                        rs.getString("servicio") + 
                        " (Total: " + rs.getInt("total_solicitudes") + " solicitudes)"));
                    document.add(new Paragraph(" "));
                }
                
                // Create table of service requests
                PdfPTable table = new PdfPTable(3);
                table.addCell("Servicio");
                table.addCell("Total Solicitudes");
                table.addCell("Porcentaje");
                
                // Query to get all service request counts
                String queryServiceCounts = "SELECT servicio, COUNT(*) as total_solicitudes, " +
                    "(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM citas)) AS porcentaje " +
                    "FROM citas " +
                    "GROUP BY servicio " +
                    "ORDER BY total_solicitudes DESC";
                
                rs = stmt.executeQuery(queryServiceCounts);
                
                while (rs.next()) {
                    table.addCell(rs.getString("servicio"));
                    table.addCell(String.valueOf(rs.getInt("total_solicitudes")));
                    table.addCell(String.format("%.2f%%", rs.getDouble("porcentaje")));
                }
                
                document.add(table);
                
                // Additional statistics
                String queryStats = "SELECT " +
                    "COUNT(DISTINCT servicio) as total_servicios, " +
                    "COUNT(*) as total_citas " +
                    "FROM citas";
                rs = stmt.executeQuery(queryStats);
                
                if (rs.next()) {
                    document.add(new Paragraph(" "));
                    document.add(new Paragraph("Estadísticas de Servicios:"));
                    document.add(new Paragraph("Total de Tipos de Servicios: " + rs.getInt("total_servicios")));
                    document.add(new Paragraph("Total de Citas Realizadas: " + rs.getInt("total_citas")));
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