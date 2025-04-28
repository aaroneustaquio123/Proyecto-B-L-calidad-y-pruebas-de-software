<%-- 
    Document   : sedes
    Created on : 19 oct. 2024, 10:59:06 a. m.
    Author     : Micha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Servicios | Barbería B&L</title>
    <link rel="stylesheet" href="../css-1/style1.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
  <header style="display: flex; flex-direction: row;">  
        <div class="logo">
            <img src="../assets/logo.png" alt="Barbería B&L Logo">
            <h1 style="font-size: 35px !important;">Barbería B&L</h1>
        </div>
        <nav>
            <ul>
                <li><a href="../index_user.jsp">Inicio</a></li>
                <li><a href="../pages/servicios.jsp">Servicios</a></li>
                <li><a href="../pages/productos.jsp">Productos</a></li>
                <li><a href="../pages/sedes.jsp">Sedes</a></li>
                <li><a href="../pages/reservas.jsp">Reservas</a></li>
            </ul>
        </nav>
      <div style="display: flex; flex-direction: row;" class="user-icon">
            <a href="../index.jsp"><h5>Cerrar Sesión</h5></a>
            <img src="../assets/user-icon.png" alt="User Icon">
        </div>
    </header>
    <main>
        <div class="sedes-container">
            <div class="sedes-box">
                <h2>SAN JUAN DE LURIGANCHO</h2>
                <div class="images-sedes-grid">
                    <img src="../assets/sede-san juan de lurigancho (2).png" alt="SAN JUAN DE LURIGANCHO">
                </div>
                <p>Av. Del Parque, Canto Rey 1 Etapa, San Juan de Lurigancho, Lima</p>
                <a href="#" class="map-link">Ver en el mapa</a>
            </div>
            <div class="sedes-box">
                <h2>SAN ISIDRO</h2>
                <div class="images-sedes-grid">
                    <img src="../assets/sede-san isidro.png" alt="SAN ISIDRO">
                </div>
                <p>Av. José Carlos Mariátegui 2596, San Isidro, Lima</p>
                <a href="#" class="map-link">Ver en el mapa</a>
            </div>
            <div class="sedes-box">
                <h2>EL AGUSTINO</h2>
                <div class="images-sedes-grid">
                    <img src="../assets/sede-el agustino.png" alt="EL AGUSTINO">
                </div>
                <p>C. Las Agatas 200-290, El Agustino, Lima</p>
                <a href="#" class="map-link">Ver en el mapa</a>
            </div>
        </div>
    </main>
    <footer>
        <div class="footer-content">
            <div class="footer-left">
                <p>Contacto: +51 997 259 085 / +51 950 758 586</p>
                <p>Dirección: Cdr 3. Calle Teselia, San Carlos, San Juan de Lurigancho</p>
                <p>Teléfono: (123) 456-7890</p>
            </div>
            <div class="footer-right">
                <p>Cancelaciones con 24 horas de anticipación.</p>
                <p>Reembolsos no disponibles.</p>
                <p>Diseño web: "Los Terreneitor de San Carlos"</p>
            </div>
        </div>
        <div class="copyright">
            <p>© 2024 Barbería B&L. Todos los derechos reservados.</p>
        </div>
    </footer>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
