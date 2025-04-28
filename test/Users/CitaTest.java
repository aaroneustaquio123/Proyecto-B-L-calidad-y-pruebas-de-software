/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package Users;

import java.sql.Date;
import java.sql.Time;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

public class CitaTest {

    public CitaTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    // Test validarEstado
    @Test
    public void testValidarEstadoValido() {
        System.out.println("validarEstado (válido)");
        String estado = "Cancelado";
        boolean expResult = true;
        boolean result = Cita.validarEstado(estado);
        if (expResult != result) {
            fail("FALLÓ ESTADO VÁLIDO.");
        }
    }   
       
    // Test nombre de cliente válido (nombre y apellido)
     @Test
     public void testValidarClienteNombreValido() {
        System.out.println("validarClienteNombre (válido)");
        String clienteNombre = "Carlos Mendoza";
        boolean expResult = true;
        boolean result = Cita.validarClienteNombre(clienteNombre);
        if (expResult != result) {
              fail("FALLÓ NOMBRE Y APELLIDO VÁLIDO.");
        }
    }   

    // Test validarHoras
    @Test
    public void testValidarHorasCorrectas() {
        System.out.println("validarHoras (correctas)");
        Time inicio = Time.valueOf("10:00:00");
        Time fin = Time.valueOf("11:00:00");
        boolean expResult = true;
        boolean result = Cita.validarHoras(inicio, fin);
        if (expResult != result) {
            fail("FALLÓ VALIDACIÓN DE HORAS CORRECTAS.");
        }
      }    
    }
