<%-- 
    Document   : login_administrador
    Created on : 19 oct. 2024, 1:33:46 p. m.
    Author     : Micha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Administrador</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../Administrador/css/styless4.css">
</head>
<body style="background-image: url('../assets/pagina_principal.jpg');">

<div class="container h-100 d-flex justify-content-center align-items-center">

    <div class="row w-100">

        <div class="col-md-2"></div>

        <div class="col-md-4" style="padding-left: 60px; margin-right: 0px !important; padding-right: 0px !important;">
            <div class="login-container">
                <h2 style="text-align: center;">Iniciar sesión</h2>
                <!-- Se modifica el formulario para que apunte al servlet -->
                <form action="../svAdministrador" method="post">
                    <div class="mb-3">
                        <label for="username" class="form-label">Correo Electrónico</label>
                        <input type="text" class="form-control" id="username" name="username" placeholder="Ingresa tu correo" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Contraseña</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Ingresa tu contraseña" required>
                    </div>
                    <button type="submit" class="btn btn-custom w-100" style="margin-top: 30px;">Entrar</button>
                </form>
                <!-- Mensaje de error en caso de credenciales inválidas -->
                <c:if test="${param.error == 'invalid'}">
                    <p class="text-danger mt-3">Usuario o contraseña incorrectos.</p>
                </c:if>
                <c:if test="${param.error == 'error'}">
                    <p class="text-danger mt-3">Hubo un error. Inténtalo nuevamente.</p>
                </c:if>
            </div>
        </div>

        <div class="col-md-5" style="margin-left: 0 !important; padding-left: 0px !important; display: flex; align-items: center;">
            <div class="message-container" style="height: 40vh;">
                <h2>¡Nos esforzamos por mejorar!</h2>
                <img src="../assets/barber-logo.jpg" alt="Logo Barbería">
            </div>
        </div>

        <div class="col-md-1"></div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
