<%-- 
    Document   : Frame_Gestion_Proovedor
    Created on : 19 oct. 2024, 1:40:48 p. m.
    Author     : Micha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

                    <li class="nav-item nav-link_user" style=" margin-top: 70px !important;"></li>
                        <a href="../../Frame-login-general/Frame-login-generaal.jsp" class="nav-link "><img src="../img/User image.png" alt="Icon 5"></a>
                    </li>
                </ul>
            </div>
    
            <div class="col-md-10 main-content">
                <h1 class="my-5">Sistema Gestión de Barbería</h1>
                <div class="d-flex justify-content-between align-items-center">
                    <h2>Proveedores</h2>
                    <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#modalAgregarProveedor">
                        Nuevo
                    </button>                      
                </div>

                <div class="list-group-item d-flex justify-content-between align-items-center">
                    <div class="d-flex align-items-center">
                        <img src="../img/prov1.png" alt="Proveedor 1" class="img-thumbnail me-3" style="width: 80px; height: 80px;">
                        <span>Proveedor 1</span>
                    </div>
                    <div>
                        <button class="btn btn-secondary me-2" data-bs-toggle="modal" data-bs-target="#modalEditarProveedor" onclick="cargarDatosProveedor(1)">
                            Editar
                        </button>
                        <button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#modalEditarProveedor" onclick="cargarDatosProveedor(1)">
                            Ver
                        </button>
                    </div>
                </div>
                

                    <div class="list-group-item d-flex justify-content-between align-items-center bg-light">
                        <div class="d-flex align-items-center">
                            <img src="../img/prov2.png" alt="Proveedor 2" class="img-thumbnail me-3" style="width: 80px; height: 80px;">
                            <span>Proveedor 2</span>
                        </div>
                        <button class="btn btn-secondary">Editar</button>
                    </div>

                    <div class="list-group-item d-flex justify-content-between align-items-center">
                        <div class="d-flex align-items-center">
                            <img src="../img/prov3.png" alt="Proveedor 3" class="img-thumbnail me-3" style="width: 80px; height: 80px;">
                            <span>Proveedor 3</span>
                        </div>
                        <button class="btn btn-warning">Editar</button>
                    </div>

                    <div class="list-group-item d-flex justify-content-between align-items-center bg-light">
                        <div class="d-flex align-items-center">
                            <img src="../img/prov4.png" alt="Proveedor 4" class="img-thumbnail me-3" style="width: 80px; height: 80px;">
                            <span>Proveedor 4</span>
                        </div>
                        <button class="btn btn-warning">Editar</button>
                    </div>

                    <div class="list-group-item d-flex justify-content-between align-items-center">
                        <div class="d-flex align-items-center">
                            <img src="../img/prov5.png" alt="Proveedor 5" class="img-thumbnail me-3" style="width: 80px; height: 80px;">
                            <span>Proveedor 5</span>
                        </div>
                        <button class="btn btn-warning">Editar</button>
                    </div>

                    <div class="list-group-item d-flex justify-content-between align-items-center bg-light">
                        <div class="d-flex align-items-center">
                            <img src="../img/prov6.png" alt="Proveedor 6" class="img-thumbnail me-3" style="width: 80px; height: 80px;">
                            <span>Proveedor 6</span>
                        </div>
                        <button class="btn btn-warning">Editar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Modal Agregar Proveedor -->
    <div class="modal fade" id="modalAgregarProveedor" tabindex="-1" aria-labelledby="modalAgregarProveedorLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalAgregarProveedorLabel">Agregar Proveedor</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="formProveedor">
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre:</label>
                            <input type="text" class="form-control" id="nombre" value="Pepe Pepe Perez Perez" required>
                        </div>
                        <div class="mb-3">
                            <label for="ruc" class="form-label">RUC:</label>
                            <input type="text" class="form-control" id="ruc" value="20353153531" required>
                        </div>
                        <div class="mb-3">
                            <label for="telefono" class="form-label">Teléfono:</label>
                            <input type="text" class="form-control" id="telefono" value="997 234 987" required>
                        </div>
                        <div class="mb-3">
                            <label for="direccion" class="form-label">Dirección:</label>
                            <input type="text" class="form-control" id="direccion" value="Mz. T11 Ubr.Centro" required>
                        </div>
                        <div class="mb-3">
                            <label for="nota" class="form-label">Nota:</label>
                            <textarea 
                                class="form-control" id="nota" rows="3">Shampoo: 4 cajas
                                Acondicionador: 2 cajas
                                Pack Peines: 3 paquetes
                                Cera: 4 cajas
                                Gel: 5 cajas
                            </textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary" onclick="guardarProveedor()">Aceptar</button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Modal Editar Proveedor -->
