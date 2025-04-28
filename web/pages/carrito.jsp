<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList, java.util.HashMap"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrito de Compras</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .carrito-container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #f4f4f4;
        }
        .btn {
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-danger {
            background-color: #dc3545;
            color: white;
        }
        .btn-danger:hover {
            background-color: #c82333;
        }
        .btn-success {
            background-color: #28a745;
            color: white;
        }
        .btn-success:hover {
            background-color: #218838;
        }
        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }
        .btn-secondary:hover {
            background-color: #5a6268;
        }
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
        }
        .modal-content {
            background-color: white;
            margin: 15% auto;
            padding: 20px;
            border-radius: 10px;
            width: 30%;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }
        .close:hover, .close:focus {
            color: black;
        }
    </style>
</head>
<body>
    <div class="carrito-container">
        <h1>Carrito de Compras</h1>
        <table>
            <thead>
                <tr>
                    <th>Nombre del Producto</th>
                    <th>Precio</th>
                    <th>Acción</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    // Obtener el carrito de la sesión
                    ArrayList<HashMap<String, Object>> carrito = (ArrayList<HashMap<String, Object>>) session.getAttribute("carrito");
                    if (carrito != null && !carrito.isEmpty()) {
                        for (HashMap<String, Object> producto : carrito) {
                %>
                    <tr>
                        <td><%= producto.get("nombre") %></td>
                        <td>S/ <%= producto.get("precio") %></td>
                        <td>
                            <form action="/Proyecto-Barberia-BYL/CarritoServlet" method="post">
                                <input type="hidden" name="accion" value="eliminar">
                                <input type="hidden" name="idProducto" value="<%= producto.get("idProducto") %>">
                                <button type="submit" class="btn btn-danger">Eliminar</button>
                            </form>
                        </td>
                    </tr>
                <% 
                        }
                    } else { 
                %>
                    <tr>
                        <td colspan="3">El carrito está vacío.</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
        <div style="margin-top: 20px; text-align: center;">
            <!-- Botón para regresar a productos.jsp -->
            <form action="productos.jsp" method="get" style="display: inline;">
                <button type="submit" class="btn btn-secondary">Regresar y Seguir Comprando</button>
            </form>

            <!-- Botón para mostrar el modal -->
            <button class="btn btn-success" id="comprarAhoraBtn">Comprar Ahora</button>
        </div>
    </div>

    <!-- Modal de confirmación -->
    <div id="compraModal" class="modal">
        <div class="modal-content">
            <span class="close" id="closeModal">&times;</span>
            <h2>¡Gracias por tu compra!</h2>
            <p>Tu pedido ha sido procesado con éxito.</p>
            <form action="productos.jsp" method="get">
                <button type="submit" class="btn btn-success">Volver a Productos</button>
            </form>
        </div>
    </div>

    <script>
        // Obtener elementos del DOM
        const comprarAhoraBtn = document.getElementById("comprarAhoraBtn");
        const compraModal = document.getElementById("compraModal");
        const closeModal = document.getElementById("closeModal");

        // Mostrar el modal
        comprarAhoraBtn.addEventListener("click", () => {
            compraModal.style.display = "block";
        });

        // Cerrar el modal
        closeModal.addEventListener("click", () => {
            compraModal.style.display = "none";
        });

        // Cerrar el modal al hacer clic fuera de él
        window.addEventListener("click", (event) => {
            if (event.target === compraModal) {
                compraModal.style.display = "none";
            }
        });
    </script>
</body>
</html>
