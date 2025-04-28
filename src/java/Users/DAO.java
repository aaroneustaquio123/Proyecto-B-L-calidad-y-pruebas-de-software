/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Users;

import java.util.LinkedList;

/**
 *
 * @author Nameless
 *  * @param <Gen>
 */
public interface DAO<Gen> {
    public void create(Gen objeto);   
    public void update(Gen objeto);
    public void delete(String codigo);
    public LinkedList<Gen> list();
    
    
}
