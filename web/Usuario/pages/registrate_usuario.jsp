<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Regístrate - Barbería ByL</title>
    <link rel="stylesheet" href="../css/styles3.css">
</head>
<body>
    <div id="fondo-registrate-usuario"></div>
    
    <header id="encabezado-registrate-usuario">
        <div id="izquierda-registrate-usuario">
            <a href="/index.html">
                <img src="../assets/LogoByL.png" alt="Logo de Barbería ByL" id="logo-registrate-usuario">
            </a>
            <h1>Barbería ByL</h1>
        </div>
        
        <div id="derecha-registrate-usuario">
            <form id="formulario-encabezado-registrate-usuario" action="#" method="post">
                <div class="campo-formulario-encabezado-registrate-usuario">
                    <label for="correo-encabezado-registrate-usuario">Correo Electrónico:</label>
                    <input type="email" id="correo-encabezado-registrate-usuario" name="correo-login" placeholder="Ingresa tu correo" required>
                </div>
                
                <div class="campo-formulario-encabezado-registrate-usuario">
                    <label for="password-encabezado-registrate-usuario">Contraseña:</label>
                    <input type="password" id="password-encabezado-registrate-usuario" name="password-login" placeholder="Ingresa tu contraseña" required>
                </div>
                
                <div id="botones-encabezado-registrate-usuario">
                    <button type="submit" id="boton-encabezado-registrate-usuario">Entrar</button>
                    <a href="recuperar_usuario.html" id="olvide-password-encabezado-registrate-usuario">¿Olvidaste tu contraseña?</a>
                </div>
            </form>
        </div>
    </header>

    <main id="cuerpo-registrate-usuario">
        <div id="cuadro1-registrate-usuario">
            <h2 id="titulo-cuadro1-registrate-usuario">Regístrate</h2>
            
            <form 
                action="/Proyecto-Barberia-BYL/UsuarioServlet" 
                id="formulario-cuadro1-registrate-usuario" 
                method="post"
                onsubmit="return validateForm()"
            >
                <input type="hidden" name="accion" value="crear">
                
                <div class="nombre-completo">
                    <input 
                        type="text" 
                        id="nombres-registrate-usuario" 
                        name="nombres" 
                        placeholder="Nombres" 
                        required 
                        pattern="[A-Za-zÁáÉéÍíÓóÚú\s]+" 
                        title="Solo se permiten letras"
                    >
                    <input 
                        type="text" 
                        id="apellidos-registrate-usuario" 
                        name="apellidos" 
                        placeholder="Apellidos" 
                        required 
                        pattern="[A-Za-zÁáÉéÍíÓóÚú\s]+" 
                        title="Solo se permiten letras"
                    >
                </div>
                
                <input 
                    type="email" 
                    id="correo-registrate-usuario" 
                    name="correo" 
                    placeholder="Correo Electrónico" 
                    required
                >
                
                <input 
                    type="tel" 
                    id="celular-registrate-usuario" 
                    name="numero" 
                    placeholder="Número de celular" 
                    required 
                    pattern="[0-9]{10}" 
                    title="Ingresa un número de 10 dígitos"
                >
                
                <input 
                    type="password" 
                    id="password-registrate-usuario" 
                    name="contraseña" 
                    placeholder="Contraseña" 
                    required 
                    minlength="8" 
                    title="La contraseña debe tener al menos 8 caracteres"
                >
                
                <select id="genero-registrate-usuario" name="genero" required>
                    <option value="" disabled selected>--Seleccionar Género--</option>
                    <option value="mujer">Mujer</option>
                    <option value="varon">Varón</option>
                    <option value="no_decirlo">Prefiero no decirlo</option>
                </select>
                
                <button 
                    type="submit" 
                    id="boton-cuadro1-registrate-usuario"
                >
                    Registrarse
                </button>
            </form>
        </div>
        
        <div id="cuadro2-registrate-usuario">
            <h2 id="titulo-cuadro2-registrate-usuario">¡Únete y Ahorra en tu Primer Corte!</h2>
            <p id="descripcion-cuadro2-registrate-usuario">
                Regístrate y disfruta de un 15% de descuento en tu primera visita. 
                Solo para miembros registrados. ¡No te lo pierdas!
            </p>
            <a href="../../index.jsp">
                <img src="../assets/LogoByL.png" alt="Logo" id="logo-cuadro2-registrate-usuario">
            </a>
        </div>
    </main>

    <script>
    function validateForm() {
        const email = document.getElementById('correo-registrate-usuario').value;
        const phone = document.getElementById('celular-registrate-usuario').value;
        const password = document.getElementById('password-registrate-usuario').value;

        // Email validation
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            alert('Por favor, ingresa un correo electrónico válido.');
            return false;
        }

        // Phone validation (10 digits)
        const phoneRegex = /^[0-9]{10}$/;
        if (!phoneRegex.test(phone)) {
            alert('Por favor, ingresa un número de celular válido de 10 dígitos.');
            return false;
        }

        // Password strength (at least 8 characters, mix of uppercase, lowercase, and numbers)
        const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
        if (!passwordRegex.test(password)) {
            alert('La contraseña debe tener al menos 8 caracteres, incluyendo mayúsculas, minúsculas y números.');
            return false;
        }

        return true;
    }
    </script>
</body>
</html>