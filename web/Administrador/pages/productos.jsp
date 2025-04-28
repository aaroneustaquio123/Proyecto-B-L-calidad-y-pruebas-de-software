<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Users.ProductoDAO, Users.Producto, java.util.LinkedList" %>
<%
    // Obtenemos la lista de productos desde el DAO
    ProductoDAO productoDAO = new ProductoDAO();
    LinkedList<Producto> productos = productoDAO.list();

    // Obtener el producto a editar (si existe)
    Producto productoEditar = null;
    String idEditar = request.getParameter("idEditar");
    if (idEditar != null && !idEditar.isEmpty()) {
        for (Producto p : productos) {
            if (p.getId() == Integer.parseInt(idEditar)) {
                productoEditar = p;
                break;
            }
        }
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Productos</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2ecc71;
            --light-bg: #f4f6f7;
        }

        body {
            background-color: var(--light-bg);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .sidebar {
            background-color: #2c3e50;
            color: white;
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            transition: all 0.3s;
        }

        .sidebar .nav-link {
            color: rgba(255,255,255,0.7);
            transition: all 0.3s;
            padding: 15px;
        }

        .sidebar .nav-link:hover {
            background-color: rgba(255,255,255,0.1);
            color: white;
        }

        .sidebar img {
            max-width: 30px;
            margin-right: 10px;
        }

        .main-content {
            margin-left: 250px;
            padding: 20px;
            background-color: var(--light-bg);
            min-height: 100vh;
        }

        .card-form, .table-users {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }

        .card-form {
            padding: 30px;
        }

        .table-users thead {
            background-color: var(--primary-color);
            color: white;
        }

        .btn-action {
            margin: 0 5px;
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 80px;
            }
            .main-content {
                margin-left: 80px;
            }
            .sidebar .nav-link span {
                display: none;
            }
        }

        .form-label {
            font-weight: bold;
        }

        .form-control {
            margin-bottom: 15px;
        }

        .btn-action {
            margin: 0 5px;
        }

        .table th, .table td {
            padding: 12px;
            text-align: center;
        }

        .card-header {
            background-color: var(--primary-color);
            color: white;
            padding: 10px 15px;
            border-radius: 10px 10px 0 0;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
             <!-- Sidebar -->
            <div class="col-md-2 sidebar">
                <div class="logo text-center my-4">
                    <img src="../../Administrador/img/barber-logo.jpg" alt="Logo" class="img-fluid rounded-circle" style="width: 80px;">
                </div>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a href="../../Administrador/pages/citas.jsp" class="nav-link">
                            <i class="fas fa-calendar"></i> <span>Citas</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="../../Usuario/pages/usuarios.jsp" class="nav-link">
                            <i class="fas fa-users"></i> <span>Usuarios</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="../../Administrador/pages/proveedor.jsp" class="nav-link">
                            <i class="fas fa-store"></i> <span>Proveedores</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="../../Administrador/pages/servicio.jsp" class="nav-link">
                            <i class="fas fa-concierge-bell"></i> <span>Servicios</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="../../Administrador/pages/productos.jsp" class="nav-link active">
                            <i class="fas fa-box"></i> <span>Productos</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="../../Administrador/pages/empleado.jsp" class="nav-link">
                            <i class="fas fa-users-cog"></i> <span>Empleados</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="../../Administrador/pages/boletas.jsp" class="nav-link">
                            <i class="fas fa-receipt"></i> <span>Boletas</span>
                        </a>
                    </li>
                    <li class="nav-item mt-5">
                        <a href="../../Frame-login-general/Frame-login-generaal.jsp" class="nav-link">
                            <i class="fas fa-sign-out-alt"></i> <span>Salir</span>
                        </a>
                    </li>
                </ul>
            </div>

            <!-- Main Content -->
            <div class="col-md-10 main-content">
                <h1 class="my-4">Gestión de Productos</h1>
                
                <!-- Botón para reporte de servicios -->
<div class="mb-4">
    <a href="reportedeproductosmassolicitados.jsp" class="btn btn-secondary">
        <i class="fas fa-file-pdf"></i> Ver Reporte de Servicios
    </a>
</div>
                <!-- Formulario para crear/editar producto -->
                <div class="card-form">
                    <h2 class="mb-4">
                        <%= (productoEditar != null) ? "Editar Producto" : "Crear Producto" %>
                    </h2>
                    <form action="/Proyecto-Barberia-BYL/ProductoServlet" method="post">
                        <input type="hidden" name="accion" value="<%= (productoEditar != null) ? "actualizar" : "crear" %>">
                        
                        <% if (productoEditar != null) { %>
                            <input type="hidden" name="id" value="<%= productoEditar.getId() %>">
                        <% } %>
                        
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Nombre</label>
                                <input type="text" name="nombre" class="form-control" 
                                       value="<%= (productoEditar != null) ? productoEditar.getNombre() : "" %>" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Descripción</label>
                                <textarea name="descripcion" class="form-control" required><%= (productoEditar != null) ? productoEditar.getDescripcion() : "" %></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Precio</label>
                                <input type="number" name="precio" class="form-control" step="0.01" 
                                       value="<%= (productoEditar != null) ? productoEditar.getPrecio() : "" %>" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Cantidad</label>
                                <input type="number" name="stock" class="form-control" 
                                       value="<%= (productoEditar != null) ? productoEditar.getStock() : "" %>" required>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Sede</label><br>
                            <input type="radio" name="sede" value="Sede 1" 
                                   <%= (productoEditar != null && productoEditar.getSede().equals("Sede 1")) ? "checked" : "" %> required> Sede 1<br>
                            <input type="radio" name="sede" value="Sede 2" 
                                   <%= (productoEditar != null && productoEditar.getSede().equals("Sede 2")) ? "checked" : "" %> required> Sede 2<br>
                            <input type="radio" name="sede" value="Sede 3" 
                                   <%= (productoEditar != null && productoEditar.getSede().equals("Sede 3")) ? "checked" : "" %> required> Sede 3<br>
                        </div>
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save"></i> <%= (productoEditar != null) ? "Actualizar" : "Crear" %> Producto
                        </button>
                        <% if (productoEditar != null) { %>
                            <a href="productos.jsp" class="btn btn-secondary ml-2">
                                <i class="fas fa-times"></i> Cancelar
                            </a>
                        <% } %>
                    </form>
                </div>

                <!-- Tabla de productos -->
                <div class="card table-responsive">
                    <div class="card-header">
                        <h2 class="mb-0">Lista de Productos</h2>
                    </div>
                    <table class="table table-striped table-hover mb-0">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Descripción</th>
                                <th>Precio</th>
                                <th>Cantidad</th>
                                <th>Sede</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Producto producto : productos) { %>
                            <tr>
                                <td><%= producto.getId() %></td>
                                <td><%= producto.getNombre() %></td>
                                <td><%= producto.getDescripcion() %></td>
                                <td><%= producto.getPrecio() %></td>
                                <td><%= producto.getStock() %></td>
                                <td><%= producto.getSede() %></td>
                                <td>
                                    <div class="btn-group" role="group">
                                        <!-- Editar Producto -->
                                        <a href="productos.jsp?idEditar=<%= producto.getId() %>" class="btn btn-warning btn-action">
                                            <i class="fas fa-edit"></i>
                                        </a>

                                        <!-- Eliminar Producto -->
                                        <form action="/Proyecto-Barberia-BYL/ProductoServlet" method="post" class="d-inline">
                                            <input type="hidden" name="accion" value="eliminar">
                                            <input type="hidden" name="id" value="<%= producto.getId() %>">
                                            <button type="submit" class="btn btn-danger btn-action" onclick="return confirm('¿Estás seguro de eliminar este producto?');">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>