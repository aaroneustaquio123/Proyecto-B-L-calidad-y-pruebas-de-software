/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Micha
 */
import java.util.Date;

public class Boleta {
    private int id;
    private String proveedor;
    private String item;
    private int stock;
    private String sede;
    private Date fecha;
    private double importeTotal;

    // Constructor
    public Boleta(int id, String proveedor, String item, int stock, String sede, Date fecha, double importeTotal) {
        this.id = id;
        this.proveedor = proveedor;
        this.item = item;
        this.stock = stock;
        this.sede = sede;
        this.fecha = fecha;
        this.importeTotal = importeTotal;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProveedor() {
        return proveedor;
    }

    public void setProveedor(String proveedor) {
        this.proveedor = proveedor;
    }

    public String getItem() {
        return item;
    }

    public void setItem(String item) {
        this.item = item;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getSede() {
        return sede;
    }

    public void setSede(String sede) {
        this.sede = sede;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public double getImporteTotal() {
        return importeTotal;
    }

    public void setImporteTotal(double importeTotal) {
        this.importeTotal = importeTotal;
    }
}
