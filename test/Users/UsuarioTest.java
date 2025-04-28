/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package Users;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Liz
 */
public class UsuarioTest {
    
    public UsuarioTest() {
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

    /**
     * Test of getId method, of class Usuario.
     */
    @Test
    public void testvalidartelefono() {
    System.out.println("validarTelefono");
    String numero = "978541454";  
    boolean expResult = true; 
    boolean result = Usuario.validarTelefono(numero); 
   if(expResult != result)
        {
            fail("FALLÓ TELÉFONO.");
    }
}
    
    @Test
     public void testValidarCorreoValido() {
        System.out.println("validarCorreo");
        String correo = "usario123@gmail.com"; 
        boolean expResult = true; 
        boolean result = Usuario.validarCorreo(correo);
        if(expResult != result)
        {
            fail("FALLÓ CORREO.");
            //avance liz
    }
    }
    
}
