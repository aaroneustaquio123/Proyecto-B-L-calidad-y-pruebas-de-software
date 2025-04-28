<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reporte de Servicios Solicitados</title>
</head>
<body>
    <h1>Reporte de Servicios Solicitados</h1>
    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        String servicioMasSolicitado = "";
        int totalSolicitudes = 0;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdBarberia", "root", "123456789");
            stmt = conn.createStatement();
            
            // Consultar el servicio más solicitado
            String query = "SELECT servicio, COUNT(*) as total_solicitudes " +
                "FROM citas " +
                "GROUP BY servicio " +
                "ORDER BY total_solicitudes DESC " +
                "LIMIT 1";
            rs = stmt.executeQuery(query);
            
            if (rs.next()) {
                servicioMasSolicitado = rs.getString("servicio");
                totalSolicitudes = rs.getInt("total_solicitudes");
                out.println("<p>Servicio más solicitado: <b>" + servicioMasSolicitado + "</b> (Total: " + totalSolicitudes + " solicitudes)</p>");
            }
            
            // Consultar total de tipos de servicios
            query = "SELECT COUNT(DISTINCT servicio) as total_servicios FROM citas";
            rs = stmt.executeQuery(query);
            
            if (rs.next()) {
                out.println("<p>Total de Tipos de Servicios: " + rs.getInt("total_servicios") + "</p>");
            }
            
            // Detalles de solicitudes por servicio
            query = "SELECT servicio, COUNT(*) as total_solicitudes, " +
                "(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM citas)) AS porcentaje " +
                "FROM citas " +
                "GROUP BY servicio " +
                "ORDER BY total_solicitudes DESC";
            rs = stmt.executeQuery(query);
            
            out.println("<h2>Detalle de Servicios</h2>");
            out.println("<table border='1'>");
            out.println("<tr><th>Servicio</th><th>Total Solicitudes</th><th>Porcentaje</th></tr>");
            
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getString("servicio") + "</td>");
                out.println("<td>" + rs.getInt("total_solicitudes") + "</td>");
                out.println("<td>" + String.format("%.2f%%", rs.getDouble("porcentaje")) + "</td>");
                out.println("</tr>");
            }
            
            out.println("</table>");
            
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    %>
    
    <form action="/Proyecto-Barberia-BYL/GenerarReporteServiciosPDF" method="get">
        <button type="submit">Descargar Reporte de Servicios en PDF</button>
    </form>
</body>
</html>