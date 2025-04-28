<%-- 
    Document   : Frame_Gestion_Servicios
    Created on : 19 oct. 2024, 1:43:46 p. m.
    Author     : Micha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema Gestión de Barbería</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/Administrador/css/styless4.css">
</head>
<body>
    <div class="container-fluid">
        <div class="row" style="height: 100vh;">
            <div class="col-md-2 sidebar bg-light">
                <div class="logo text-center mt-4 mb-4">
                    <img src="../img/barber-logo.jpg" alt="Logo" class="img-fluid rounded-circle" style="width: 80px;">
                </div>
                <ul class="nav flex-column text-center">
                    <li class="nav-item">
                        <a href="../pages/Frame_Gestion_Citas.jsp" class="nav-link"><img src="../img/Citas img.png" alt="Icon 1"></a>
                    </li>
                    <li class="nav-item">
                        <a href="../pages/Frame_Gestion_Proovedor.jsp" class="nav-link"><img src="../img/Locales img.png" alt="Icon 2"></a>
                    </li>
                    <li class="nav-item">
                        <a href="../pages/Frame_Gestion_Servicios.jsp" class="nav-link"><img src="../img/Servicios img.png" alt="Icon 3"></a>
                    </li>
                    <li class="nav-item">
                        <a href="../pages/Frame_Gestion_Productos.jsp" class="nav-link"><img src="../img/Productos img.png" alt="Icon 4"></a>
                    </li>

                    <li class="nav-item nav-link_user" style="margin-top: 70px !important;"></li>
                        <a href="../../Frame-login-general/Frame-login-generaal.jsp" class="nav-link"><img src="../img/User image.png" alt="User Icon"></a>
                    </li>
                </ul>
            </div>

            <div class="col-md-10 main-content">
                <h1 class="my-5">Sistema Gestión de Barbería</h1>
                <div class="d-flex justify-content-between align-items-center">
                    <h2>Gestión de Servicios</h2>
                    <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#modalAgregarServicio">
                        Nuevo
                    </button>
                </div>

                <!-- Lista de servicios -->
                <div class="list-group-item d-flex justify-content-between align-items-center">
                    <div class="d-flex align-items-center">
                        <img src="../img/corte.png" alt="Corte" class="img-thumbnail me-3" style="width: 80px; height: 80px;">
                        <span>Corte</span>
                    </div>
                    <div>
                        <button class="btn btn-secondary me-2" data-bs-toggle="modal" data-bs-target="#modalEditarServicio" onclick="cargarDatosServicio(1)">
                            Editar
                        </button>
                        <button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#modalVerServicio" onclick="verInformeServicio(1)">
                            Ver
                        </button>
                    </div>
                </div>

                <div class="list-group-item d-flex justify-content-between align-items-center bg-light">
                    <div class="d-flex align-items-center">
                        <img src="../img/barba.png" alt="Barba" class="img-thumbnail me-3" style="width: 80px; height: 80px;">
                        <span>Barba</span>
                    </div>
                    <button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#modalEditarServicio" onclick="cargarDatosServicio(2)">
                        Editar
                    </button>
                </div>

                <div class="list-group-item d-flex justify-content-between align-items-center">
                    <div class="d-flex align-items-center">
                        <img src="../img/facial.png" alt="Facial" class="img-thumbnail me-3" style="width: 80px; height: 80px;">
                        <span>Facial</span>
                    </div>
                    <button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#modalEditarServicio" onclick="cargarDatosServicio(3)">
                        Editar
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Agregar Servicio -->
    <div class="modal fade" id="modalAgregarServicio" tabindex="-1" aria-labelledby="modalAgregarServicioLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalAgregarServicioLabel">Agregar Servicio</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="formAgregarServicio">
                        <div class="mb-3">
                            <label for="nombreServicio" class="form-label">Nombre del Servicio:</label>
                            <input type="text" class="form-control" id="nombreServicio" required>
                        </div>
                        <div class="mb-3">
                            <label for="precioServicio" class="form-label">Precio:</label>
                            <input type="number" class="form-control" id="precioServicio" min="10" max="100" required>
                        </div>
                        <div class="mb-3">
                            <label for="descripcionServicio" class="form-label">Descripción:</label>
                            <textarea class="form-control" id="descripcionServicio" rows="3"></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary" onclick="guardarServicio()">Aceptar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Editar Servicio -->
    <div class="modal fade" id="modalEditarServicio" tabindex="-1" aria-labelledby="modalEditarServicioLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalEditarServicioLabel">Editar Servicio</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="formEditarServicio">
                        <div class="mb-3">
                            <label for="editNombreServicio" class="form-label">Nombre del Servicio:</label>
                            <input type="text" class="form-control" id="editNombreServicio" required>
                        </div>
                        <div class="mb-3">
                            <label for="editPrecioServicio" class="form-label">Precio:</label>
                            <input type="number" class="form-control" id="editPrecioServicio" min="10" max="100" required>
                        </div>
                        <div class="mb-3">
                            <label for="editDescripcionServicio" class="form-label">Descripción:</label>
                            <textarea class="form-control" id="editDescripcionServicio" rows="3"></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary" onclick="guardarEdicionServicio()">Aceptar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Ver Servicio -->
    <div class="modal fade" id="modalVerServicio" tabindex="-1" aria-labelledby="modalVerServicioLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalVerServicioLabel">Detalle del Servicio</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p><strong>Nombre:</strong> <span id="verNombreServicio"></span></p>
                    <p><strong>Precio:</strong> S/. <span id="verPrecioServicio"></span></p>
                    <p><strong>Descripción:</strong></p>
                    <p id="verDescripcionServicio"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function guardarServicio() {
            const nombreServicio = document.getElementById('nombreServicio').value;
            const precioServicio = document.getElementById('precioServicio').value;
            const descripcionServicio = document.getElementById('descripcionServicio').value;

            console.log({ nombreServicio, precioServicio, descripcionServicio });

            const modal = new bootstrap.Modal(document.getElementById('modalAgregarServicio'));
            modal.hide();
        }

        function cargarDatosServicio(servicioId) {
            const servicio = {
                nombre: "Corte",
                precio: 30,
                descripcion: "Corte de pelo clásico."
            };

            document.getElementById('editNombreServicio').value = servicio.nombre;
            document.getElementById('editPrecioServicio').value = servicio.precio;
            document.getElementById('editDescripcionServicio').value = servicio.descripcion;
        }

        function guardarEdicionServicio() {
            const nombreServicio = document.getElementById('editNombreServicio').value;
            const precioServicio = document.getElementById('editPrecioServicio').value;
            const descripcionServicio = document.getElementById('editDescripcionServicio').value;

            console.log({ nombreServicio, precioServicio, descripcionServicio });

            const modal = new bootstrap.Modal(document.getElementById('modalEditarServicio'));
            modal.hide();
        }

        function verInformeServicio(servicioId) {
            const servicio = {
                nombre: "Corte",
                precio: 30,
                descripcion: "Corte de pelo clásico."
            };

            document.getElementById('verNombreServicio').textContent = servicio.nombre;
            document.getElementById('verPrecioServicio').textContent = servicio.precio;
            document.getElementById('verDescripcionServicio').textContent = servicio.descripcion;
        }
    </script>
</body>
</html>
