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
}
