package Users;

import com.lowagie.text.*;
import com.lowagie.text.pdf.*;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;

@WebServlet(name = "GenerarReporteProductosPDF", urlPatterns = {"/GenerarReporteProductosPDF"})
public class GenerarReporteProductosPDF extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=reporte_productos.pdf");
        
        Document document = new Document();
        try {
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();
            
            // Título del documento
            document.add(new Paragraph("Reporte Detallado de Productos", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16)));
            document.add(new Paragraph(" "));
            
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            
            try {
                // Conexión a la base de datos
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdBarberia", "root", "123456789");
                
                // Consultar producto con mayor stock
                String queryMayorStock = "SELECT nombre, stock, sede, precio " +
                    "FROM Productos " +
                    "ORDER BY stock DESC " +
                    "LIMIT 1";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(queryMayorStock);
                
                if (rs.next()) {
                    document.add(new Paragraph("Producto con Mayor Stock: " + rs.getString("nombre")));
                    document.add(new Paragraph("Stock: " + rs.getInt("stock") + " unidades"));
                    document.add(new Paragraph("Sede: " + rs.getString("sede")));
                    document.add(new Paragraph("Precio: $" + rs.getDouble("precio")));
                    document.add(new Paragraph(" "));
                }
                
                // Crear tabla de resumen por sede
                PdfPTable sedeSummaryTable = new PdfPTable(4);
                sedeSummaryTable.addCell("Sede");
                sedeSummaryTable.addCell("Total Productos");
                sedeSummaryTable.addCell("Stock Total");
                sedeSummaryTable.addCell("Precio Promedio");
                
                String queryProductosPorSede = "SELECT " +
                    "sede, " +
                    "COUNT(*) as total_productos, " +
                    "SUM(stock) as stock_total, " +
                    "ROUND(AVG(precio), 2) as precio_promedio " +
                    "FROM Productos " +
                    "GROUP BY sede " +
                    "ORDER BY stock_total DESC";
                rs = stmt.executeQuery(queryProductosPorSede);
                
                while (rs.next()) {
                    sedeSummaryTable.addCell(rs.getString("sede"));
                    sedeSummaryTable.addCell(String.valueOf(rs.getInt("total_productos")));
                    sedeSummaryTable.addCell(String.valueOf(rs.getInt("stock_total")));
                    sedeSummaryTable.addCell("$" + rs.getDouble("precio_promedio"));
                }
                
                document.add(new Paragraph("Resumen de Productos por Sede"));
                document.add(sedeSummaryTable);
                document.add(new Paragraph(" "));
                
                // Crear tabla de detalle de productos
                PdfPTable productosTable = new PdfPTable(4);
                productosTable.addCell("Nombre");
                productosTable.addCell("Stock");
                productosTable.addCell("Precio");
                productosTable.addCell("Sede");
                
                String queryDetalleProductos = "SELECT " +
                    "nombre, " +
                    "stock, " +
                    "precio, " +
                    "sede " +
                    "FROM Productos " +
                    "ORDER BY stock DESC";
                rs = stmt.executeQuery(queryDetalleProductos);
                
                while (rs.next()) {
                    productosTable.addCell(rs.getString("nombre"));
                    productosTable.addCell(String.valueOf(rs.getInt("stock")));
                    productosTable.addCell("$" + rs.getDouble("precio"));
                    productosTable.addCell(rs.getString("sede"));
                }
                
                document.add(new Paragraph("Detalle de Productos"));
                document.add(productosTable);
                document.add(new Paragraph(" "));
                
                // Consultar total de productos
                String queryTotalProductos = "SELECT " +
                    "COUNT(*) as total_productos, " +
                    "SUM(stock) as stock_total, " +
                    "ROUND(AVG(precio), 2) as precio_promedio " +
                    "FROM Productos";
                rs = stmt.executeQuery(queryTotalProductos);
                
                if (rs.next()) {
                    document.add(new Paragraph("Resumen General:"));
                    document.add(new Paragraph("Total de Productos: " + rs.getInt("total_productos")));
                    document.add(new Paragraph("Stock Total: " + rs.getInt("stock_total") + " unidades"));
                    document.add(new Paragraph("Precio Promedio: $" + rs.getDouble("precio_promedio")));
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