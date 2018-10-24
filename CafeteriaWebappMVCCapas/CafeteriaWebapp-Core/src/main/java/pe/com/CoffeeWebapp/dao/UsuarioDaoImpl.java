/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.com.CoffeeWebapp.dao;

import java.util.List;
import org.springframework.stereotype.Repository;
import pe.com.CoffeeWebapp.SysDataAccess;
import pe.com.CoffeeWebapp.modelo.Usuario;

/**
 *
 * @author HEBERT
 */
@Repository
public class UsuarioDaoImpl extends SysDataAccess<Integer, Usuario> implements UsuarioDaoI {
    
    @SuppressWarnings("unchecked")
    
    @Override
    public List<Usuario> listarEntidad(){
        return getListAll();
    }
    
    @Override
    public List<Usuario> listarEntidadDato(String dato){
        return (List<Usuario>)sessionFactory.getCurrentSession()
                .createQuery("SELECT u from Usuario u WHERE concat(u.nombres,u.apellidos) LIKE ? ")
                .setString(0, "%"+dato+"%")
                .list();                
                }
    
    @Override
    public Usuario buscarEntidadId(int id){
        return getById(id);
    }
    
    @Override
    public void guardarEntidad(Usuario usuario){
        savev(usuario);
    }
    
    @Override
    public void eliminarEntidad(int id){
        delete(id);
    }
    
    public void modificarEntidad(Usuario usuario){
        update(usuario);
    }
}
