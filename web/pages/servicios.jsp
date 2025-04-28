<%-- 
    Document   : servicios
    Created on : 19 oct. 2024, 10:40:47 a. m.
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
    
    <main class="container my-5">
        <div class="row">
            <section class="col-lg-4 col-md-6 servicios-box">
                <h2>Servicios Principales</h2>

                <!-- Corte de Cabello -->
                <div class="servicio-item">
                    <h4>Corte de Cabello</h4>
                    <div id="carruselCorteCabello" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="../assets/CorteDeCabello1.png" class="d-block w-100" alt="Corte de Cabello 1">
                            </div>
                            <div class="carousel-item">
                                <img src="../assets/CorteDeCabello2.png" class="d-block w-100" alt="Corte de Cabello 2">
                            </div>
                            <div class="carousel-item">
                                <img src="../assets/CorteDeCabello3.png" class="d-block w-100" alt="Corte de Cabello 3">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carruselCorteCabello" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Anterior</span>
                        </a>
                        <a class="carousel-control-next" href="#carruselCorteCabello" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Siguiente</span>
                        </a>
                    </div>
                </div>

                <!-- Afeitado Clásico -->
                <div class="servicio-item">
                    <h4>Afeitado Clásico</h4>
                    <div id="carruselAfeitadoClasico" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="../assets/AfeitadoClasico1.png" class="d-block w-100" alt="Afeitado Clásico 1">
                            </div>
                            <div class="carousel-item">
                                <img src="../assets/AfeitadoClasico2.png" class="d-block w-100" alt="Afeitado Clásico 2">
                            </div>
                            <div class="carousel-item">
                                <img src="../assets/AfeitadoClasico3.png" class="d-block w-100" alt="Afeitado Clásico 3">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carruselAfeitadoClasico" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Anterior</span>
                        </a>
                        <a class="carousel-control-next" href="#carruselAfeitadoClasico" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Siguiente</span>
                        </a>
                    </div>
                </div>

                <!-- Arreglo de Barba -->
                <div class="servicio-item">
                    <h4>Arreglo de Barba</h4>
                    <div id="carruselArregloBarba" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="../assets/arreglodebarba1.png" class="d-block w-100" alt="Arreglo de Barba 1">
                            </div>
                            <div class="carousel-item">
                                <img src="../assets/arreglodebarba2.png" class="d-block w-100" alt="Arreglo de Barba 2">
                            </div>
                            <div class="carousel-item">
                                <img src="../assets/arreglodebarba3.png" class="d-block w-100" alt="Arreglo de Barba 3">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carruselArregloBarba" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Anterior</span>
                        </a>
                        <a class="carousel-control-next" href="#carruselArregloBarba" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Siguiente</span>
                        </a>
                    </div>
                </div>
            </section>

            <!-- Caja 2: Estilismo Personalizado -->
            <section class="col-lg-4 col-md-6 servicios-box">
                <h2>Estilismo Personalizado</h2>
                <div style="display: flex; flex-direction: column; align-items: center; margin-top: 50px;" >
                    <img style="margin: 10px" src="../assets/servicios-estilos1.png" class="rounded-circle img-fluid" alt="Estilo 1">
                    <img style="margin: 10px" src="../assets/servicios-estilos2.png" class="rounded-circle img-fluid" alt="Estilo 2">
                    <img style="margin: 10px" src="../assets/servicios-estilos1.png" class="rounded-circle img-fluid" alt="Estilo 3">
                    <img style="margin: 10px" src="../assets/servicios-estilos2.png" class="rounded-circle img-fluid" alt="Estilo 4">
                </div>
            </section>

            <!-- Caja 3: Tratamientos Especiales -->
            <section class="col-lg-4 col-md-12 servicios-box" >
                <h2>Tratamientos Especiales</h2>
                <div class="images-servicios-grid" style="display: flex; flex-direction: column; align-items: center; margin-top: 50px;" >
                    <img style="margin: 10px" src="../assets/servicios-tratamientos1.png" class="img-fluid" alt="Tratamiento 1">
                    <img style="margin: 10px" src="../assets/servicios-tratamiento2.png" class="img-fluid" alt="Tratamiento 2">
                </div>
            </section>
        </div>
    </main>

    <!-- Footer -->
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

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
