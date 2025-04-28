<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema Gestión de Barbería</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/Administrador/css/styless4.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="container-fluid">
        <div class="row" style="height: 100vh;">
            <!-- Barra lateral -->
            <div class="col-md-2 sidebar bg-light">
                <div class="logo text-center mt-4 mb-4">
                    <img src="../img/barber-logo.jpg" alt="Logo" class="img-fluid rounded-circle" style="width: 80px;">
                </div>
                <ul class="nav flex-column text-center">
                    <li class="nav-item">
                        <a href="../pages/Frame_Gestion_Citas.jsp" class="nav-link"><img src="../img/Citas img.png" alt="Icon 1"></a>
                    </li>
                    <li class="nav-item">
                        <a href="../../Usuario/pages/usuarios.jsp" class="nav-link"><img src="../img/User image.png" alt="Icon 5"></a>
                    </li>
                    <li class="nav-item">
                        <a href="../pages/proveedor.jsp" class="nav-link"><img src="../img/Locales img.png" alt="Icon 2"></a>
                    </li>
                    <li class="nav-item">
                        <a href="../pages/servicio.jsp" class="nav-link"><img src="../img/Servicios img.png" alt="Icon 3"></a>
                    </li>
                    <li class="nav-item">
                        <a href="../pages/productos.jsp" class="nav-link"><img src="../img/Productos img.png" alt="Icon 4"></a>
                    </li>
                     <li class="nav-item">
                        <a href="../pages/empleado.jsp" class="nav-link"><img src="../img/User image.png"8 alt="Icon 4"></a>
                    </li>

                    <li class="nav-item nav-link_user" style="margin-top: 70px !important;">
                        <a href="../../Frame-login-general/Frame-login-generaal.jsp" class="nav-link"><img src="../img/User image.png" alt="Icon 5"></a>
                    </li>
                </ul>
            </div>
    
            <!-- Contenido principal -->
            <div class="col-md-10 main-content">
                <h1 class="my-5">Sistema Gestión de Barbería</h1>
                <h2 class="my-3">Gestión de Citas</h2>
    
                <!-- Filtros -->
                <div class="filters mb-4">
                    <select class="form-select d-inline-block" style="width: 150px;">
                        <option selected>Semana</option>
                    </select>
                    <select class="form-select d-inline-block" style="width: 150px;">
                        <option selected>Servicio</option>
                    </select>
                    <select class="form-select d-inline-block" style="width: 150px;">
                        <option selected>Turno</option>
                    </select>
                    <select class="form-select d-inline-block" style="width: 150px;">
                        <option selected>Empleado</option>
                    </select>

                    <button type="button" class="btn btn-secondary" onclick="nuevaCita()">
                        Nueva Cita
                    </button>
                </div>
    
                <!-- Tabla de citas -->
                <div class="table-responsive bg-white">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Nº</th>
                                <th>Empleado</th>
                                <th>Fecha</th>
                                <th>Sede</th>
                                <th>Tipo de Servicio</th>
                                <th>Estado</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody id="tablaCitas">
                            <!-- Las citas se cargarán dinámicamente aquí -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal de Gestión de Citas -->
    <div class="modal fade" id="modalGestionCita" tabindex="-1" aria-labelledby="modalGestionCitaLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalGestionCitaLabel">Gestionar Cita</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="formGestionCita">
                        <input type="hidden" id="idCita" name="idCita">
                        <div class="mb-3">
                            <label for="empleado" class="form-label">Empleado:</label>
                            <select class="form-select" id="empleado" required>
                                <option value="">Seleccione un empleado</option>
                                <option>Juan Pérez</option>
                                <option>María López</option>
                                <option>Pedro Ramírez</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="servicio" class="form-label">Servicio:</label>
                            <select class="form-select" id="servicio" required>
                                <option value="">Seleccione un servicio</option>
                                <option>Corte de Pelo</option>
                                <option>Afeitado</option>
                                <option>Manicure</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="fecha" class="form-label">Fecha:</label>
                            <input type="date" class="form-control" id="fecha" required>
                        </div>
                        <div class="mb-3">
                            <label for="horaInicio" class="form-label">Turno:</label>
                            <div class="d-flex gap-2 align-items-center">
                                <input type="time" class="form-control" id="horaInicio" required>
                                <span>a</span>
                                <input type="time" class="form-control" id="horaFin" required>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Sede:</label><br>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" name="sede" id="sede1" value="Sede 1" checked>
                                <label class="form-check-label" for="sede1">Sede 1</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" name="sede" id="sede2" value="Sede 2">
                                <label class="form-check-label" for="sede2">Sede 2</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" class="form-check-input" name="sede" id="sede3" value="Sede 3">
                                <label class="form-check-label" for="sede3">Sede 3</label>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="cliente" class="form-label">Cliente:</label>
                            <input type="text" class="form-control" id="cliente" required>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary" onclick="guardarCita()">Guardar</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // Variables globales
        let citas = [];
        const modal = new bootstrap.Modal(document.getElementById('modalGestionCita'));

        // Cargar citas al iniciar
        document.addEventListener('DOMContentLoaded', cargarCitas);

        function cargarCitas() {
            // Simulación de carga de datos (esto debería ser reemplazado por una llamada AJAX al servidor)
            citas = [
                {
                    id: 1,
                    empleado: "Juan Pérez",
                    fecha: "2024-09-21",
                    sede: "Sede 1",
                    servicio: "Corte de Pelo",
                    horaInicio: "12:00",
                    horaFin: "13:00",
                    cliente: "Pablo Mármol",
                    estado: "Pendiente"
                },
                // Agregar más citas aquí
            ];
            actualizarTablaCitas();
        }

        function actualizarTablaCitas() {
            const tbody = document.getElementById('tablaCitas');
            tbody.innerHTML = '';
            
            citas.forEach(cita => {
                const tr = document.createElement('tr');
                tr.innerHTML = `
                    <td>${cita.id}</td>
                    <td>${cita.empleado}</td>
                    <td>${cita.fecha}</td>
                    <td>${cita.sede}</td>
                    <td>${cita.servicio}</td>
                    <td>${cita.estado}</td>
                    <td>
                        <button class="btn btn-success btn-sm" onclick="validarCita(${cita.id})">Validar</button>
                        <button class="btn btn-warning btn-sm" onclick="editarCita(${cita.id})">Editar</button>
                        <button class="btn btn-danger btn-sm" onclick="cancelarCita(${cita.id})">Cancelar</button>
                    </td>
                `;
                tbody.appendChild(tr);
            });
        }

        function nuevaCita() {
            document.getElementById('formGestionCita').reset();
            document.getElementById('idCita').value = '';
            document.getElementById('modalGestionCitaLabel').textContent = 'Nueva Cita';
            modal.show();
        }

        function editarCita(id) {
            const cita = citas.find(c => c.id === id);
            if (cita) {
                document.getElementById('idCita').value = cita.id;
                document.getElementById('empleado').value = cita.empleado;
                document.getElementById('servicio').value = cita.servicio;
                document.getElementById('fecha').value = cita.fecha;
                document.getElementById('horaInicio').value = cita.horaInicio;
                document.getElementById('horaFin').value = cita.horaFin;
                document.querySelector(`input[name="sede"][value="${cita.sede}"]`).checked = true;
                document.getElementById('cliente').value = cita.cliente;
                document.getElementById('modalGestionCitaLabel').textContent = 'Editar Cita';
                modal.show();
            }
        }

        function guardarCita() {
            const formData = {
                empleado: document.getElementById('empleado').value,
                servicio: document.getElementById('servicio').value,
                fecha: document.getElementById('fecha').value,
                horaInicio: document.getElementById('horaInicio').value,
                horaFin: document.getElementById('horaFin').value,
                sede: document.querySelector('input[name="sede"]:checked').value,
                cliente: document.getElementById('cliente').value
            };

            $.ajax({
                url: 'CrearCitaServlet',
                type: 'POST',
                data: formData,
                success: function(response) {
                    if (response.success) {
                        alert('Cita creada con éxito');
                        modal.hide();
                        cargarCitas();
                    } else {
                        alert('Error al guardar la cita: ' + response.error);
                    }
                },
                error: function(xhr, status, error) {
                    alert('Error al guardar la cita: ' + error);
                    console.error('Error detallado:', xhr.responseText);
                }
            });
        }

        function validarCita(id) {
            if (confirm('¿Desea validar esta cita?')) {
                // Aquí deberías hacer la llamada AJAX al servidor
                $.ajax({
                    url: 'ValidarCitaServlet',
                    type: 'POST',
                    data: { idCita: id },
                    success: function(response) {
                        alert('Cita validada con éxito');
                        cargarCitas();
                    },
                    error: function(xhr, status, error) {
                        alert('Error al validar la cita: ' + error);
                    }
                });
            }
        }

        function cancelarCita(id) {
            if (confirm('¿Está seguro de que desea cancelar esta cita?')) {
                // Aquí deberías hacer la llamada AJAX al servidor
                $.ajax({
                    url: 'CancelarCitaServlet',
                    type: 'POST',
                    data: { idCita: id },
                    success: function(response) {
                        alert('Cita cancelada con éxito');
                        cargarCitas();
                    },
                    error: function(xhr, status, error) {
                        alert('Error al cancelar la cita: ' + error);
                    }
                });
            }
        }
    </script>
</body>
</html>
