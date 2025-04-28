<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Users.CitaDAO, Users.Cita, java.util.LinkedList" %>
<%
    // Obtener la lista de citas
    CitaDAO citaDAO = new CitaDAO();
    LinkedList<Cita> citas = citaDAO.list();
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Citas</title>
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
                <h1 class="my-4">Gestión de Citas</h1>

                <!-- Formulario para crear cita -->
                <div class="card-form">
                    <h2 class="mb-4">Crear Cita</h2>
                    <form action="/Proyecto-Barberia-BYL/CitaServlet" method="post">
                        <input type="hidden" name="accion" value="crear">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Empleado</label>
                                <input type="text" name="empleado" class="form-control" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Servicio</label>
                                <input type="text" name="servicio" class="form-control" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Sede</label>
                                <input type="text" name="sede" class="form-control" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Fecha</label>
                                <input type="date" name="fecha" class="form-control" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Hora Inicio</label>
                                <input type="time" name="horaInicio" class="form-control" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Hora Fin</label>
                                <input type="time" name="horaFin" class="form-control" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Nombre del Cliente</label>
                                <input type="text" name="clienteNombre" class="form-control" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Estado</label>
                                <select name="estado" class="form-control" required>
                                    <option value="PENDIENTE">Pendiente</option>
                                    <option value="VALIDADO">Validado</option>
                                    <option value="CANCELADO">Cancelado</option>
                                </select>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-plus"></i> Crear Cita
                        </button>
                        
                    </form>
                </div>
                <!-- Botón para reporte de servicios -->
<div class="mb-4">
    <button class="btn btn-secondary" onclick="abrirReporteServicios()">Ver Reporte de Servicios</button>
</div>

<script>
    function abrirReporteServicios() {
        // Cambia la ruta al servlet que genera el reporte de servicios
        window.open('/Proyecto-Barberia-BYL/GenerarReporteServiciosPDF', '_blank');
    }
