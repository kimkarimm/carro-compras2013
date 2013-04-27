package clasesDAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import baseDAO.ManejadorDB;

import modelo.Comprado;
import modelo.Pedido;
import modelo.Producto;
import modelo.Usuario;

public class PedidoDao extends ManejadorDB {

	public PedidoDao() {
		super();
	}

	public void guardar(Pedido p) throws SQLException {
		this.conectarDB();
		String sql = "INSERT INTO pedido (fecha_pedido, estado, fecha_entrega, usuario_id) "
				+ "VALUES ('"
				+ p.getFechaPedido()
				+ "', '"
				+ p.getEstado()
				+ "', '"
				+ p.getFechaEntrega()
				+ "', "
				+ p.getUsuario().getId()
				+ ");";
		PreparedStatement sentencia = con.prepareStatement(sql,
				Statement.RETURN_GENERATED_KEYS);
		sentencia.executeUpdate();
		ResultSet keys = sentencia.getGeneratedKeys();
		keys.next();
		int id = keys.getInt(1);
		for (Comprado comprado : p.getProductos()) {
			sql = "INSERT INTO pedido_has_producto (pedido_id, producto_id, cantidad) VALUES ("
					+ id
					+ ", "
					+ comprado.getId()
					+ ", "
					+ comprado.getCantidad() + ");";
			sentencia = con.prepareStatement(sql);
			sentencia.executeUpdate();
		}
		this.cerrarConexion();
	}

	public List<Pedido> listar(String condicion) throws SQLException {
		this.conectarDB();
		String sql = " SELECT * FROM pedido";
		if (condicion != null)
			sql += " WHERE " + condicion;
		PreparedStatement sentencia = con.prepareStatement(sql);
		ResultSet datos = sentencia.executeQuery();
		ArrayList<Pedido> ped = new ArrayList<Pedido>();
		while (datos.next()) {
			Usuario u = new Usuario();
			UsuarioDao userDao = new UsuarioDao();
			u = userDao.buscar(datos.getInt("usuario_id"));
			Pedido p = new Pedido();
			p.setId(datos.getInt("id"));
			p.setFechaPedido(datos.getString("fecha_pedido"));
			p.setEstado(datos.getString("estado"));
			p.setFechaEntrega(datos.getString("fecha_entrega"));
			p.setUsuario(u);
			ArrayList<Comprado> prods = new ArrayList<Comprado>();
			sql = "SELECT producto_id, cantidad FROM pedido_has_producto WHERE pedido_id="
					+ p.getId();
			sentencia = con.prepareStatement(sql);
			ResultSet idProductos = sentencia.executeQuery();
			ProductoDao pDao = new ProductoDao();
			while (idProductos.next()) {
				Producto product = new Producto();
				product = pDao.buscar(idProductos.getInt("producto_id"));
				Comprado comprado = new Comprado(product.getId(),
						product.getNombre(), product.getPrecio(),
						idProductos.getInt("cantidad"), product.getPrecio()
								* idProductos.getInt("cantidad"));
				prods.add(comprado);
			}
			p.setProductos(prods);
			ped.add(p);
		}
		this.cerrarConexion();
		return ped;
	}

	public void eliminar(Pedido p) throws SQLException {
		this.conectarDB();
		String sql = "DELETE FROM pedido WHERE id=" + p.getId() + ";";
		PreparedStatement sentencia = con.prepareStatement(sql);
		sentencia.executeUpdate();
		sql = "DELETE FROM pedido_has_producto WHERE pedido_id=" + p.getId()
				+ ";";
		sentencia = con.prepareStatement(sql);
		sentencia.executeUpdate();
		this.cerrarConexion();
	}

	public void modificar(Pedido p) throws SQLException {
		this.conectarDB();
		String sql = "UPDATE pedido SET fecha_pedido='" + p.getFechaPedido()
				+ "', estado='" + p.getEstado() + "'," + " fecha_entrega='"
				+ p.getFechaEntrega() + "', usuario_id="
				+ p.getUsuario().getId() + " WHERE id=" + p.getId() + ";";
		PreparedStatement sentencia = con.prepareStatement(sql);
		sentencia.executeUpdate();
		this.cerrarConexion();
	}

	public Pedido buscar(int id) throws SQLException {
		this.conectarDB();
		String sql = "SELECT * FROM pedido WHERE id=" + id;
		PreparedStatement sentencia = con.prepareStatement(sql);
		ResultSet datos = sentencia.executeQuery();
		Pedido ped = new Pedido();
		if (datos.next()) {
			Usuario u = new Usuario();
			UsuarioDao userDao = new UsuarioDao();
			u = userDao.buscar(datos.getInt("usuario_id"));
			ped.setId(datos.getInt("id"));
			ped.setFechaPedido(datos.getString("fecha_pedido"));
			ped.setEstado(datos.getString("estado"));
			ped.setFechaEntrega(datos.getString("fecha_entrega"));
			ped.setUsuario(u);
			ArrayList<Comprado> prods = new ArrayList<Comprado>();
			sql = "SELECT producto_id, cantidad FROM pedido_has_producto WHERE pedido_id="
					+ ped.getId();
			sentencia = con.prepareStatement(sql);
			ResultSet idProductos = sentencia.executeQuery();
			ProductoDao pDao = new ProductoDao();
			while (idProductos.next()) {
				Producto product = new Producto();
				product = pDao.buscar(idProductos.getInt("producto_id"));
				Comprado comprado = new Comprado(product.getId(),
						product.getNombre(), product.getPrecio(),
						idProductos.getInt("cantidad"), product.getPrecio()
								* idProductos.getInt("cantidad"));
				prods.add(comprado);
			}
			ped.setProductos(prods);
		}
		this.cerrarConexion();
		return ped;
	}
}
