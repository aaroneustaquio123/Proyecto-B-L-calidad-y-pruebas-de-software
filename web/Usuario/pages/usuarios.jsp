<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Users.UsuarioDAO, Users.Usuario, java.util.LinkedList" %>
<%
    // Obtenemos la lista de usuarios desde el DAO
    UsuarioDAO usuarioDAO = new UsuarioDAO();
    LinkedList<Usuario> usuarios = usuarioDAO.list();
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Usuarios</title>
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

        .card-form {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            padding: 30px;
            margin-bottom: 20px;
        }

        .table-users {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
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
                        <a href="../../Usuario/pages/usuarios.jsp" class="nav-link active">
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
                        <a href="../../Administrador/pages/productos.jsp" class="nav-link">
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
                <div class="container-fluid">
                    <h1 class="my-4">Gestión de Usuarios</h1>

                    <!-- User Creation Form -->
                    <div class="card-form">
                        <h2 class="mb-4">Crear Nuevo Usuario</h2>
                        <form action="/Proyecto-Barberia-BYL/UsuarioServlet" method="post">
                            <input type="hidden" name="accion" value="crear">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Nombres</label>
                                    <input type="text" name="nombres" class="form-control" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Apellidos</label>
                                    <input type="text" name="apellidos" class="form-control" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Correo Electrónico</label>
                                    <input type="email" name="correo" class="form-control" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Número de Teléfono</label>
                                    <input type="text" name="numero" class="form-control" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Contraseña</label>
                                    <input type="password" name="contraseña" class="form-control" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label">Género</label>
                                    <select name="genero" class="form-select" required>
                                        <option value="Masculino">Masculino</option>
                                        <option value="Femenino">Femenino</option>
                                    </select>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-user-plus"></i> Crear Usuario
                            </button>
                        </form>
                    </div>

                    <!-- User List -->
                    <div class="card table-responsive">
                        <div class="card-header bg-primary text-white">
                            <h2 class="mb-0">Lista de Usuarios</h2>
                        </div>
                        <table class="table table-striped table-hover mb-0">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nombre</th>
                                    <th>Apellido</th>
                                    <th>Correo</th>
                                    <th>Número</th>
                                    <th>Género</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Usuario usuario : usuarios) { %>
                                <tr>
                                    <td><%= usuario.getId() %></td>
                                    <td><%= usuario.getNombre() %></td>
                                    <td><%= usuario.getApellido() %></td>
                                    <td><%= usuario.getEmail() %></td>
                                    <td><%= usuario.getNumero() %></td>
                                    <td><%= usuario.getGenero() %></td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <!-- Editar Usuario -->
                                            <form action="/Proyecto-Barberia-BYL/UsuarioServlet" method="post" class="d-inline">
                                                <input type="hidden" name="accion" value="actualizar">
                                                <input type="hidden" name="id" value="<%= usuario.getId() %>">
                                                <button type="button" class="btn btn-warning btn-action" data-bs-toggle="modal" data-bs-target="#editModal<%= usuario.getId() %>">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                            </form>
                                            
                                            <!-- Eliminar Usuario -->
                                            <form action="/Proyecto-Barberia-BYL/UsuarioServlet" method="post" class="d-inline">
                                                <input type="hidden" name="accion" value="eliminar">
                                                <input type="hidden" name="id" value="<%= usuario.getId() %>">
                                                <button type="submit" class="btn btn-danger btn-action" onclick="return confirm('¿Estás seguro de eliminar este usuario?');">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                                
                                <!-- Modal para editar usuario -->
                                <div class="modal fade" id="editModal<%= usuario.getId() %>" tabindex="-1">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Editar Usuario</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                            </div>
                                            <form action="/Proyecto-Barberia-BYL/UsuarioServlet" method="post">
                                                <div class="modal-body">
                                                    <input type="hidden" name="accion" value="actualizar">
                                                    <input type="hidden" name="id" value="<%= usuario.getId() %>">
                                                    <div class="mb-3">
                                                        <label class="form-label">Nombres</label>
                                                        <input type="text" name="nombres" class="form-control" value="<%= usuario.getNombre() %>" required>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label">Apellidos</label>
                                                        <input type="text" name="apellidos" class="form-control" value="<%= usuario.getApellido() %>" required>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label">Correo</label>
                                                        <input type="email" name="correo" class="form-control" value="<%= usuario.getEmail() %>" required>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label">Número</label>
                                                        <input type="text" name="numero" class="form-control" value="<%= usuario.getNumero() %>" required>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label">Nueva Contraseña</label>
                                                        <input type="password" name="contraseña" class="form-control" placeholder="Dejar en blanco si no cambia">
                                                    </div>
                                                    <div class="mb-3">
                                                        <label class="form-label">Género</label>
                                                        <select name="genero" class="form-select" required>
                                                            <option value="Masculino" <%= usuario.getGenero().equals("Masculino") ? "selected" : "" %>>Masculino</option>
                                                            <option value="Femenino" <%= usuario.getGenero().equals("Femenino") ? "selected" : "" %>>Femenino</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                    <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>