</script>
                <!-- Tabla de citas -->
                <div class="card table-responsive">
                    <div class="card-header bg-primary text-white">
                        <h2 class="mb-0">Lista de Citas</h2>
                    </div>
                    <table class="table table-striped table-hover mb-0">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Empleado</th>
                                <th>Servicio</th>
                                <th>Sede</th>
                                <th>Fecha</th>
                                <th>Hora Inicio</th>
                                <th>Hora Fin</th>
                                <th>Cliente</th>
                                <th>Estado</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for(Cita cita : citas) { %>
                                <tr>
                                    <td><%= cita.getIdCita() %></td>
                                    <td><%= cita.getEmpleado() %></td>
                                    <td><%= cita.getServicio() %></td>
                                    <td><%= cita.getSede() %></td>
                                    <td><%= cita.getFecha() %></td>
                                    <td><%= cita.getHoraInicio() %></td>
                                    <td><%= cita.getHoraFin() %></td>
                                    <td><%= cita.getClienteNombre() %></td>
                                    <td>
                                        <% 
                                            String estadoClass = "";
                                            switch(cita.getEstado()) {
                                                case "PENDIENTE": 
                                                    estadoClass = "badge bg-warning"; 
                                                    break;
                                                case "VALIDADO": 
                                                    estadoClass = "badge bg-success"; 
                                                    break;
                                                case "CANCELADO": 
                                                    estadoClass = "badge bg-danger"; 
                                                    break;
                                            }
                                        %>
                                        <span class="<%= estadoClass %>"><%= cita.getEstado() %></span>
                                    </td>
                                    <td>
                                        <!-- Botones de acciones -->
                                        <div class="btn-group" role="group">
                                            <button class="btn btn-sm btn-info edit-btn" data-id="<%= cita.getIdCita() %>" data-bs-toggle="modal" data-bs-target="#editModal">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button class="btn btn-sm btn-danger delete-btn" data-id="<%= cita.getIdCita() %>" data-bs-toggle="modal" data-bs-target="#deleteModal">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>

                <!-- Modals for Edit and Delete -->
                <!-- Edit Modal -->
<div class="modal fade" id="editModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Editar Cita</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <!-- Formulario de edición -->
                <form action="/Proyecto-Barberia-BYL/CitaServlet" method="post">
                    <input type="hidden" name="accion" value="actualizar">
                    <input type="hidden" name="idCita" id="editIdCita">

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Empleado</label>
                            <input type="text" name="empleado" id="editEmpleado" class="form-control" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Servicio</label>
                            <input type="text" name="servicio" id="editServicio" class="form-control" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Sede</label>
                            <input type="text" name="sede" id="editSede" class="form-control" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Fecha</label>
                            <input type="date" name="fecha" id="editFecha" class="form-control" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Hora Inicio</label>
                            <input type="time" name="horaInicio" id="editHoraInicio" class="form-control" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Hora Fin</label>
                            <input type="time" name="horaFin" id="editHoraFin" class="form-control" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Nombre del Cliente</label>
                            <input type="text" name="clienteNombre" id="editClienteNombre" class="form-control" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Estado</label>
                            <select name="estado" id="editEstado" class="form-control" required>
                                <option value="PENDIENTE">Pendiente</option>
                                <option value="VALIDADO">Validado</option>
                                <option value="CANCELADO">Cancelado</option>
                            </select>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save"></i> Guardar Cambios
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>


                <!-- Delete Modal -->
                <div class="modal fade" id="deleteModal" tabindex="-1">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Confirmar Eliminación</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">
                                <p>¿Está seguro de que desea eliminar esta cita?</p>
                                <form action="/Proyecto-Barberia-BYL/CitaServlet" method="post">
                                    <input type="hidden" name="accion" value="eliminar">
                                    <input type="hidden" name="idCita" id="deleteIdCita">
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                        <button type="submit" class="btn btn-danger">Eliminar</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Script para abrir reporte -->
    <script>
        function abrirReporte() {
            window.open('reportedeventas.jsp', 'Reporte de Ventas', 'width=800,height=600');
        }
    </script>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
              // Edit modal handling
    const editButtons = document.querySelectorAll('.edit-btn');
    const editModal = document.getElementById('editModal');
    
    // Campos del formulario de edición
    const editIdCitaInput = document.getElementById('editIdCita');
    const editEmpleadoInput = document.getElementById('editEmpleado');
    const editServicioInput = document.getElementById('editServicio');
    const editSedeInput = document.getElementById('editSede');
    const editFechaInput = document.getElementById('editFecha');
    const editHoraInicioInput = document.getElementById('editHoraInicio');
    const editHoraFinInput = document.getElementById('editHoraFin');
    const editClienteNombreInput = document.getElementById('editClienteNombre');
    const editEstadoInput = document.getElementById('editEstado');

    editButtons.forEach(button => {
        button.addEventListener('click', function() {
            const citaId = this.getAttribute('data-id');
            const empleado = this.getAttribute('data-empleado');
            const servicio = this.getAttribute('data-servicio');
            const sede = this.getAttribute('data-sede');
            const fecha = this.getAttribute('data-fecha');
            const horaInicio = this.getAttribute('data-horaInicio');
            const horaFin = this.getAttribute('data-horaFin');
            const clienteNombre = this.getAttribute('data-clienteNombre');
            const estado = this.getAttribute('data-estado');

            // Llenar los campos con los datos de la cita seleccionada
            editIdCitaInput.value = citaId;
            editEmpleadoInput.value = empleado;
            editServicioInput.value = servicio;
            editSedeInput.value = sede;
            editFechaInput.value = fecha;
            editHoraInicioInput.value = horaInicio;
            editHoraFinInput.value = horaFin;
            editClienteNombreInput.value = clienteNombre;
            editEstadoInput.value = estado;
        });
    });

            // Delete modal handling
            const deleteButtons = document.querySelectorAll('.delete-btn');
            const deleteModal = document.getElementById('deleteModal');
            const deleteIdCitaInput = document.getElementById('deleteIdCita');

            deleteButtons.forEach(button => {
                button.addEventListener('click', function() {
                    const citaId = this.getAttribute('data-id');
                    deleteIdCitaInput.value = citaId;
                });
            });
        });
    </script>
</body>
</html>