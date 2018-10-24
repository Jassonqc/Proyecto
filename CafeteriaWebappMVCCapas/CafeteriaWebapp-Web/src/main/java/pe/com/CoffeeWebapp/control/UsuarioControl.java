/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.com.CoffeeWebapp.control;

import java.util.List;
import java.util.Locale;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import pe.com.CoffeeWebapp.servicio.UsuarioServicioI;
import pe.com.CoffeeWebapp.modelo.Usuario;

/**
 *
 * @author 
 */
@Controller
public class UsuarioControl { 
    
    @Autowired
    private MessageSource messageSource;
    @Autowired
    UsuarioServicioI usuarioServicioI;
    
    @RequestMapping(value = "/locate", method = RequestMethod.GET)
    public String getLocatePage(){
        return "my-locale";
    }

    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public ModelAndView inicio(Locale locale, Map<String,Object> model){
        String welcome=messageSource.getMessage("welcome.greeting", new Object[]{" Nuevo Usuario"}, locale);
        model.put("message", welcome);
            return new ModelAndView("Inicio");
    }
  
    
  
    
    @RequestMapping(value = {"/tabla"}, method = RequestMethod.GET)
    public ModelAndView inicioTres(Map<String,Object> model, @ModelAttribute("modeloUsuario")Usuario usuario,
        BindingResult result){
        List<Usuario> lista = usuarioServicioI.listarEntidad();
        model.put("listaUsuario", lista);
        model.put("noresults", "No users registered yet.");
        model.put("accion", "Add...");
        return new ModelAndView("Tabla");
    }
    
    @RequestMapping(value = {"/searchUser"}, method = RequestMethod.POST)
    public  ModelAndView buscarEntidad(Map<String,Object> model, HttpServletRequest r, @ModelAttribute("modeloUsuario")Usuario usuario,
        BindingResult result){
        String dato=r.getParameter("dato");
        List<Usuario> lista=usuarioServicioI.listarEntidadDato(dato);
        model.put("listaUsuario", lista);
        model.put("noresults", "No matches were found.");
        model.put("accion", "Add...");
        return new ModelAndView("Tabla");
    }   
    
    @RequestMapping(value = {"/deleteUser" }, method = RequestMethod.GET)
    public ModelAndView eliminarEntidad(HttpServletRequest r){
        int idEntidad=Integer.parseInt(r.getParameter("id"));
        usuarioServicioI.eliminarEntidad(idEntidad);
        return new ModelAndView(new RedirectView("/tabla"));
    }
    
    @RequestMapping(value = "/saveUser", method = RequestMethod.POST)
    public ModelAndView guardarEntidad(@ModelAttribute ("modeloUsuario")Usuario usuario, BindingResult result){        
        if(usuario.getIdUsuario() == null)
            usuarioServicioI.guardarEntidad(usuario);
	else
            usuarioServicioI.modificarEntidad(usuario);
        return new ModelAndView(new RedirectView("/tabla"));
    }      
    
    @RequestMapping(value = {"/updateUser" }, method = RequestMethod.GET)
    public ModelAndView actualizarEntidad(HttpServletRequest r, Map<String,Object> model){
        int idEntidad=Integer.parseInt(r.getParameter("id"));       
        List<Usuario> lista = usuarioServicioI.listarEntidad();
        model.put("listaUsuario", lista);
        model.put("modeloUsuario",usuarioServicioI.buscarEntidadId(idEntidad));
        model.put("accion", "Edit...");
        return new ModelAndView("Tabla");
    }
    
}