<div class="modal fade" id="modalEditarProveedor" tabindex="-1" aria-labelledby="modalEditarProveedorLabel" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
        <h5 class="modal-title" id="modalEditarProveedorLabel">Editar Proveedor</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
        <form id="formEditarProveedor">
            <div class="mb-3">
            <label for="editNombre" class="form-label">Nombre:</label>
            <input type="text" class="form-control" id="editNombre" required>
            </div>
            <div class="mb-3">
            <label for="editRuc" class="form-label">RUC:</label>
            <input type="text" class="form-control" id="editRuc" required>
            </div>
            <div class="mb-3">
            <label for="editTelefono" class="form-label">Teléfono:</label>
            <input type="text" class="form-control" id="editTelefono" required>
            </div>
            <div class="mb-3">
            <label for="editDireccion" class="form-label">Dirección:</label>
            <input type="text" class="form-control" id="editDireccion" required>
            </div>
            <div class="mb-3">
            <label for="editNota" class="form-label">Nota:</label>
            <textarea class="form-control" id="editNota" rows="3"></textarea>
            </div>
        </form>
        </div>
        <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" onclick="guardarEdicionProveedor()">Aceptar</button>
        </div>
    </div>
    </div>
</div>


    <!-- Scripts de Bootstrap y JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function guardarProveedor() {
            const nombre = document.getElementById('nombre').value;
            const ruc = document.getElementById('ruc').value;
            const telefono = document.getElementById('telefono').value;
            const direccion = document.getElementById('direccion').value;
            const nota = document.getElementById('nota').value;

            // Aquí puedes hacer lo que desees con los datos, por ejemplo, imprimirlos en la consola o enviarlos a tu backend.
            console.log({
                nombre: nombre,
                ruc: ruc,
                telefono: telefono,
                direccion: direccion,
                nota: nota
            });

            // Puedes cerrar el modal manualmente si deseas
            var modal = new bootstrap.Modal(document.getElementById('modalAgregarProveedor'));
            modal.hide();
        }
    </script>
    <script>
        function cargarDatosProveedor(proveedorId) {
          // Aquí debes obtener los datos del proveedor usando su ID.
          // Esto puede ser desde una base de datos, una API o directamente del frontend.
      
          // Ejemplo de datos cargados (en un entorno real, usarías datos reales)
          const proveedor = {
            nombre: "Pepe Pepe Perez Paterson",
            ruc: "20353153532",
            telefono: "997 234 984",
            direccion: "Mz. T11 Ubr.Centro",
            nota: "Shampoo: 4 cajas\nAcondicionador: 2 cajas\nPack Peines: 3 paquetes\nCera: 4 cajas\nGel: 5 cajas"
          };
      
          // Cargar los datos en el formulario de edición
          document.getElementById('editNombre').value = proveedor.nombre;
          document.getElementById('editRuc').value = proveedor.ruc;
          document.getElementById('editTelefono').value = proveedor.telefono;
          document.getElementById('editDireccion').value = proveedor.direccion;
          document.getElementById('editNota').value = proveedor.nota;
        }
      
        function guardarEdicionProveedor() {
          // Capturar los valores editados
          const nombre = document.getElementById('editNombre').value;
          const ruc = document.getElementById('editRuc').value;
          const telefono = document.getElementById('editTelefono').value;
          const direccion = document.getElementById('editDireccion').value;
          const nota = document.getElementById('editNota').value;
      
          // Aquí puedes hacer lo que desees con los datos editados, por ejemplo, enviarlos a tu backend.
          console.log({
            nombre: nombre,
            ruc: ruc,
            telefono: telefono,
            direccion: direccion,
            nota: nota
          });
      
          // Cerrar el modal después de guardar
          var modal = new bootstrap.Modal(document.getElementById('modalEditarProveedor'));
          modal.hide();
        }
      </script>
      
</body>

</html>
