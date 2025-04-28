<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Users.BoletasDAO, Users.Boletas, java.util.LinkedList" %>
<%
    // Obtener la lista de boletas
    BoletasDAO boletasDAO = new BoletasDAO();
    LinkedList<Boletas> boletas = boletasDAO.list();
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Boletas - Barbería BYL</title>
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

        .card-form, .table-empleados {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }

        .card-form {
            padding: 30px;
        }

        .table-empleados thead {
            background-color: var(--primary-color);
            color: white;
        }

        .btn-action {
            margin: 0 5px;
        }
        /* Estilos para el estado de las boletas */
.status-pagado {
    background-color: #28a745;  /* Verde para "Pagado" */
    color: white;  /* Texto blanco */
}

.status-pendiente {
    background-color: #ffc107;  /* Amarillo para "Pendiente" */
    color: black;  /* Texto negro */
}

.status-anulado {
    background-color: #dc3545;  /* Rojo para "Anulado" */
    color: white;  /* Texto blanco */
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

            <div class="col-md-10 main-content">
                <div class="row">
                    <div class="col-12">
                        <h1 class="mb-4">
                            <i class="fas fa-receipt me-2"></i>Gestión de Boletas
                        </h1>
                    </div>
                </div>
                <div class="mb-4">
    <a href="reportedepersonasconmascompras.jsp" class="btn btn-secondary">
        <i class="fas fa-file-pdf"></i> Ver Reporte de Servicios
    </a>
</div>
                <!-- Mensaje de error si existe -->
                <% 
                    String errorMensaje = (String) request.getAttribute("errorMensaje");
                    if (errorMensaje != null && !errorMensaje.isEmpty()) { 
                %>
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="fas fa-exclamation-triangle me-2"></i>
                        <%= errorMensaje %>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                <% } %>

                <!-- Formulario para crear boleta -->
                <div class="card-form">
                    <h2>
                        <i class="fas fa-file-invoice-dollar me-2"></i>Crear Nueva Boleta
                    </h2>
                    <form action="/Proyecto-Barberia-BYL/BoletasServlet" method="post">
                        <input type="hidden" name="accion" value="crear">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    <i class="fas fa-user me-2"></i>Cliente
                                </label>
                                <input type="text" name="cliente" class="form-control" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    <i class="fas fa-calendar me-2"></i>Fecha
                                </label>
                                <input type="date" name="fecha" class="form-control" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    <i class="fas fa-money-bill-wave me-2"></i>Total Bruto
                                </label>
                                <input type="number" name="totalBruto" step="0.01" class="form-control" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    <i class="fas fa-credit-card me-2"></i>Método de Pago
                                </label>
                                <select name="metodoPago" class="form-select" required>
                                    <option value="">Seleccionar Método de Pago</option>
                                    <option value="Efectivo">Efectivo</option>
                                    <option value="Tarjeta">Tarjeta</option>
                                    <option value="Transferencia">Transferencia</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 mb-3">
                                <label class="form-label">
                                    <i class="fas fa-check-circle me-2"></i>Estado
                                </label>
                                <select name="estado" class="form-select" required>
                                    <option value="">Seleccionar Estado</option>
                                    <option value="Pendiente">Pendiente</option>
                                    <option value="Pagado">Pagado</option>
                                    <option value="Anulado">Anulado</option>
                                </select>
                            </div>
                        </div>
                        <div class="text-end">
                            <button type="submit" class="btn btn-custom">
                                <i class="fas fa-plus me-2"></i>Crear Boleta
                            </button>
                        </div>
                    </form>
                </div>

                <!-- Tabla de Boletas -->
                <div class="table-responsive">
                    <table class="table table-hover mb-0">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Cliente</th>
                                <th>Fecha</th>
                                <th>Total Bruto</th>
                                <th>IGV</th>
                                <th>Total Neto</th>
                                <th>Método de Pago</th>
                                <th>Estado</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (Boletas boleta : boletas) { %>
                                <tr>
                                    <td><%= boleta.getIdBoleta() %></td>
                                    <td><%= boleta.getCliente() %></td>
                                    <td><%= boleta.getFecha() %></td>
                                    <td>S/ <%= boleta.getTotalBruto() %></td>
                                    <td>S/ <%= boleta.getIgv() %></td>
                                    <td>S/ <%= boleta.getTotalNeto() %></td>
                                    <td><%= boleta.getMetodoPago() %></td>
                                    <td>
                                        <span class="badge status-badge 
                                            <%= boleta.getEstado().equals("Pagado") ? "status-pagado" : 
                                                boleta.getEstado().equals("Pendiente") ? "status-pendiente" : 
                                                "status-anulado" %>">
                                            <%= boleta.getEstado() %>
                                        </span>
                                    </td>
                                    <td>
                                        <div class="btn-group" role="group">
                                            <button type="button" class="btn btn-sm btn-outline-primary" 
                                                    data-bs-toggle="modal" 
                                                    data-bs-target="#editModal<%= boleta.getIdBoleta() %>">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button type="button" class="btn btn-sm btn-outline-danger" 
                                                    data-bs-toggle="modal" 
                                                    data-bs-target="#deleteModal<%= boleta.getIdBoleta() %>">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </div>
                                    </td>
                                </tr>

                               <!-- Modal de Edición -->
<div class="modal fade" id="editModal<%= boleta.getIdBoleta() %>" tabindex="-1" aria-labelledby="editModalLabel<%= boleta.getIdBoleta() %>" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel<%= boleta.getIdBoleta() %>">Editar Boleta</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="/Proyecto-Barberia-BYL/BoletasServlet" method="post">
                    <input type="hidden" name="accion" value="editar">
                    <input type="hidden" name="idBoleta" value="<%= boleta.getIdBoleta() %>">
                    
                    <div class="mb-3">
                        <label class="form-label">Cliente</label>
                        <input type="text" name="cliente" class="form-control" value="<%= boleta.getCliente() %>" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Fecha</label>
                        <input type="date" name="fecha" class="form-control" value="<%= boleta.getFecha() %>" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Total Bruto</label>
                        <input type="number" name="totalBruto" class="form-control" value="<%= boleta.getTotalBruto() %>" step="0.01" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Método de Pago</label>
                        <select name="metodoPago" class="form-select" required>
                            <option value="">Seleccionar Método de Pago</option>
                            <option value="Efectivo" <%= boleta.getMetodoPago().equals("Efectivo") ? "selected" : "" %>>Efectivo</option>
                            <option value="Tarjeta" <%= boleta.getMetodoPago().equals("Tarjeta") ? "selected" : "" %>>Tarjeta</option>
                            <option value="Transferencia" <%= boleta.getMetodoPago().equals("Transferencia") ? "selected" : "" %>>Transferencia</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Estado</label>
                        <select name="estado" class="form-select" required>
                            <option value="">Seleccionar Estado</option>
                            <option value="Pendiente" <%= boleta.getEstado().equals("Pendiente") ? "selected" : "" %>>Pendiente</option>
                            <option value="Pagado" <%= boleta.getEstado().equals("Pagado") ? "selected" : "" %>>Pagado</option>
                            <option value="Anulado" <%= boleta.getEstado().equals("Anulado") ? "selected" : "" %>>Anulado</option>
                        </select>
                    </div>
                    <div class="text-end">
                        <button type="submit" class="btn btn-primary">Actualizar Boleta</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


                                <!-- Modal de Eliminación -->
<div class="modal fade" id="deleteModal<%= boleta.getIdBoleta() %>" tabindex="-1" aria-labelledby="deleteModalLabel<%= boleta.getIdBoleta() %>" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabel<%= boleta.getIdBoleta() %>">Eliminar Boleta</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>¿Estás seguro de que deseas eliminar esta boleta?</p>
            </div>
            <div class="modal-footer">
                <form action="/Proyecto-Barberia-BYL/BoletasServlet" method="post">
                    <input type="hidden" name="accion" value="eliminar">
                    <input type="hidden" name="idBoleta" value="<%= boleta.getIdBoleta() %>">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-danger">Eliminar</button>
                </form>
            </div>
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

    <!-- Bootstrap JS y Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>