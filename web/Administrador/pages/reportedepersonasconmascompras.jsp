<%@ page import="java.sql.*, java.text.NumberFormat, java.util.Locale" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reporte de Clientes con Más Compras</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        table { 
            border-collapse: collapse; 
            width: 100%; 
            margin-bottom: 20px; 
        }
        th, td { 
            border: 1px solid #ddd; 
            padding: 8px; 
            text-align: left; 
        }
        th { 
            background-color: #f2f2f2; 
            font-weight: bold; 
        }
        .summary { 
            background-color: #f9f9f9; 
            padding: 10px; 
            border: 1px solid #e0e0e0; 
        }
    </style>
</head>
<body>
    <h1>Reporte de Clientes con Más Compras</h1>

    <%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
        // Establecer conexión a la base de datos
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdBarberia", "root", "123456789");
        
        // Formato de moneda
        NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("es", "PE"));
        
        // Consulta para obtener clientes con más compras pagadas
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
            "LIMIT 10"; // Top 10 clientes
        
        pstmt = conn.prepareStatement(queryTopClientes);
        rs = pstmt.executeQuery();
        
        // Sección de Resumen de Top Clientes
        out.println("<div class='summary'>");
        out.println("<h2>Resumen de Top Clientes</h2>");
        
        out.println("<table>");
        out.println("<tr>" +
            "<th>Cliente</th>" +
            "<th>Total Compras</th>" +
            "<th>Total Comprado</th>" +
            "<th>Promedio por Compra</th>" +
            "<th>Última Compra</th>" +
        "</tr>");
        
        boolean hasClientes = false;
        while (rs.next()) {
            hasClientes = true;
            out.println("<tr>");
            out.println("<td>" + rs.getString("cliente") + "</td>");
            out.println("<td>" + rs.getInt("total_compras") + "</td>");
            out.println("<td>" + currencyFormat.format(rs.getDouble("total_comprado")) + "</td>");
            out.println("<td>" + currencyFormat.format(rs.getDouble("promedio_compra")) + "</td>");
            out.println("<td>" + rs.getDate("ultima_compra") + "</td>");
            out.println("</tr>");
        }
        
        if (!hasClientes) {
            out.println("<tr><td colspan='5'>No hay compras registradas</td></tr>");
        }
        
        out.println("</table>");
        out.println("</div>");
        
        // Detalles de Clientes
        out.println("<h2>Detalle de Compras por Cliente</h2>");
        
        // Consulta detallada de compras por cliente
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
        
        out.println("<table>");
        out.println("<tr>" +
            "<th>Cliente</th>" +
            "<th>Fecha</th>" +
            "<th>Total Bruto</th>" +
            "<th>IGV</th>" +
            "<th>Total Neto</th>" +
            "<th>Método de Pago</th>" +
        "</tr>");
        
        while (rs.next()) {
            out.println("<tr>");
            out.println("<td>" + rs.getString("cliente") + "</td>");
            out.println("<td>" + rs.getDate("fecha") + "</td>");
            out.println("<td>" + currencyFormat.format(rs.getDouble("total_bruto")) + "</td>");
            out.println("<td>" + currencyFormat.format(rs.getDouble("igv")) + "</td>");
            out.println("<td>" + currencyFormat.format(rs.getDouble("total_neto")) + "</td>");
            out.println("<td>" + rs.getString("metodo_pago") + "</td>");
            out.println("</tr>");
        }
        
        out.println("</table>");
        
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
            out.println("<div class='summary'>");
            out.println("<h2>Resumen General</h2>");
            out.println("<p>Total de Boletas Pagadas: " + rs.getInt("total_boletas") + "</p>");
            out.println("<p>Total de Ventas: " + currencyFormat.format(rs.getDouble("total_ventas")) + "</p>");
            out.println("<p>Total de Clientes: " + rs.getInt("total_clientes") + "</p>");
            out.println("</div>");
        }
        
    } catch (Exception e) {
        out.println("<p>Error en la generación del reporte: " + e.getMessage() + "</p>");
        e.printStackTrace();
    } finally {
        // Cerrar recursos de base de datos
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            out.println("<p>Error al cerrar la conexión: " + e.getMessage() + "</p>");
        }
    }
    %>
    
    <form action="/Proyecto-Barberia-BYL/GenerarReporteBoletasPDF" method="get">
        <button type="submit">Descargar Reporte de Boletas en PDF</button>
    </form>
</body>
</html>