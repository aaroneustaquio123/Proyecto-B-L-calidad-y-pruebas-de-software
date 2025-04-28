<%-- 
    Document   : Frame_Generador_Boletas
    Created on : 19 oct. 2024, 1:47:32 p. m.
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
        <style>
            #mensaje {
                display: none;
            }

            /* Estilos modernos para botones */
            .btn {
                transition: background-color 0.3s, transform 0.2s;
                border-radius: 0.5rem;
            }

            .btn-primary {
                background-color: #007bff;
                border: none;
            }

            .btn-primary:hover {
                background-color: #0056b3;
                transform: scale(1.05);
            }

            .btn-danger {
                background-color: #dc3545;
                border: none;
            }

            .btn-danger:hover {
                background-color: #c82333;
                transform: scale(1.05);
            }

            .btn-close {
                transition: transform 0.2s;
            }

            .btn-close:hover {
                transform: scale(1.1);
            }
        </style>
    </head>
    <body>

        <div class="container-fluid">
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

            <div class="col-md-10 main-content">
                <h1 class="my-5">Sistema Gestión de Barbería</h1>
                <h2 class="my-5">Gestión de Boletas</h2>

                <div id="mensaje" class="alert alert-success" role="alert">
                    El registro ha sido eliminado exitosamente.
                </div>

                <div class="d-flex align-items-center justify-content-start mt-3">

                </div>

                <div class="mt-3">
                    <button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#nuevoRegistroModal">Nuevo</button>
                </div>

                <div class="mt-5">
                    <div class="row mb-4 bg-secondary p-3" style="margin: 0px 0px !important;">
                        <div class="col">
                            <label for="sede" class="text-white">Sede:</label>
                            <select id="sede" class="form-select">
                                <option value="">Todos</option>
                                <option value="1">Sede 1</option>
                                <option value="2">Sede 2</option>
                            </select>
                        </div>
                        <div class="col">
                            <label for="item" class="text-white">Item:</label>
                            <select id="item" class="form-select">
                                <option value="">Todas</option>
                                <option value="1">Shampoo</option>
                                <option value="2">Cera</option>
                            </select>
                        </div>
                        <div class="col">
                            <label for="proveedor" class="text-white">Proveedor:</label>
                            <select id="proveedor" class="form-select">
                                <option value="">Todas</option>
                                <option value="1">Proveedor 1</option>
                                <option value="2">Proveedor 2</option>
                            </select>
                        </div>
                        <div class="col">
                            <label for="mes" class="text-white">Mes:</label>
                            <select id="mes" class="form-select">
                                <option value="">Todos</option>
                                <option value="1">Enero</option>
                                <option value="2">Febrero</option>
                                <option value="3">Marzo</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="table-responsive bg-white">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Nº</th>
                                <th>Proveedor</th>
                                <th>Item</th>
                                <th>Stock</th>
                                <th>Sede</th>
                                <th>Fecha</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="expandable" data-bs-toggle="collapse" data-bs-target="#detalle1" aria-expanded="false">
                                <td>1</td>
                                <td>Proveedor 1</td>
                                <td>Shampoo</td>
                                <td>34</td>
                                <td>Sede 1</td>
                                <td>2024-09-21</td>
                                <td><button class="btn btn-danger btn-sm" onclick="eliminarRegistro()">Eliminar</button></td>
                            </tr>
                            <tr id="detalle1" class="collapse">
                                <td colspan="6">
                                    <strong>Detalles:</strong> N° de Boleta: 001145 <br> Recibido por: Empleado 2
                                </td>
                            </tr>
                            <tr class="expandable" data-bs-toggle="collapse" data-bs-target="#detalle2" aria-expanded="false">
                                <td>2</td>
                                <td>Proveedor 2</td>
                                <td>Cera</td>
                                <td>69</td>
                                <td>Sede 2</td>
                                <td>2024-01-27</td>
                                <td><button class="btn btn-danger btn-sm" onclick="eliminarRegistro()">Eliminar</button></td>
                            </tr>
                            <tr id="detalle2" class="collapse">
                                <td colspan="6">
                                    <strong>Detalles:</strong> N° de Boleta: 002145 <br> Recibido por: Empleado 1
                                </td>
                            </tr>
                            <tr class="expandable" data-bs-toggle="collapse" data-bs-target="#detalle3" aria-expanded="false">
                                <td>3</td>
                                <td>Proveedor 3</td>
                                <td>Acondicionar</td>
                                <td>53</td>
                                <td>Sede 1</td>
                                <td>2024-05-12</td>
                                <td><button class="btn btn-danger btn-sm" onclick="eliminarRegistro()">Eliminar</button></td>
                            </tr>
                            <tr id="detalle3" class="collapse">
                                <td colspan="6">
                                    <strong>Detalles:</strong> N° de Boleta: 005844 <br> Recibido por: Empleado 4
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- Modal para nuevo registro -->
                <div class="modal fade" id="nuevoRegistroModal" tabindex="-1" aria-labelledby="nuevoRegistroModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="nuevoRegistroModalLabel">Nuevo Registro</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label for="selectProveedor" class="form-label">Seleccionar Proveedor:</label>
                                    <select id="selectProveedor" class="form-select">
                                        <option value="1">Proveedor 1</option>
                                        <option value="2">Proveedor 2</option>
                                        <option value="3">Proveedor 3</option>
                                        <option value="4">Proveedor 4</option>
                                        <option value="5">Proveedor 5</option>
                                        <option value="6">Proveedor 6</option>
                                    </select>
                                </div>

                                <div class="mb-3">
                                    <label for="selectItem" class="form-label">Seleccionar Item:</label>
                                    <select id="selectItem" class="form-select">
                                        <option value="1">Shampoo</option>
                                        <option value="2">Acondicionador</option>
                                        <option value="3">Crema de afeitar</option>
                                        <option value="4">Gel de cabello</option>
                                        <option value="5">Espuma de afeitar</option>
                                        <option value="6">Bálsamo para después del afeitado</option>
                                        <option value="7">Tijeras</option>
                                    </select>
                                </div>

                                <div class="row mb-3">
                                    <div class="col">
                                        <label for="stock" class="form-label">Stock:</label>
                                        <input type="number" class="form-control" id="stock" placeholder="Ingrese el stock">
                                    </div>
                                    <div class="col">
                                        <label class="form-label">Sedes:</label>
                                        <div>
                                            <input type="radio" id="sede1" name="sede" value="Sede 1">
                                            <label for="sede1">Sede 1</label>
                                            <input type="radio" id="sede2" name="sede" value="Sede 2">
                                            <label for="sede2">Sede 2</label>
                                            <input type="radio" id="sede3" name="sede" value="Sede 3">
                                            <label for="sede3">Sede 3</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col">
                                        <label for="fecha" class="form-label">Fecha:</label>
                                        <input type="date" class="form-control" id="fecha">
                                    </div>
                                    <div class="col">
                                        <label for="importe" class="form-label">Importe Total:</label>
                                        <input type="text" class="form-control" id="importe" placeholder="Precio a colocar">
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                <button type="button" class="btn btn-primary">Aceptar</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
                                    function eliminarRegistro() {
                                        // Mostrar el mensaje de éxito
                                        document.getElementById('mensaje').style.display = 'block';
                                        // Ocultar el mensaje después de 3 segundos
                                        setTimeout(function () {
                                            document.getElementById('mensaje').style.display = 'none';
                                        }, 3000);
                                    }
    </script>
</body>
</html>
