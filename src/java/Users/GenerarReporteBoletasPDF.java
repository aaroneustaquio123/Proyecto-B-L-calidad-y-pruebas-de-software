package Users;

import com.lowagie.text.*;
import com.lowagie.text.pdf.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;
import java.text.NumberFormat;
import java.util.Locale;

@WebServlet(name = "GenerarReporteBoletasPDF", urlPatterns = {"/GenerarReporteBoletasPDF"})
public class GenerarReporteBoletasPDF extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=reporte_clientes_top.pdf");
        
        Document document = new Document();
        try {
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();
            
            // Fuentes para el documento
            Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18);
            Font headerFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12);
            Font normalFont = FontFactory.getFont(FontFactory.HELVETICA, 10);
            
            // Título del documento
            document.add(new Paragraph("Reporte de Clientes con Más Compras", titleFont));
            document.add(new Paragraph(" "));
            
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            
            try {
                // Conexión a la base de datos
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdBarberia", "root", "123456789");
                
                // Formato de moneda para Perú
                NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("es", "PE"));
                
                // Consulta para Top Clientes
                String queryTopClientes = "SELECT " +
                    "cliente, " +
                    "COUNT(*) as total_compras, " +
                    "SUM(total_neto) as total_comprado, " +
                    "ROUND(AVG(total_neto), 2) as promedio_compra, " +
                    "MAX(fecha) as ultima_compra " +
                    "FROM boletas " +
                    "WHERE estado = 'Pagado' " +
                    "GROUP BY cliente " +
                    "ORDER BY total_comprado DESC " +
                    "LIMIT 10";
                
                pstmt = conn.prepareStatement(queryTopClientes);
                rs = pstmt.executeQuery();
                
                // Tabla de Top Clientes
                PdfPTable topClientesTable = new PdfPTable(5);
                topClientesTable.setWidthPercentage(100);
                topClientesTable.setWidths(new float[]{3f, 1f, 2f, 2f, 2f});
                
                // Encabezados
                topClientesTable.addCell(new PdfPCell(new Phrase("Cliente", headerFont)));
                topClientesTable.addCell(new PdfPCell(new Phrase("Total Compras", headerFont)));
                topClientesTable.addCell(new PdfPCell(new Phrase("Total Comprado", headerFont)));
                topClientesTable.addCell(new PdfPCell(new Phrase("Promedio Compra", headerFont)));
                topClientesTable.addCell(new PdfPCell(new Phrase("Última Compra", headerFont)));
                
                // Datos de clientes
                boolean hasClientes = false;
                while (rs.next()) {
                    hasClientes = true;
                    topClientesTable.addCell(new PdfPCell(new Phrase(rs.getString("cliente"), normalFont)));
                    topClientesTable.addCell(new PdfPCell(new Phrase(String.valueOf(rs.getInt("total_compras")), normalFont)));
                    topClientesTable.addCell(new PdfPCell(new Phrase(currencyFormat.format(rs.getDouble("total_comprado")), normalFont)));
                    topClientesTable.addCell(new PdfPCell(new Phrase(currencyFormat.format(rs.getDouble("promedio_compra")), normalFont)));
                    topClientesTable.addCell(new PdfPCell(new Phrase(rs.getDate("ultima_compra").toString(), normalFont)));
                }
                
                if (!hasClientes) {
                    PdfPCell noDataCell = new PdfPCell(new Phrase("No hay compras registradas", normalFont));
                    noDataCell.setColspan(5);
                    topClientesTable.addCell(noDataCell);
                }
                
                document.add(new Paragraph("Top 10 Clientes por Compras", headerFont));
                document.add(topClientesTable);
                document.add(new Paragraph(" "));
                
                // Consulta detallada de compras
                String queryDetalleClientes = "SELECT " +
                    "cliente, " +
                    "fecha, " +
                    "total_bruto, " +
                    "igv, " +
                    "total_neto, " +
                    "metodo_pago " +
                    "FROM boletas " +
                    "WHERE estado = 'Pagado' " +
                    "ORDER BY cliente, fecha DESC";
                
                pstmt = conn.prepareStatement(queryDetalleClientes);
                rs = pstmt.executeQuery();
                
                // Tabla de Detalle de Compras
                PdfPTable detalleClientesTable = new PdfPTable(6);
                detalleClientesTable.setWidthPercentage(100);
                detalleClientesTable.setWidths(new float[]{2.5f, 1.5f, 1.5f, 1.5f, 1.5f, 1.5f});
                
                // Encabezados
                detalleClientesTable.addCell(new PdfPCell(new Phrase("Cliente", headerFont)));
                detalleClientesTable.addCell(new PdfPCell(new Phrase("Fecha", headerFont)));
                detalleClientesTable.addCell(new PdfPCell(new Phrase("Total Bruto", headerFont)));
                detalleClientesTable.addCell(new PdfPCell(new Phrase("IGV", headerFont)));
                detalleClientesTable.addCell(new PdfPCell(new Phrase("Total Neto", headerFont)));
                detalleClientesTable.addCell(new PdfPCell(new Phrase("Método Pago", headerFont)));
                
                // Datos de compras
                while (rs.next()) {
                    detalleClientesTable.addCell(new PdfPCell(new Phrase(rs.getString("cliente"), normalFont)));
                    detalleClientesTable.addCell(new PdfPCell(new Phrase(rs.getDate("fecha").toString(), normalFont)));
                    detalleClientesTable.addCell(new PdfPCell(new Phrase(currencyFormat.format(rs.getDouble("total_bruto")), normalFont)));
                    detalleClientesTable.addCell(new PdfPCell(new Phrase(currencyFormat.format(rs.getDouble("igv")), normalFont)));
                    detalleClientesTable.addCell(new PdfPCell(new Phrase(currencyFormat.format(rs.getDouble("total_neto")), normalFont)));
                    detalleClientesTable.addCell(new PdfPCell(new Phrase(rs.getString("metodo_pago"), normalFont)));
                }
                
                document.add(new Paragraph("Detalle de Compras", headerFont));
                document.add(detalleClientesTable);
                document.add(new Paragraph(" "));
                
                // Resumen General
                String querySumaTotal = "SELECT " +
                    "COUNT(*) as total_boletas, " +
                    "SUM(total_neto) as total_ventas, " +
                    "COUNT(DISTINCT cliente) as total_clientes " +
                    "FROM boletas " +
                    "WHERE estado = 'Pagado'";
                
                pstmt = conn.prepareStatement(querySumaTotal);
                rs = pstmt.executeQuery();
                
                if (rs.next()) {
                    document.add(new Paragraph("Resumen General", headerFont));
                    document.add(new Paragraph("Total de Boletas Pagadas: " + rs.getInt("total_boletas"), normalFont));
                    document.add(new Paragraph("Total de Ventas: " + currencyFormat.format(rs.getDouble("total_ventas")), normalFont));
                    document.add(new Paragraph("Total de Clientes: " + rs.getInt("total_clientes"), normalFont));
                }
                
            } catch (Exception e) {
                document.add(new Paragraph("Error en la generación del reporte: " + e.getMessage(), normalFont));
                e.printStackTrace();
            } finally {
                // Cerrar recursos de base de datos
                try {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    document.add(new Paragraph("Error al cerrar la conexión: " + e.getMessage(), normalFont));
                }
            }
            
        } catch (DocumentException e) {
            e.printStackTrace();
        } finally {
            document.close();
        }
    }
}