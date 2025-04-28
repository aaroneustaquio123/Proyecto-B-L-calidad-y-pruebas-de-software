/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Users;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Nameless
 */
public class Usuario {
    private int id;               
    private String nombre; 
    private String apellido;     
    private String email;         
    private String numero;        
    private String contraseña;    
    private String genero;        
    
    public Usuario() {}
    
     public Usuario(int id, String nombre, String apellido, String email, String numero, String contraseña, String genero) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.numero = numero;
        this.contraseña = contraseña;
        this.genero = genero;
    }
    
     // Getters y Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }
    
    public static boolean validarTelefono(String numero) {
        Pattern p = Pattern.compile("^[9][0-9]{8}$"); 
        Matcher m = p.matcher(numero);
        return m.find(); 
    }
    
    public static boolean validarCorreo(String correo) {
        Pattern p = Pattern.compile("^[a-zA-Z0-9_]+@(gmail\\.com|hotmail\\.com)$"); 
        Matcher m = p.matcher(correo);
        return m.find(); 
    }
}
