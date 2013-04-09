package modelo;

import java.util.ArrayList;

public class Pedido {
	int id;
	String fechaPedido;
	String fechaEntrega;
	String estado;
	Usuario usuario;
	ArrayList<Comprado> productos;

	public Pedido() {
		super();
	}

	public Pedido(String fechaPedido2, String fechaEntrega2, Usuario usuario,
			ArrayList<Comprado> productos) {
		super();
		this.fechaPedido = fechaPedido2;
		this.fechaEntrega = fechaEntrega2;
		this.estado = "pendiente";
		this.usuario = usuario;
		this.productos = productos;
	}

	public Pedido(int id, String fechaPedido2, String fechaEntrega2,
			Usuario usuario, ArrayList<Comprado> productos) {
		super();
		this.id = id;
		this.fechaPedido = fechaPedido2;
		this.fechaEntrega = fechaEntrega2;
		this.estado = "pendiente";
		this.usuario = usuario;
		this.productos = productos;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFechaPedido() {
		return fechaPedido;
	}

	public void setFechaPedido(String fechaPedido2) {
		this.fechaPedido = fechaPedido2;
	}

	public String getFechaEntrega() {
		return fechaEntrega;
	}

	public void setFechaEntrega(String fechaEntrega2) {
		this.fechaEntrega = fechaEntrega2;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public ArrayList<Comprado> getProductos() {
		return productos;
	}

	public void setProductos(ArrayList<Comprado> productos) {
		this.productos = productos;
	}

}
