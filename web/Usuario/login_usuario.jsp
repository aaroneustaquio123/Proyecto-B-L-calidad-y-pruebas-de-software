<%-- 
    Document   : login_usuario
    Created on : 19 oct. 2024, 12:52:36 p. m.
    Author     : Micha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicia tu Sesión</title>
    <link rel="stylesheet" href="./css/styles3.css">
</head>
<body>
    <div id="fondo-login-usuario"></div>
    <main id="cuerpo-login-usuario">
        <div id="cuadro1-login-usuario">
            <h2 id="titulo-cuadro1-login-usuario">Iniciar sesión</h2>
          <form action="/Proyecto-Barberia-BYL/LoginServlet
" id="formulario-cuadro1-login-usuario" method="post">
              
                <div class="campo-formulario-login-usuario">
                    <label for="correo-cuadro1-login-usuario">Correo Electrónico:</label>
                    <input type="email" id="correo-cuadro1-login-usuario" name="email" placeholder="Ingresa tu correo">
                </div>
                <div class="campo-formulario-login-usuario">
                    <label for="password-cuadro1-login-usuario">Contraseña:</label>
                    <input type="password" id="password-cuadro1-login-usuario" name="contraseña" placeholder="Ingresa tu contraseña">
                </div>
               <button type="submit" id="boton-cuadro1-login-usuario">Entrar</button>
         
                <a href="pages/recuperar_usuario.jsp" id="olvide-password-cuadro1-login-usuario">¿Olvidaste tu contraseña?</a>
            </form>
        </div>
        <div id="cuadro2-login-usuario">
            <h2 id="titulo-cuadro2-login-usuario">¿Aún no tienes una cuenta?</h2>
            <p id="descripcion-cuadro2-login-usuario">Regístrate para que puedas iniciar sesión</p>
            <button id="boton-cuadro2-login-usuario" onclick="window.location.href='pages/registrate_usuario.jsp'">Regístrate</button>
        </div>
    </main>
</body>
</html>
