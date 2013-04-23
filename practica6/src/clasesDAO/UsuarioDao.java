package clasesDAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.Comprado;
import modelo.Pedido;
import modelo.Producto;
import modelo.Usuario;
import baseDAO.ManejadorDB;

public class UsuarioDao extends ManejadorDB {

	public UsuarioDao() {
		super();
	}

	public void guardar(Usuario u) throws SQLException {
		this.conectarDB();
		String sql = "INSERT INTO usuario (nombre, apellido, mail, nomusuario, password, permisos) "
				+ "VALUES ('"
				+ u.getNombre()
				+ "', '"
				+ u.getApellido()
				+ "', '"
				+ u.getMail()
				+ "', '"
				+ u.getNomusuario()
				+ "', '"
				+ u.getPassword() + "', '" + u.getPermisos() + "');";
		PreparedStatement sentencia = con.prepareStatement(sql);
		sentencia.executeUpdate();
		this.cerrarConexion();
		int n = 0;
		PedidoDao pedDao = new PedidoDao();
		while (n < u.getPedidos().size()) {
			pedDao.guardar(u.getPedidos().get(n));
		}
	}

	public List<Usuario> listar() throws SQLException {
		this.conectarDB();
		String sql = "SELECT * FROM usuario";
		PreparedStatement sentencia = con.prepareStatement(sql);
		ResultSet datos = sentencia.executeQuery();
		ArrayList<Usuario> users = new ArrayList<Usuario>();
		while (datos.next()) {
			Usuario u = new Usuario();
			u.setId(datos.getInt("id"));
			u.setNombre(datos.getString("nombre"));
			u.setApellido(datos.getString("apellido"));
			u.setMail(datos.getString("mail"));
			u.setNomusuario(datos.getString("nomusuario"));
			u.setPassword(datos.getString("password"));
			u.setPermisos(datos.getInt("permisos"));

			ArrayList<Pedido> peds = new ArrayList<Pedido>();
			sql = "SELECT id FROM pedido WHERE usuario_id=" + u.getId();
			sentencia = con.prepareStatement(sql);
			ResultSet Pedido_users = sentencia.executeQuery();
			PedidoDao pDao = new PedidoDao();
			while (Pedido_users.next()) {
				Pedido p = new Pedido();
				p = pDao.buscar(Pedido_users.getInt("id"));
				peds.add(p);
			}
			u.setPedidos(peds);
			users.add(u);
		}
		this.cerrarConexion();
		return users;
	}

	public void eliminar(Usuario u) throws SQLException {
		this.conectarDB();
		String sql = "DELETE FROM usuario WHERE id=" + u.getId() + ";";
		PreparedStatement sentencia = con.prepareStatement(sql);
		sentencia.executeUpdate();
		sql = "DELETE FROM pedido WHERE usuario_id=" + u.getId() + ";";
		sentencia = con.prepareStatement(sql);
		sentencia.executeUpdate();
		this.cerrarConexion();
	}

	public void modificar(Usuario u) throws SQLException {
		this.conectarDB();
		String sql = "UPDATE usuario SET nombre='" + u.getNombre()
				+ "', apellido='" + u.getApellido() + "'," + " mail='"
				+ u.getMail() + "', nomusuario='" + u.getNomusuario()
				+ "', password='" + u.getPassword() + "', permisos='"
				+ u.getPermisos() + "' WHERE id=" + u.getId() + ";";
		PreparedStatement sentencia = con.prepareStatement(sql);
		sentencia.executeUpdate();
		int n = 0;
		PedidoDao pedido = new PedidoDao();
		while (n < u.getPedidos().size()) {
			pedido.modificar(u.getPedidos().get(n));
			n++;
		}
		this.cerrarConexion();
	}

	public Usuario buscar(int id) throws SQLException {
		this.conectarDB();
		String sql = "SELECT * FROM usuario WHERE id=" + id;
		PreparedStatement sentencia = con.prepareStatement(sql);
		ResultSet datos = sentencia.executeQuery();
		Usuario u = new Usuario();
		if (datos.next()) {
			u.setId(datos.getInt("id"));
			u.setNombre(datos.getString("nombre"));
			u.setApellido(datos.getString("apellido"));
			u.setMail(datos.getString("mail"));
			u.setNomusuario(datos.getString("nomusuario"));
			u.setPassword(datos.getString("password"));
			u.setPermisos(datos.getInt("permisos")); 

			ArrayList<Pedido> pedidos = new ArrayList<Pedido>();

			String sql2 = "SELECT * FROM pedido WHERE id=" + id;
			PreparedStatement sent = con.prepareStatement(sql2);
			ResultSet datos2 = sent.executeQuery();
			Pedido ped = new Pedido();
			while (datos2.next()) {
				ped.setId(datos2.getInt("id"));
				ped.setFechaPedido(datos2.getString("fecha_pedido"));
				ped.setEstado(datos2.getString("estado"));
				ped.setFechaEntrega(datos2.getString("fecha_entrega"));
				ped.setUsuario(u);
				ArrayList<Comprado> productos = new ArrayList<Comprado>();
				sql = "SELECT producto_id, cantidad FROM pedido_has_producto WHERE pedido_id="
						+ ped.getId();
				sentencia = con.prepareStatement(sql);
				ResultSet idProductos = sentencia.executeQuery();
				ProductoDao pDao = new ProductoDao();
				while (idProductos.next()) {
					Producto producto = new Producto();
					producto = pDao.buscar(idProductos.getInt("producto_id"));
					Comprado comprado = new Comprado(producto.getId(),
							producto.getNombre(), producto.getPrecio(),
							idProductos.getInt("cantidad"),
							producto.getPrecio()
									* idProductos.getInt("cantidad"));
					productos.add(comprado);
				}
				ped.setProductos(productos);
			}
			u.setPedidos(pedidos);
		}
		this.cerrarConexion();
		return u;
	}
}