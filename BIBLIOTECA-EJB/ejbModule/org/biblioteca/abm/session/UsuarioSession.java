package org.biblioteca.abm.session;

import java.util.List;

import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.biblioteca.entidad.Usuario;

@Stateless
@LocalBean
public class UsuarioSession {

    @PersistenceContext
    EntityManager em;

    public UsuarioSession() {
        // Constructor por defecto
    }

    public List<Usuario> buscarTodos() throws Exception {
        String jpql = "SELECT o FROM Usuario o ORDER BY o.codigo";
        TypedQuery<Usuario> query = em.createQuery(jpql, Usuario.class);
        return query.getResultList();
    }

    public Usuario buscarPorCodigo(Integer codigo) throws Exception {
        return em.find(Usuario.class, codigo);
    }

    public Usuario actualizar(Usuario usuario) throws Exception {
        Usuario usuarioActualizado = em.merge(usuario);
        return usuarioActualizado;
    }

    public void eliminar(Integer codigo) throws Exception {
        Usuario usuario = buscarPorCodigo(codigo);
        if (usuario != null) {
            em.remove(usuario);
        }
    }

    public Usuario buscarPorUsernameAndPassword(String username, String password) throws Exception {
        String jpql = "SELECT u FROM Usuario u WHERE u.username = :username AND u.password = :password";
        TypedQuery<Usuario> query = em.createQuery(jpql, Usuario.class);
        query.setParameter("username", username);
        query.setParameter("password", password);
        List<Usuario> resultList = query.getResultList();
        if (!resultList.isEmpty()) {
            return resultList.get(0);
        } else {
            return null;
        }
    }
    public Usuario buscarPorCorreo(String username, String pregunta,String respuesta,String password ) throws Exception {
       
    	TypedQuery<Usuario> query = em.createQuery("SELECT u FROM Usuario u WHERE u.username = :username AND u.pregunta = :pregunta AND u.respuesta = :respuesta"
    			, Usuario.class);
    	query.setParameter("username", username);
    	query.setParameter("pregunta", pregunta);
    	query.setParameter("respuesta", respuesta);
    	query.setMaxResults(1);
    	Usuario usuario=null;
    	try {
    		usuario = query.getSingleResult();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
    	 

    	if (usuario != null) {
    	    // Actualizar el password
    	    usuario.setPassword(password);
    	    Usuario usua  =em.merge(usuario);
    	    
    	    if (usua!=null)
    	    	return usua;
    	    else
    	    	return null;
    	    
    	}
    	  else
  	    	return null;
    	
    	
    
    }
}
