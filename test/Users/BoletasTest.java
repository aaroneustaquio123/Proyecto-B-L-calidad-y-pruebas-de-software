package Users;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

public class BoletasTest {
    
    public BoletasTest() {
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

    // Test validarMetodoPago
    @Test
    public void testValidarMetodoPagoValido() {
        System.out.println("validarMetodoPago");
        String metodo = "Tarjeta";
        boolean expResult = true;
        boolean result = Boletas.validarMetodoPago(metodo);
        if (expResult != result) {
            fail("FALLÓ MÉTODO DE PAGO VÁLIDO.");
        }
    }
    
    // Test validarEstado
    @Test
    public void testValidarEstadoValido() {
        System.out.println("validarEstado");
        String estado = "Pagado";
        boolean expResult = true;
        boolean result = Boletas.validarEstado(estado);
        if (expResult != result) {
            fail("FALLÓ ESTADO VÁLIDO.");
        }
      }
    }
    
    
