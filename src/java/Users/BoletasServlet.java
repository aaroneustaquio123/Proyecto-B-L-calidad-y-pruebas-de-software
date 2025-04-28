/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Users;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Micha
 */
@WebServlet(name = "BoletasServlet", urlPatterns = {"/BoletasServlet"})
public class BoletasServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String accion = request.getParameter("accion");
        
        BoletasDAO boletasDAO = new BoletasDAO();

        try {
            if (accion != null) {
                if (accion.equals("crear")) {
                    String cliente = request.getParameter("cliente");
                    String fechaStr = request.getParameter("fecha");
                    String totalBrutoStr = request.getParameter("totalBruto");
                    String metodoPago = request.getParameter("metodoPago");
                    String estado = request.getParameter("estado");

                    // Validaciones
                    if (cliente == null || fechaStr == null || totalBrutoStr == null ||
                        cliente.trim().isEmpty() || fechaStr.trim().isEmpty() || totalBrutoStr.trim().isEmpty()) {
                        throw new IllegalArgumentException("Campos obligatorios no pueden estar vacíos");
                    }

                    Date fecha = Date.valueOf(fechaStr);
                    BigDecimal totalBruto = new BigDecimal(totalBrutoStr);
                    BigDecimal igv = totalBruto.multiply(new BigDecimal("0.18")); // IGV 18%
                    BigDecimal totalNeto = totalBruto.add(igv);

                    Boletas nuevaBoleta = new Boletas(
                        0, // ID será generado automáticamente
                        cliente,
                        fecha,
                        totalBruto,
                        igv,
                        totalNeto,
                        metodoPago,
                        estado
                    );

                    boletasDAO.create(nuevaBoleta);
                    response.sendRedirect("../../../Proyecto-Barberia-BYL/Administrador/pages/boletas.jsp");

                } else if (accion.equals("editar")) {
                    int idBoleta = Integer.parseInt(request.getParameter("idBoleta"));
                    String cliente = request.getParameter("cliente");
                    Date fecha = Date.valueOf(request.getParameter("fecha"));
                    BigDecimal totalBruto = new BigDecimal(request.getParameter("totalBruto"));
                    String metodoPago = request.getParameter("metodoPago");
                    String estado = request.getParameter("estado");

                    BigDecimal igv = totalBruto.multiply(new BigDecimal("0.18")); // IGV 18%
                    BigDecimal totalNeto = totalBruto.add(igv);

                    Boletas boletaActualizar = new Boletas(
                        idBoleta,
                        cliente,
                        fecha,
                        totalBruto,
                        igv,
                        totalNeto,
                        metodoPago,
                        estado
                    );

                    boletasDAO.update(boletaActualizar);
                    response.sendRedirect("../../../Proyecto-Barberia-BYL/Administrador/pages/boletas.jsp");

                } else if (accion.equals("eliminar")) {
                    int idBoleta = Integer.parseInt(request.getParameter("idBoleta"));
                    boletasDAO.delete(idBoleta);
                    response.sendRedirect("../../../Proyecto-Barberia-BYL/Administrador/pages/boletas.jsp");
                } else {
                    response.sendRedirect("error.jsp");
                }
            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            request.setAttribute("errorMensaje", "Error en los datos ingresados: " + e.getMessage());
            request.getRequestDispatcher("../../../Proyecto-Barberia-BYL/Administrador/pages/boletas.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMensaje", "Ocurrió un error inesperado: " + e.getMessage());
            request.getRequestDispatcher("../../../Proyecto-Barberia-BYL/Administrador/pages/boletas.jsp").forward(request, response);
        }
    }
}
