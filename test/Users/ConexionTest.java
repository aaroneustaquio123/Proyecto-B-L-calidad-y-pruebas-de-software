package Users;

import java.sql.Connection;
import java.sql.SQLException;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Micha
 */
public class ConexionTest {

    public ConexionTest() {
    }

    @Before
    public void setUp() {
        // Configuración previa si se necesita
    }

    @After
    public void tearDown() {
        // Limpieza después de cada prueba si es necesario
    }

    /**
     * Test of conecta method, of class Conexion.
     */
    @Test
    public void testConecta() {
        try {
            System.out.println("conecta");
            Conexion instance = new Conexion();
            Connection result = instance.conecta();
            
            // Verificar que la conexión no es null
            assertNotNull("La conexión debería ser válida", result);
            
            // Verificar que la conexión está abierta
            assertTrue("La conexión debería estar válida", !result.isClosed());
            
            // Cerrar la conexión después de la prueba
            result.close();
        } catch (SQLException | ClassNotFoundException e) {
            fail("Se produjo una excepción: " + e.getMessage());
        }
    }
}
