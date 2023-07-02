package org.biblioteca.abm.rest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ejb.EJB;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.biblioteca.abm.session.UsuarioSession;
import org.biblioteca.entidad.Usuario;

@Path("usuario")
public class UsuarioRestService {

    @EJB
    private UsuarioSession usuarioSession;

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/list")
    public List<Usuario> listar() throws Exception {
        return usuarioSession.buscarTodos();
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/find/{codigo}")
    public Usuario buscar(@PathParam("codigo") Integer codigo) throws Exception {
        return usuarioSession.buscarPorCodigo(codigo);
    }

    @PUT
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/update")
    public Usuario actualizar(Usuario usuario) throws Exception {
        return usuarioSession.actualizar(usuario);
    }

    @DELETE
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/delete/{codigo}")
    public void borrar(@PathParam("codigo") Integer codigo) throws Exception {
        usuarioSession.eliminar(codigo);
    }

    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/login")
    public Map<String, Object> login(Usuario usuario) {
        Map<String, Object> retorno = new HashMap<>();

        try {
            Usuario usuarioEncontrado = usuarioSession.buscarPorUsernameAndPassword(usuario.getUsername(), usuario.getPassword());
            if (usuarioEncontrado != null) {
                retorno.put("success", true);
                retorno.put("message", "Inicio de sesión exitoso");
                retorno.put("usuario", usuarioEncontrado);
            } else {
                retorno.put("success", false);
                retorno.put("message", "Nombre de usuario o contraseña incorrectos");
            }
        } catch (Exception e) {
            retorno.put("success", false);
            retorno.put("error", e.getMessage());
        }

        return retorno;
    }
}
