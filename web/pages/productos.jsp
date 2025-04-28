<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Productos | Barbería B&L</title>
    <link rel="stylesheet" href="../css-1/style1.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .producto-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 20px;
            padding: 20px;
        }
        .producto-box {
            width: 240px; 
            text-align: center;
            background-color: #333;
            color: white;
            border-radius: 10px;
            padding: 20px; 
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .producto-box img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
        }
        .producto-box p {
            margin: 10px 0;
            font-weight: bold;
            font-size: 16px; 
        }
        .producto-box button {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 12px 20px; 
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            margin-top: 15px;
        }
        .producto-box button:hover {
            background-color: #218838;
        }
    </style>
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
        <div class="producto-container">
            <!-- Fila 1 -->
            <div class="producto-box">
                <img src="../assets/servicios-producto1.png" alt="Producto 1">
                <p>NOMBRE DEL PRODUCTO 1</p>
                <form action="/Proyecto-Barberia-BYL/CarritoServlet" method="post">
                    <input type="hidden" name="idProducto" value="1">
                    <input type="hidden" name="nombre" value="NOMBRE DEL PRODUCTO 1">
                    <input type="hidden" name="precio" value="10.00">
                    <button type="submit">Añadir al carrito</button>
                </form>
            </div>
            <div class="producto-box">
                <img src="../assets/servicios-producto2.png" alt="Producto 2">
                <p>NOMBRE DEL PRODUCTO 2</p>
                <form action="/Proyecto-Barberia-BYL/CarritoServlet" method="post">
                    <input type="hidden" name="idProducto" value="2">
                    <input type="hidden" name="nombre" value="NOMBRE DEL PRODUCTO 2">
                    <input type="hidden" name="precio" value="20.00">
                    <button type="submit">Añadir al carrito</button>
                </form>
            </div>
            <div class="producto-box">
                <img src="../assets/servicios-producto3.png" alt="Producto 3">
                <p>NOMBRE DEL PRODUCTO 3</p>
                <form action="/Proyecto-Barberia-BYL/CarritoServlet" method="post">
                    <input type="hidden" name="idProducto" value="3">
                    <input type="hidden" name="nombre" value="NOMBRE DEL PRODUCTO 3">
                    <input type="hidden" name="precio" value="30.00">
                    <button type="submit">Añadir al carrito</button>
                </form>
            </div>
            <div class="producto-box">
                <img src="../assets/servicios-producto4.png" alt="Producto 4">
                <p>NOMBRE DEL PRODUCTO 4</p>
                <form action="/Proyecto-Barberia-BYL/CarritoServlet" method="post">
                    <input type="hidden" name="idProducto" value="4">
                    <input type="hidden" name="nombre" value="NOMBRE DEL PRODUCTO 4">
                    <input type="hidden" name="precio" value="40.00">
                    <button type="submit">Añadir al carrito</button>
                </form>
            </div>
            <div class="producto-box">
                <img src="../assets/servicios-producto5.png" alt="Producto 5">
                <p>NOMBRE DEL PRODUCTO 5</p>
                <form action="/Proyecto-Barberia-BYL/CarritoServlet" method="post">
                    <input type="hidden" name="idProducto" value="5">
                    <input type="hidden" name="nombre" value="NOMBRE DEL PRODUCTO 5">
                    <input type="hidden" name="precio" value="50.00">
                    <button type="submit">Añadir al carrito</button>
                </form>
            </div>
            <!-- Fila 2 -->
            <div class="producto-box">
                <img src="../assets/servicios-producto6.png" alt="Producto 6">
                <p>NOMBRE DEL PRODUCTO 6</p>
                <form action="/Proyecto-Barberia-BYL/CarritoServlet" method="post">
                    <input type="hidden" name="idProducto" value="6">
                    <input type="hidden" name="nombre" value="NOMBRE DEL PRODUCTO 6">
                    <input type="hidden" name="precio" value="60.00">
                    <button type="submit">Añadir al carrito</button>
                </form>
            </div>
            <div class="producto-box">
                <img src="../assets/servicios-producto7.png" alt="Producto 7">
                <p>NOMBRE DEL PRODUCTO 7</p>
                <form action="/Proyecto-Barberia-BYL/CarritoServlet" method="post">
                    <input type="hidden" name="idProducto" value="7">
                    <input type="hidden" name="nombre" value="NOMBRE DEL PRODUCTO 7">
                    <input type="hidden" name="precio" value="70.00">
                    <button type="submit">Añadir al carrito</button>
                </form>
            </div>
            <div class="producto-box">
                <img src="../assets/servicios-producto8.png" alt="Producto 8">
                <p>NOMBRE DEL PRODUCTO 8</p>
                <form action="/Proyecto-Barberia-BYL/CarritoServlet" method="post">
                    <input type="hidden" name="idProducto" value="8">
                    <input type="hidden" name="nombre" value="NOMBRE DEL PRODUCTO 8">
                    <input type="hidden" name="precio" value="80.00">
                    <button type="submit">Añadir al carrito</button>
                </form>
            </div>
            <div class="producto-box">
                <img src="../assets/servicios-producto9.png" alt="Producto 9">
                <p>NOMBRE DEL PRODUCTO 9</p>
                <form action="/Proyecto-Barberia-BYL/CarritoServlet" method="post">
                    <input type="hidden" name="idProducto" value="9">
                    <input type="hidden" name="nombre" value="NOMBRE DEL PRODUCTO 9">
                    <input type="hidden" name="precio" value="90.00">
                    <button type="submit">Añadir al carrito</button>
                </form>
            </div>
            <div class="producto-box">
                <img src="../assets/servicios-producto10.png" alt="Producto 10">
                <p>NOMBRE DEL PRODUCTO 10</p>
                <form action="/Proyecto-Barberia-BYL/CarritoServlet" method="post">
                    <input type="hidden" name="idProducto" value="10">
                    <input type="hidden" name="nombre" value="NOMBRE DEL PRODUCTO 10">
                    <input type="hidden" name="precio" value="100.00">
                    <button type="submit">Añadir al carrito</button>
                </form>
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
