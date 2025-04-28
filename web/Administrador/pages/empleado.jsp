<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Users.EmpleadoDAO, Users.Empleado, java.util.LinkedList" %>
<%
    // Obtenemos la lista de empleados desde el DAO
    EmpleadoDAO empleadoDAO = new EmpleadoDAO();
    LinkedList<Empleado> empleados = empleadoDAO.list();
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Empleados</title>
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
                <h1 class="my-4">Gestión de Empleados</h1>
                <div class="mb-4">
    <a href="reportedeespecialidadmasdemandada.jsp" class="btn btn-secondary">
        <i class="fas fa-file-pdf"></i> Ver Reporte de Servicios
    </a>
</div>
                <!-- Formulario para crear empleado -->
                <div class="card-form">
                    <h2 class="mb-4">Crear Empleado</h2>
                    <form action="/Proyecto-Barberia-BYL/EmpleadoServlet" method="post">
                        <input type="hidden" name="accion" value="crear">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Nombre</label>
                                <input type="text" name="nombre" class="form-control" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Apellido</label>
                                <input type="text" name="apellido" class="form-control" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Correo</label>
                                <input type="email" name="correo" class="form-control" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Teléfono</label>
                                <input type="tel" name="telefono" class="form-control" required>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Especialidad</label>
                            <input type="text" name="especialidad" class="form-control" required>
                        </div>
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-plus"></i> Crear Empleado
                        </button>
                    </form>
                </div>

                <!-- Tabla de empleados -->
                <div class="card table-responsive">
                    <div class="card-header bg-primary text-white">
                        <h2 class="mb-0">Lista de Empleados</h2>
                    </div>
                    <table class="table table-striped table-hover mb-0">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Correo</th>
                                <th>Especialidad</th>
                                <th>Teléfono</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Empleado empleado : empleados) { %>
                            <tr>
                                <td><%= empleado.getId() %></td>
                                <td><%= empleado.getNombre() %></td>
                                <td><%= empleado.getApellido() %></td>
                                <td><%= empleado.getCorreo() %></td>
                                <td><%= empleado.getEspecialidad() %></td>
                                <td><%= empleado.getTelefono() %></td>
                                <td>
                                    <div class="btn-group" role="group">
                                        <!-- Botón para Editar Empleado -->
                                        <button type="button" class="btn btn-warning btn-action" data-bs-toggle="modal" data-bs-target="#editModal<%= empleado.getId() %>">
                                            <i class="fas fa-edit"></i>
                                        </button>

                                        <!-- Botón para Eliminar Empleado -->
                                        <form action="/Proyecto-Barberia-BYL/EmpleadoServlet" method="post" class="d-inline">
                                            <input type="hidden" name="accion" value="eliminar">
                                            <input type="hidden" name="id" value="<%= empleado.getId() %>">
                                            <button type="submit" class="btn btn-danger btn-action" onclick="return confirm('¿Estás seguro de eliminar este empleado?');">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </form>
                                    </div>
                                </td>
                            </tr>

                            <!-- Modal para editar empleado -->
                            <div class="modal fade" id="editModal<%= empleado.getId() %>" tabindex="-1">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Editar Empleado</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                        </div>
                                        <form action="/Proyecto-Barberia-BYL/EmpleadoServlet" method="post">
                                            <div class="modal-body">
                                                <input type="hidden" name="accion" value="actualizar">
                                                <input type="hidden" name="id" value="<%= empleado.getId() %>">
                                                <div class="mb-3">
                                                    <label class="form-label">Nombre</label>
                                                    <input type="text" name="nombre" class="form-control" value="<%= empleado.getNombre() %>" required>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Apellido</label>
                                                    <input type="text" name="apellido" class="form-control" value="<%= empleado.getApellido() %>" required>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Correo</label>
                                                    <input type="email" name="correo" class="form-control" value="<%= empleado.getCorreo() %>" required>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Teléfono</label>
                                                    <input type="tel" name="telefono" class="form-control" value="<%= empleado.getTelefono() %>" required>
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Especialidad</label>
                                                    <input type="text" name="especialidad" class="form-control" value="<%= empleado.getEspecialidad() %>" required>
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

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>