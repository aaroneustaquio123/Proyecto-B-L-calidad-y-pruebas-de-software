<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reporte de Especialidades de Empleados</title>
    <style>
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <h1>Reporte de Especialidades de Empleados</h1>
    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        
        try {
            // Establecer conexión a la base de datos
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdBarberia", "root", "123456789");
            stmt = conn.createStatement();
            
            // Consultar la especialidad con más empleados
            String queryEspecialidadMasDemandada = "SELECT " +
                "especialidad, " +
                "COUNT(*) as total_empleados, " +
                "ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Empleado), 2) as porcentaje " +
                "FROM Empleado " +
                "GROUP BY especialidad " +
                "ORDER BY total_empleados DESC " +
                "LIMIT 1";
            rs = stmt.executeQuery(queryEspecialidadMasDemandada);
            
            if (rs.next()) {
                out.println("<p>Especialidad más demandada: <b>" + rs.getString("especialidad") + "</b>");
                out.println(" (Total de Empleados: " + rs.getInt("total_empleados") + ")");
                out.println(" - Porcentaje: " + rs.getDouble("porcentaje") + "%</p>");
            }
            
            // Consultar resumen de especialidades
            String queryResumenEspecialidades = "SELECT " +
                "especialidad, " +
                "COUNT(*) as total_empleados, " +
                "ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Empleado), 2) as porcentaje, " +
                "GROUP_CONCAT(nombre, ' ', apellido SEPARATOR ', ') as empleados " +
                "FROM Empleado " +
                "GROUP BY especialidad " +
                "ORDER BY total_empleados DESC";
            rs = stmt.executeQuery(queryResumenEspecialidades);
            
            out.println("<h2>Resumen de Especialidades</h2>");
            out.println("<table>");
            out.println("<tr><th>Especialidad</th><th>Total Empleados</th><th>Porcentaje</th><th>Empleados</th></tr>");
            
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getString("especialidad") + "</td>");
                out.println("<td>" + rs.getInt("total_empleados") + "</td>");
                out.println("<td>" + rs.getDouble("porcentaje") + "%</td>");
                out.println("<td>" + rs.getString("empleados") + "</td>");
                out.println("</tr>");
            }
            
            out.println("</table>");
            
            // Consultar detalle de empleados por especialidad
            String queryDetalleEmpleados = "SELECT " +
                "nombre, " +
                "apellido, " +
                "especialidad, " +
                "correo, " +
                "telefono " +
                "FROM Empleado " +
                "ORDER BY especialidad, nombre";
            rs = stmt.executeQuery(queryDetalleEmpleados);
            
            out.println("<h2>Detalle de Empleados</h2>");
            out.println("<table>");
            out.println("<tr><th>Nombre</th><th>Apellido</th><th>Especialidad</th><th>Correo</th><th>Teléfono</th></tr>");
            
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getString("nombre") + "</td>");
                out.println("<td>" + rs.getString("apellido") + "</td>");
                out.println("<td>" + rs.getString("especialidad") + "</td>");
                out.println("<td>" + rs.getString("correo") + "</td>");
                out.println("<td>" + rs.getString("telefono") + "</td>");
                out.println("</tr>");
            }
            
            out.println("</table>");
            
            // Consultar total de empleados
            String queryTotalEmpleados = "SELECT " +
                "COUNT(*) as total_empleados, " +
                "COUNT(DISTINCT especialidad) as total_especialidades " +
                "FROM Empleado";
            rs = stmt.executeQuery(queryTotalEmpleados);
            
            if (rs.next()) {
                out.println("<h2>Resumen General</h2>");
                out.println("<p>Total de Empleados: " + rs.getInt("total_empleados") + "</p>");
                out.println("<p>Total de Especialidades Únicas: " + rs.getInt("total_especialidades") + "</p>");
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
    
    <form action="/Proyecto-Barberia-BYL/GenerarReporteEspecialidadPDF" method="get">
        <button type="submit">Descargar Reporte de Especialidades en PDF</button>
    </form>
</body>
</html>