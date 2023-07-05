package org.biblioteca.mov.session;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.biblioteca.entidad.Libro;
import org.biblioteca.entidad.Prestamo;
import org.biblioteca.entidad.PrestamoLibro;

@Stateless
public class PrestamoSession {

	@PersistenceContext
	EntityManager em;
	@EJB
	PrestamoLibroSession pls;

	public List<Prestamo> buscarTodos() throws Exception {
		String jpql = "SELECT o FROM Prestamo o ORDER BY o.numero";
		List<Prestamo> Prestamoes = (List<Prestamo>) em.createQuery(jpql, Prestamo.class).getResultList();
		return Prestamoes;
	}

	public Prestamo buscarPorCodigo(Integer codigo) throws Exception {
		return em.find(Prestamo.class, codigo);
	}

	public Prestamo actualizar(Prestamo prestamo, List<PrestamoLibro> prestamoLibroList) throws Exception {
		Prestamo prestamoFromBD = buscarPorCodigo(prestamo.getNumero());
		if (prestamoFromBD == null) {
			prestamo.setNumero(null);
			prestamo.setSituacion(0);
			em.persist(prestamo);
			em.refresh(prestamo);
		} else {
			prestamo = em.merge(prestamo);
		}
		pls.eliminarPorPrestamo(prestamo.getNumero());
		for (PrestamoLibro prestamoLibro : prestamoLibroList) {
			prestamoLibro.setSecuencia(null);
			prestamoLibro.setPrestamo(prestamo);
			
			em.persist(prestamoLibro);
		}
		for (PrestamoLibro prestamoLibro : prestamoLibroList) {
			  // Obtener el libro asociado al PrestamoLibro
			 em.refresh(prestamoLibro);
			  Libro libro = prestamoLibro.getLibro();
			  em.refresh(libro);
			  // Sumar la cantidad del PrestamoLibro a la cantidad del Libro
			  int nuevaCantidad = libro.getCantidad() - 1;
			  libro.setCantidad(nuevaCantidad);
			 

			  // Actualizar el Libro en la base de datos (si es necesario)
			  em.merge(libro);
			}
		return prestamo;
	}
	
	public Prestamo registrar(Prestamo prestamo, List<PrestamoLibro> prestamoLibroList) throws Exception {
	    prestamo.setNumero(null);
	    prestamo.setSituacion(0);
	    em.persist(prestamo);
	    em.refresh(prestamo);
	    
	    for (PrestamoLibro prestamoLibro : prestamoLibroList) {
	     
	        
	        // Executar o INSERT individual para cada prestamoLibro
	        String sql = "INSERT INTO public.prestamos_libros (pli_prestamo, pli_libro, pli_estado, pli_dias, pli_valor, pli_fecha_devolucion) " +
	                     "VALUES (:prestamo, :libro, :estado, :dias, :valor, :fechaDevolucion)";
	        
	        Query query = em.createNativeQuery(sql);
	        query.setParameter("prestamo",prestamo.getNumero());
	        query.setParameter("libro", prestamoLibro.getLibro().getCodigo());
	        query.setParameter("estado", prestamoLibro.getEstado());
	        query.setParameter("dias", prestamoLibro.getDias());
	        query.setParameter("valor", prestamoLibro.getValor());
	        query.setParameter("fechaDevolucion", prestamoLibro.getFechaDevolucion());
	        
	        query.executeUpdate();
	    }
	    
	    return prestamo;
	}

	public void anular(Integer numero) throws Exception {
		Prestamo prestamo = buscarPorCodigo(numero);
		if (prestamo != null) {
			
			String jpql = "SELECT pl FROM PrestamoLibro pl WHERE pl.prestamo = :prestamo";
			TypedQuery<PrestamoLibro> query = em.createQuery(jpql, PrestamoLibro.class);
			query.setParameter("prestamo", prestamo);

			List<PrestamoLibro> prestamoLibros = query.getResultList();
			
			for (PrestamoLibro prestamoLibro : prestamoLibros) {
				  // Obtener el libro asociado al PrestamoLibro
				  Libro libro = prestamoLibro.getLibro();
				  
				  // Sumar la cantidad del PrestamoLibro a la cantidad del Libro
				  int nuevaCantidad = libro.getCantidad() + 1;
				  libro.setCantidad(nuevaCantidad);

				  // Actualizar el Libro en la base de datos (si es necesario)
				  em.merge(libro);
				}
			prestamo.setSituacion(1);
			prestamo.setObservacion("devuelto");
			em.merge(prestamo);
		}
	}
	
	
}