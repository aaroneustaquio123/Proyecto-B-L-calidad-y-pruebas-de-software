<%-- 
    Document   : recuperar_usuario
    Created on : 19 oct. 2024, 12:50:02 p. m.
    Author     : Micha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recuperar Contraseña</title>
    <link rel="stylesheet" href="../css/styles3.css">
</head>
<body>
    <div id="fondo-recuperar-usuario"></div>
    <header id="encabezado-recuperar-usuario">
        <div id="izquierda-recuperar-usuario">
            <a href="/index.html">
                <img src="../assets/LogoByL.png" alt="Logo" id="logo-recuperar-usuario">
            </a>
            <h1>Barbería ByL</h1>
        </div>
        <div id="derecha-recuperar-usuario">
            <button type="button" id="boton-encabezado-recuperar-usuario" onclick="window.location.href='../login_usuario.jsp'">Ya tengo cuenta</button>
            <a href="registrate_usuario.html" id="registrarse-encabezado-recuperar-usuario">No tienes cuenta?</a>
        </div>
    </header>

    <main id="cuerpo-recuperar-usuario">
        <div id="cuadro1-recuperar-usuario">
            <h2 id="titulo-cuadro1-recuperar-usuario">¡Tranquilo SOBRINO!</h2>
            <p id="instruccion-cuadro1-recuperar-usuario">En breves podrás recuperar tu contraseña</p>
            <p>Ingresa tu correo electrónico</p>
            <input type="email" id="correo-recuperar-usuario" placeholder="Ingresa tu correo electrónico" required>
            <button type="button" id="boton-recuperar-correo">Recuperar</button>
            <p>o</p>
            <p>Ingresa tu número de celular</p>
            <input type="number" id="celular-recuperar-usuario" placeholder="Ingresa tu número de celular" required>
            <button type="button" id="boton-recuperar-celular">Recuperar</button>
        </div>
        <div id="cuadro2-recuperar-usuario">
            <h2 id="titulo-cuadro2-recuperar-usuario">¡Únete y Ahorra en tu Primer Corte!</h2>
            <p id="descripcion-cuadro2-recuperar-usuario">Regístrate y disfruta de un 15% de descuento en tu primera visita. Solo para miembros registrados. ¡No te lo pierdas!</p>
            <a href="/index.jsp"><img src="../assets/LogoByL.png" alt="Logo" id="logo-cuadro2-recuperar-usuario"></a>
        </div>
    </main>
    
</body>
</html>

