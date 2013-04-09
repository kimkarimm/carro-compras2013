package clasesDAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.Categoria;
import modelo.Producto;
import baseDAO.ManejadorDB;

public class ProductoDao extends ManejadorDB {

	public ProductoDao() {
		super();
	}

	public void guardar(Producto p) throws SQLException {
		this.conectarDB();
		String sql = "INSERT INTO producto (nombre, descripcion, precio, categoria_id) "
				+ "VALUES ('"
				+ p.getNombre()
				+ "','"
				+ p.getDescripcion()
				+ "',"
				+ p.getPrecio()
				+ ","
				+ p.getCategoria().getId()
				+ ");";
		PreparedStatement sentencia = con.prepareStatement(sql);
		int i = sentencia.executeUpdate();
		this.cerrarConexion();
		if (i == 1) {
			System.out.println("El producto se inserto correctamente.");
		} else {
			System.out.println("Error en la insersion del producto.");
		}
	}

	public List<Producto> listar(String condicion) throws SQLException {
		this.conectarDB();
		String sql = "SELECT * FROM producto";
		if (condicion != null)
			sql += " WHERE " + condicion;
		PreparedStatement sentencia = con.prepareStatement(sql);
		ResultSet datos = sentencia.executeQuery();
		ArrayList<Producto> prods = new ArrayList<Producto>();
		while (datos.next()) {
			Categoria c = new Categoria();
			CategoriaDao catDao = new CategoriaDao();
			c = catDao.buscar(datos.getInt("categoria_id"));
			Producto p = new Producto(datos.getInt("id"),
					datos.getString("nombre"), datos.getString("descripcion"),
					datos.getDouble("precio"), c);
			prods.add(p);
		}
		this.cerrarConexion();
		return prods;
	}

	public void eliminar(Producto p) throws SQLException {
		this.conectarDB();
		String sql = "DELETE FROM producto WHERE id=" + p.getId() + ";";
		PreparedStatement sentencia = con.prepareStatement(sql);
		sentencia.executeUpdate();
		this.cerrarConexion();
	}

	public void modificar(Producto p) throws SQLException {
		this.conectarDB();
		String sql = "UPDATE producto SET nombre='" + p.getNombre()
				+ "', descripcion='" + p.getDescripcion() + "'," + " precio="
				+ p.getPrecio() + ", categoria_id=" + p.getCategoria().getId()
				+ " WHERE id=" + p.getId() + ";";
		PreparedStatement sentencia = con.prepareStatement(sql);
		sentencia.executeUpdate();
		this.cerrarConexion();

	}

	public Producto buscar(int id) throws SQLException {
		this.conectarDB();
		String sql = "SELECT * FROM producto WHERE id=" + id;
		PreparedStatement sentencia = con.prepareStatement(sql);
		ResultSet datos = sentencia.executeQuery();
		Producto p = new Producto();
		if (datos.next()) {
			Categoria c = new Categoria();
			CategoriaDao catDao = new CategoriaDao();
			c = catDao.buscar(datos.getInt("categoria_id"));
			p.setCategoria(c);
			p.setId(datos.getInt("id"));
			p.setNombre(datos.getString("nombre"));
			p.setDescripcion(datos.getString("descripcion"));
			p.setPrecio(datos.getDouble("precio"));
		}
		this.cerrarConexion();
		return p;

	}

}