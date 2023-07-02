package org.biblioteca.abm.rest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ejb.EJB;
import javax.ws.rs.Consumes;
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
public class UsuarioNormalizadoRestService {

    @EJB
    private UsuarioSession usuarioSession;

    // GET http://localhost:8080/PROYECTO-REST/rest/usuario/list
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/list")
    public Map<String, Object> listar() throws Exception {
        Map<String, Object> retorno = new HashMap<>();
        retorno.put("success", true);
        retorno.put("result", usuarioSession.buscarTodos());
        return retorno;
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/find/{codigo}")
    public Map<String, Object> buscar(@PathParam("codigo") Integer codigo) throws Exception {
        Map<String, Object> retorno = new HashMap<>();
        retorno.put("success", true);
        retorno.put("result", usuarioSession.buscarPorCodigo(codigo));
        return retorno;
    }

    @PUT
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/update")
    public Map<String, Object> actualizar(Usuario usuario) throws Exception {
        Map<String, Object> retorno = new HashMap<>();
        retorno.put("success", true);
        retorno.put("result", usuarioSession.actualizar(usuario));
        return retorno;
    }

    @DELETE
    @Produces(MediaType.APPLICATION_JSON)
    @Path("/delete/{codigo}")
    public Map<String, Object> borrar(@PathParam("codigo") Integer codigo) throws Exception {
        Map<String, Object> retorno = new HashMap<>();
        retorno.put("success", true);
        usuarioSession.eliminar(codigo);
        return retorno;
    }

    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
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
