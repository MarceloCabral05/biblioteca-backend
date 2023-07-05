package org.biblioteca.entidad;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "usuarios")
public class Usuario implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "usu_codigo")
	private Integer codigo;
	@Column(name = "usu_username")
	private String username;
	@Column(name = "usu_password")
	private String password;
	@Column(name = "usu_pregunta")
	private String pregunta;

	@Column(name = "usu_respuesta")
	private String respuesta;

	public Usuario() {
	}

	public Integer getCodigo() {
		return codigo;
	}

	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}

	public String getUsername() {
		return username;
	}

	public void setPregunta(String pregunta) {
		this.pregunta = pregunta;
	}
	public String getPregunta() {
		return pregunta;
	}
	public void setRespuesta(String respuesta) {
		this.respuesta = respuesta;
	}
	public String getRespuesta() {
		return respuesta;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
