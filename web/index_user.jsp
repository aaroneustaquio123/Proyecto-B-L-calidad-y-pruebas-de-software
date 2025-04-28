<%-- 
    Document   : index
    Created on : 19 oct. 2024, 10:14:33 a. m.
    Author     : Micha
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Barbería B&L</title>
        <link rel="stylesheet" href="./css-1/style1.css">
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <header style="display: flex; flex-direction: row;">  
            <div class="logo">
                <img src="./assets/logo.png" alt="Barbería B&L Logo">
                <h1 style="font-size: 35px !important;">Barbería B&L</h1>
            </div>
            <nav>
                <ul>
                    <li><a href="#">Inicio</a></li>
                    <li><a href="./pages/servicios.jsp">Servicios</a></li>
                    <li><a href="./pages/productos.jsp">Productos</a></li>
                    <li><a href="./pages/sedes.jsp">Sedes</a></li>
                    <li><a href="./pages/reservas.jsp">Reservas</a></li>
                </ul>
            </nav>
            <div style="display: flex; flex-direction: row;" class="user-icon">
                <a href="./index.jsp"><h5>Cerrar Sesión</h5></a>
                <img src="./assets/user-icon.png" alt="User Icon">
            </div>
        </header>

        <main>

            <div style="width: 100%; display: flex; flex-direction: row;">
                <div style="width: 35%; align-items: center;">
                    <div class="col-md-12" id="left_section_index_1">
                        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="./assets/imagen menu1.png" class="d-block w-100" alt="Imagen 1">
                                </div>
                                <div class="carousel-item">
                                    <img src="./assets/imagen menu2.png" class="d-block w-100" alt="Imagen 2">
                                </div>
                                <div class="carousel-item">
                                    <img src="./assets/imagen menu3.png" class="d-block w-100" alt="Imagen 3">
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                </div>

                <div style="width: 65%; align-items: center; padding: 40px;">
                    <div class="content" id="content_index_1">
                        <h2 class="title">En Barbería B&L</h2>
                        <p  style="text-align: justify" class="large-text">
                            En Barbería B&L, entendemos que un buen corte de cabello es mucho más que solo una cuestión de apariencia; 
                            es una experiencia que refleja tu estilo y personalidad. Desde nuestra apertura, nos hemos dedicado a brindar 
                            un servicio de calidad excepcional, combinando técnicas tradicionales con las últimas tendencias en moda masculina. 
                            Nuestro equipo está compuesto por barberos altamente capacitados que se apasionan por su arte y se esfuerzan 
                            por superar las expectativas de cada cliente que cruza nuestra puerta.
                        </p>
                        <p style="text-align: justify"  class="large-text">
                            Además, nos comprometemos a usar solo productos de la más alta calidad, cuidadosamente seleccionados para 
                            cuidar de tu cabello y piel. Ya sea que busques un estilo clásico o algo más moderno y atrevido, nuestro equipo 
                            está aquí para ayudarte a encontrar el look perfecto para ti.
                        </p>
                    </div>
                    <div style="display:flex; flex-direction: row; align-items: center; justify-content: space-around; width: 100%; background-color: #f2f2f2; padding: 40px; border-radius: 15px;">

                        <div class="servicio-item" style="width: 40%">
                            <h4>Corte de Cabello</h4>
                            <div id="carruselCorteCabello" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="./assets/CorteDeCabello1.png" class="d-block w-100" alt="Corte de Cabello 1">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="./assets/CorteDeCabello2.png" class="d-block w-100" alt="Corte de Cabello 2">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="./assets/CorteDeCabello3.png" class="d-block w-100" alt="Corte de Cabello 3">
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

                        <div class="servicio-item" style="width: 40%">
                            <h4>Afeitado Clásico</h4>
                            <div id="carruselAfeitadoClasico" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="./assets/AfeitadoClasico1.png" class="d-block w-100" alt="Afeitado Clásico 1">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="./assets/AfeitadoClasico2.png" class="d-block w-100" alt="Afeitado Clásico 2">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="./assets/AfeitadoClasico3.png" class="d-block w-100" alt="Afeitado Clásico 3">
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

                    </div>

                </div>          


            </div>

            <div style="width: 100%; display: flex; flex-direction: row; background-color: #f2f2f2; margin-top: 30px;  margin-bottom: 30px; border-radius:15px;">
                <div style="width: 35%; align-items: center; justify-items: center; margin: auto;">
                    <h1>Nuestros</h1>
                    <h1>Productos</h1>
                    <h1>OwO</h1>
                </div>

                <div style="width: 65%; align-items: center; padding: 20px;">
                    <div style="width: 100%; display: flex; flex-direction: row;" >
                        <div class="producto-box">
                            <img src="./assets/servicios-producto1.png" alt="Producto 1">
                            <p>NOMBRE DEL PRODUCTO 1</p>
                        </div>
                        <div class="producto-box">
                            <img src="./assets/servicios-producto2.png" alt="Producto 2">
                            <p>NOMBRE DEL PRODUCTO 2</p>
                        </div>
                        <div class="producto-box">
                            <img src="./assets/servicios-producto3.png" alt="Producto 3">
                            <p>NOMBRE DEL PRODUCTO 3</p>
                        </div>
                        <div class="producto-box">
                            <img src="./assets/servicios-producto4.png" alt="Producto 4">
                            <p>NOMBRE DEL PRODUCTO 4</p>
                        </div>
                        <div class="producto-box">
                            <img src="./assets/servicios-producto5.png" alt="Producto 5">
                            <p>NOMBRE DEL PRODUCTO 5</p>
                        </div>
                    </div> 
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

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>