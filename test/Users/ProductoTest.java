package Users;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Micha
 */
public class ProductoTest {
    
    public ProductoTest() {
    }
    
    @Before
    public void setUp() {
        // Inicializa los recursos necesarios antes de cada prueba (si es necesario)
    }
    
    @After
    public void tearDown() {
        // Limpia los recursos después de cada prueba (si es necesario)
    }

    /**
     * Test of getId method, of class Producto.
     */
    @Test
    public void testGetId() {
        System.out.println("getId");
        Producto instance = new Producto(1, "Producto Test", 10.0, 100, "Sede 1", "Descripción de prueba");
        int expResult = 1;
        int result = instance.getId();
        assertEquals(expResult, result);
    }

    /**
     * Test of setId method, of class Producto.
     */
    @Test
    public void testSetId() {
        System.out.println("setId");
        Producto instance = new Producto();
        instance.setId(2);
        int result = instance.getId();
        assertEquals(2, result);
    }

    /**
     * Test of getNombre method, of class Producto.
     */
    @Test
    public void testGetNombre() {
        System.out.println("getNombre");
        Producto instance = new Producto(1, "Producto Test", 10.0, 100, "Sede 1", "Descripción de prueba");
        String expResult = "Producto Test";
        String result = instance.getNombre();
        assertEquals(expResult, result);
    }

    /**
     * Test of setNombre method, of class Producto.
     */
    @Test
    public void testSetNombre() {
        System.out.println("setNombre");
        Producto instance = new Producto();
        instance.setNombre("Nuevo Nombre");
        String result = instance.getNombre();
        assertEquals("Nuevo Nombre", result);
    }

    /**
     * Test of getPrecio method, of class Producto.
     */
    @Test
    public void testGetPrecio() {
        System.out.println("getPrecio");
        Producto instance = new Producto(1, "Producto Test", 10.0, 100, "Sede 1", "Descripción de prueba");
        double expResult = 10.0;
        double result = instance.getPrecio();
        assertEquals(expResult, result, 0.0);
    }

    /**
     * Test of setPrecio method, of class Producto.
     */
    @Test
    public void testSetPrecio() {
        System.out.println("setPrecio");
        Producto instance = new Producto();
        instance.setPrecio(15.0);
        double result = instance.getPrecio();
        assertEquals(15.0, result, 0.0);
    }

    /**
     * Test of getStock method, of class Producto.
     */
    @Test
    public void testGetStock() {
        System.out.println("getStock");
        Producto instance = new Producto(1, "Producto Test", 10.0, 100, "Sede 1", "Descripción de prueba");
        int expResult = 100;
        int result = instance.getStock();
        assertEquals(expResult, result);
    }

    /**
     * Test of setStock method, of class Producto.
     */
    @Test
    public void testSetStock() {
        System.out.println("setStock");
        Producto instance = new Producto();
        instance.setStock(200);
        int result = instance.getStock();
        assertEquals(200, result);
    }

    /**
     * Test of getSede method, of class Producto.
     */
    @Test
    public void testGetSede() {
        System.out.println("getSede");
        Producto instance = new Producto(1, "Producto Test", 10.0, 100, "Sede 1", "Descripción de prueba");
        String expResult = "Sede 1";
        String result = instance.getSede();
        assertEquals(expResult, result);
    }

    /**
     * Test of setSede method, of class Producto.
     */
    @Test
    public void testSetSede() {
        System.out.println("setSede");
        Producto instance = new Producto();
        instance.setSede("Sede 2");
        String result = instance.getSede();
        assertEquals("Sede 2", result);
    }

    /**
     * Test of getDescripcion method, of class Producto.
     */
    @Test
    public void testGetDescripcion() {
        System.out.println("getDescripcion");
        Producto instance = new Producto(1, "Producto Test", 10.0, 100, "Sede 1", "Descripción de prueba");
        String expResult = "Descripción de prueba";
        String result = instance.getDescripcion();
        assertEquals(expResult, result);
    }

    /**
     * Test of setDescripcion method, of class Producto.
     */
    @Test
    public void testSetDescripcion() {
        System.out.println("setDescripcion");
        Producto instance = new Producto();
        instance.setDescripcion("Nueva Descripción");
        String result = instance.getDescripcion();
        assertEquals("Nueva Descripción", result);
    }
}
