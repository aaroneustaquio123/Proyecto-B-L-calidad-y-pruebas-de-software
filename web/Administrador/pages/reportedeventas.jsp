<%-- 
    Document   : reportedeventas
    Created on : 30 nov. 2024, 11:09:02?a. m.
    Author     : Liz
--%>

<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="jakarta.servlet.http.*, jakarta.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reporte de Ventas</title>
</head>
<body>
    <h1>Reporte de Ventas</h1>
    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        String empleadoMasCitas = "";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdBarberia", "root", "123456789");
            stmt = conn.createStatement();

            // Consultar el empleado con más citas
            String query = "SELECT empleado, COUNT(*) as total_citas FROM citas GROUP BY empleado ORDER BY total_citas DESC LIMIT 1";
            rs = stmt.executeQuery(query);

            if (rs.next()) {
                empleadoMasCitas = rs.getString("empleado");
                out.println("<p>Empleado con más citas: <b>" + empleadoMasCitas + "</b> (" + rs.getInt("total_citas") + " citas)</p>");
            }
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    %>

    <form action="/Proyecto-Barberia-BYL/GenerarReportePDF" method="post">
        <input type="hidden" name="empleado" value="<%= empleadoMasCitas %>">
        <button type="submit">Descargar Reporte en PDF</button>
    </form>
</body>
</html>
