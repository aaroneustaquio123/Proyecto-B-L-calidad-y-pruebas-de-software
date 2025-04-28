<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="alert alert-danger">
            <h2>Ocurrió un Error</h2>
            <p><%= request.getAttribute("errorMensaje") != null ? request.getAttribute("errorMensaje") : "Error desconocido" %></p>
            <a href="./Administrador/pages/citas.jsp" class="btn btn-primary">Volver</a>
        </div>
    </div>
</body>
</html>