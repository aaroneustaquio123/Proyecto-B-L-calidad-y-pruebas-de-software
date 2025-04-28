<%@ page contentType="text/html" pageEncoding="UTF-8" %>
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
                    <a href="../../Frame-login-general/Frame-login-generaal.jsp" class="nav-link"><img src="../img/User image.png" alt="Icon 5"></a>
                    </li>
                </ul>
            </div>

            <div class="col-md-10 main-content">
                <h1 class="my-5">Sistema Gestión de Barbería</h1>

                <div class="d-flex justify-content-between align-items-start">
                    <h2>Productos</h2>
                    <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#modalAgregarProducto">
                        Nuevo Producto
                    </button>
                </div>
                <div class="form-group mt-4">
                    <label for="sede">Seleccionar Sede:</label>
                    <select id="sede" class="form-select" style="width: auto; display: inline-block;">
                        <option value="SJL">SJL</option>
                        <option value="Miraflores">Miraflores</option>
                    </select>
                </div>

                <div class="table-responsive mt-4">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Nº</th>
                                <th>Item</th>
                                <th>Stock</th>
                                <th>Sede</th>
                                <th>Tipo de Servicio</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Shampoo</td>
                                <td>100</td>
                                <td>SJL</td>
                                <td><a href="#" class="toggle-details" data-target="#details1">Tipo de Servicio</a></td>
                                <td>
                                    <button class="btn btn-warning me-2" onclick="cargarDatosEditar('Shampoo', 25.00, 100, 'Sede 1', 'SHAMPOO MARMARA BARBER DE 1150 ML')" data-bs-toggle="modal" data-bs-target="#modalEditarProducto">Editar</button>
                                    <button class="btn btn-info" onclick="cargarDatosInforme('Shampoo', 25.00, 100, 'Sede 1', 'SHAMPOO MARMARA BARBER DE 1150 ML')" data-bs-toggle="modal" data-bs-target="#modalInformeProducto">Ver</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal para agregar producto -->
    <div class="modal fade" id="modalAgregarProducto" tabindex="-1" aria-labelledby="modalAgregarProductoLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalAgregarProductoLabel">Añadir Producto</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="formAgregarProducto">
                        <div class="mb-3 text-center">
                            <img src="../img/product.png" alt="Producto" style="width: 100px;">
                        </div>
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre:</label>
                            <input type="text" class="form-control" id="nombre" required>
                        </div>
                        <div class="mb-3">
                            <label for="precio" class="form-label">Precio:</label>
                            <input type="number" class="form-control" id="precio" required>
                        </div>
                        <div class="mb-3">
                            <label for="stock" class="form-label">Stock:</label>
                            <input type="number" class="form-control" id="stock" required>
                        </div>
                        <div class="mb-3">
                            <label for="sede" class="form-label">Sedes:</label><br>
                            <input type="radio" id="sede1" name="sede" value="Sede 1" checked> Sede 1
                            <input type="radio" id="sede2" name="sede" value="Sede 2"> Sede 2
                            <input type="radio" id="sede3" name="sede" value="Sede 3"> Sede 3
                        </div>
                        <div class="mb-3">
                            <label for="descripcion" class="form-label">Descripción:</label>
                            <textarea class="form-control" id="descripcion" rows="3" required></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary" onclick="guardarProducto()">Aceptar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal para informe del producto (modal "Ver") -->
    <div class="modal fade" id="modalInformeProducto" tabindex="-1" aria-labelledby="modalInformeProductoLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalInformeProductoLabel">Informe del Producto</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="formInformeProducto">
                        <div class="mb-3 text-center">
                            <img src="../img/product.png" alt="Producto" style="width: 100px;">
                        </div>
                        <div class="mb-3">
                            <label for="infoNombre" class="form-label">Nombre:</label>
                            <input type="text" class="form-control" id="infoNombre" disabled>
                        </div>
                        <div class="mb-3">
                            <label for="infoPrecio" class="form-label">Precio:</label>
                            <input type="text" class="form-control" id="infoPrecio" disabled>
                        </div>
                        <div class="mb-3">
                            <label for="infoStock" class="form-label">Stock:</label>
                            <input type="number" class="form-control" id="infoStock" disabled>
                        </div>
                        <div class="mb-3">
                            <label for="infoSede" class="form-label">Sedes:</label><br>
                            <input type="radio" id="infoSede1" name="infoSede" value="Sede 1" disabled> Sede 1
                            <input type="radio" id="infoSede2" name="infoSede" value="Sede 2" disabled> Sede 2
                            <input type="radio" id="infoSede3" name="infoSede" value="Sede 3" disabled> Sede 3
                        </div>
                        <div class="mb-3">
                            <label for="infoDescripcion" class="form-label">Descripción:</label>
                            <textarea class="form-control" id="infoDescripcion" rows="3" disabled></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal para editar producto -->
    <div class="modal fade" id="modalEditarProducto" tabindex="-1" aria-labelledby="modalEditarProductoLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalEditarProductoLabel">Editar Producto</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="formEditarProducto">
                        <div class="mb-3 text-center">
                            <img src="../img/product.png" alt="Producto" style="width: 100px;">
                        </div>
                        <div class="mb-3">
                            <label for="nombreEditar" class="form-label">Nombre:</label>
                            <input type="text" class="form-control" id="nombreEditar" required>
                        </div>
                        <div class="mb-3">
                            <label for="precioEditar" class="form-label">Precio:</label>
                            <input type="number" class="form-control" id="precioEditar" required>
                        </div>
                        <div class="mb-3">
                            <label for="stockEditar" class="form-label">Stock:</label>
                            <input type="number" class="form-control" id="stockEditar" required>
                        </div>
                        <div class="mb-3">
                            <label for="sedeEditar" class="form-label">Sedes:</label><br>
                            <input type="radio" id="sede1" name="sedeEditar" value="Sede 1"> Sede 1
                            <input type="radio" id="sede2" name="sedeEditar" value="Sede 2"> Sede 2
                            <input type="radio" id="sede3" name="sedeEditar" value="Sede 3"> Sede 3
                        </div>
                        <div class="mb-3">
                            <label for="descripcionEditar" class="form-label">Descripción:</label>
                            <textarea class="form-control" id="descripcionEditar" rows="3" required></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn btn-primary" onclick="guardarProductoEditado()">Guardar Cambios</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        function guardarProducto() {
            const nombre = document.getElementById('nombre').value;
            const precio = document.getElementById('precio').value;
            const stock = document.getElementById('stock').value;
            const descripcion = document.getElementById('descripcion').value;
            const sede = document.querySelector('input[name="sede"]:checked').value;

            console.log(`Producto guardado: ${nombre}, ${precio}, ${stock}, ${sede}, ${descripcion}`);
            $('#modalAgregarProducto').modal('hide');
            document.getElementById('formAgregarProducto').reset();
        }

        function cargarDatosEditar(nombre, precio, stock, sede, descripcion) {
            document.getElementById('nombreEditar').value = nombre;
            document.getElementById('precioEditar').value = precio;
            document.getElementById('stockEditar').value = stock;
            document.querySelector(`input[name="sedeEditar"][value="${sede}"]`).checked = true;
            document.getElementById('descripcionEditar').value = descripcion;
        }

        function guardarProductoEditado() {
            const nombre = document.getElementById('nombreEditar').value;
            const precio = document.getElementById('precioEditar').value;
            const stock = document.getElementById('stockEditar').value;
            const descripcion = document.getElementById('descripcionEditar').value;
            const sede = document.querySelector('input[name="sedeEditar"]:checked').value;

            console.log(`Producto editado: ${nombre}, ${precio}, ${stock}, ${sede}, ${descripcion}`);
            $('#modalEditarProducto').modal('hide');
        }

        function cargarDatosInforme(nombre, precio, stock, sede, descripcion) {
            document.getElementById('infoNombre').value = nombre;
            document.getElementById('infoPrecio').value = precio;
            document.getElementById('infoStock').value = stock;
            document.querySelector(`input[name="infoSede"][value="${sede}"]`).checked = true;
            document.getElementById('infoDescripcion').value = descripcion;
        }
    </script>

</body>

</html>
