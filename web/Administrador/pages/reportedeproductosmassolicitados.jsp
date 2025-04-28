<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reporte de Productos en Stock</title>
    <style>
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <h1>Reporte de Productos</h1>
    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        
        try {
            // Establecer conexión a la base de datos
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdBarberia", "root", "123456789");
            stmt = conn.createStatement();
            
            // Consultar el producto con mayor stock
            String queryMayorStock = "SELECT nombre, stock, sede, precio " +
                "FROM Productos " +
                "ORDER BY stock DESC " +
                "LIMIT 1";
            rs = stmt.executeQuery(queryMayorStock);
            
            if (rs.next()) {
                out.println("<p>Producto con Mayor Stock: <b>" + rs.getString("nombre") + "</b>");
                out.println(" (Stock: " + rs.getInt("stock") + " unidades)");
                out.println(" - Sede: " + rs.getString("sede"));
                out.println(" - Precio: $" + rs.getDouble("precio") + "</p>");
            }
            
            // Consultar resumen de productos por sede
            String queryProductosPorSede = "SELECT " +
                "sede, " +
                "COUNT(*) as total_productos, " +
                "SUM(stock) as stock_total, " +
                "ROUND(AVG(precio), 2) as precio_promedio " +
                "FROM Productos " +
                "GROUP BY sede " +
                "ORDER BY stock_total DESC";
            rs = stmt.executeQuery(queryProductosPorSede);
            
            out.println("<h2>Resumen de Productos por Sede</h2>");
            out.println("<table>");
            out.println("<tr><th>Sede</th><th>Total Productos</th><th>Stock Total</th><th>Precio Promedio</th></tr>");
            
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getString("sede") + "</td>");
                out.println("<td>" + rs.getInt("total_productos") + "</td>");
                out.println("<td>" + rs.getInt("stock_total") + "</td>");
                out.println("<td>$" + rs.getDouble("precio_promedio") + "</td>");
                out.println("</tr>");
            }
            
            out.println("</table>");
            
            // Consultar detalle de productos
            String queryDetalleProductos = "SELECT " +
                "nombre, " +
                "stock, " +
                "precio, " +
                "sede " +
                "FROM Productos " +
                "ORDER BY stock DESC";
            rs = stmt.executeQuery(queryDetalleProductos);
            
            out.println("<h2>Detalle de Productos</h2>");
            out.println("<table>");
            out.println("<tr><th>Nombre</th><th>Stock</th><th>Precio</th><th>Sede</th></tr>");
            
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getString("nombre") + "</td>");
                out.println("<td>" + rs.getInt("stock") + "</td>");
                out.println("<td>$" + rs.getDouble("precio") + "</td>");
                out.println("<td>" + rs.getString("sede") + "</td>");
                out.println("</tr>");
            }
            
            out.println("</table>");
            
            // Consultar total de productos
            String queryTotalProductos = "SELECT " +
                "COUNT(*) as total_productos, " +
                "SUM(stock) as stock_total, " +
                "ROUND(AVG(precio), 2) as precio_promedio " +
                "FROM Productos";
            rs = stmt.executeQuery(queryTotalProductos);
            
            if (rs.next()) {
                out.println("<h2>Resumen General</h2>");
                out.println("<p>Total de Productos: " + rs.getInt("total_productos") + "</p>");
                out.println("<p>Stock Total: " + rs.getInt("stock_total") + " unidades</p>");
                out.println("<p>Precio Promedio: $" + rs.getDouble("precio_promedio") + "</p>");
            }
            
        } catch (Exception e) {
            out.println("<p>Error en la generación del reporte: " + e.getMessage() + "</p>");
            e.printStackTrace();
        } finally {
            // Cerrar recursos de base de datos
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                out.println("<p>Error al cerrar la conexión: " + e.getMessage() + "</p>");
            }
        }
    %>
    
    <form action="/Proyecto-Barberia-BYL/GenerarReporteProductosPDF" method="get">
        <button type="submit">Descargar Reporte de Productos en PDF</button>
    </form>
</body>
</html>