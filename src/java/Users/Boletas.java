package Users;

import java.sql.Date;
import java.math.BigDecimal;

public class Boletas {
    private int idBoleta;
    private String cliente;
    private Date fecha;
    private BigDecimal totalBruto;
    private BigDecimal igv;
    private BigDecimal totalNeto;
    private String metodoPago;
    private String estado;

    // Constructor
    public Boletas(int idBoleta, String cliente, Date fecha, 
                   BigDecimal totalBruto, BigDecimal igv, 
                   BigDecimal totalNeto, String metodoPago, String estado) {
        this.idBoleta = idBoleta;
        this.cliente = cliente;
        this.fecha = fecha;
        this.totalBruto = totalBruto;
        this.igv = igv;
        this.totalNeto = totalNeto;
        this.metodoPago = metodoPago;
        this.estado = estado;
    }

    // Getters y Setters
    public int getIdBoleta() {
        return idBoleta;
    }

    public void setIdBoleta(int idBoleta) {
        this.idBoleta = idBoleta;
    }

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public BigDecimal getTotalBruto() {
        return totalBruto;
    }

    public void setTotalBruto(BigDecimal totalBruto) {
        this.totalBruto = totalBruto;
    }

    public BigDecimal getIgv() {
        return igv;
    }

    public void setIgv(BigDecimal igv) {
        this.igv = igv;
    }

    public BigDecimal getTotalNeto() {
        return totalNeto;
    }

    public void setTotalNeto(BigDecimal totalNeto) {
        this.totalNeto = totalNeto;
    }

    public String getMetodoPago() {
        return metodoPago;
    }

    public void setMetodoPago(String metodoPago) {
        this.metodoPago = metodoPago;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    // VALIDACIONES NUEVAS (agregadas)
    public static boolean validarMetodoPago(String metodo) {
        return metodo.equalsIgnoreCase("Efectivo") || 
               metodo.equalsIgnoreCase("Tarjeta") || 
               metodo.equalsIgnoreCase("Transferencia");
    }
    
    public static boolean validarEstado(String estado) {
        return estado.equalsIgnoreCase("Pagado") || 
               estado.equalsIgnoreCase("Pendiente")||
                estado.equalsIgnoreCase("Cancelado");                
    }
}
