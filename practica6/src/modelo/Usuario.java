package modelo;

import java.util.ArrayList;

public class Usuario {
	String nombre;
	String apellido;
	String mail;
	String nomusuario;
	String password;
	int permisos;
	int id;
	ArrayList<Pedido> pedidos;

	public Usuario() {
		super();
	}

	public Usuario(String nombre, String apellido, String mail,
			String nomusuario, String password, ArrayList<Pedido> pedidos) {
		super();
		this.nombre = nombre;
		this.apellido = apellido;
		this.mail = mail;
		this.nomusuario = nomusuario;
		this.password = password;
		this.pedidos = pedidos;
		this.permisos = 0;
	}

	public Usuario(String nombre, String apellido, String mail,
			String nomusuario, String password, int id,
			ArrayList<Pedido> pedidos) {
		super();
		this.nombre = nombre;
		this.apellido = apellido;
		this.mail = mail;
		this.nomusuario = nomusuario;
		this.password = password;
		this.id = id;
		this.permisos=0;
		this.pedidos = pedidos;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getNomusuario() {
		return nomusuario;
	}

	public void setNomusuario(String nomusuario) {
		this.nomusuario = nomusuario;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public ArrayList<Pedido> getPedidos() {
		return pedidos;
	}

	public void setPedidos(ArrayList<Pedido> pedidos) {
		this.pedidos = pedidos;
	}

	public int getPermisos() {
		return permisos;
	}

	public void setPermisos(int permisos) {
		this.permisos = permisos;
	}

}
