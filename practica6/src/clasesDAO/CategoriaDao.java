package clasesDAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import modelo.Categoria;

import baseDAO.ManejadorDB;

public class CategoriaDao extends ManejadorDB{
	
public CategoriaDao() {
	super();
}

public void guardar(Categoria c) throws SQLException{
	this.conectarDB();
	String sql = "INSERT INTO categoria (nombre) VALUES ('"+ c.getNombre()+"')";
	PreparedStatement sentencia = con.prepareStatement(sql);
	int i = sentencia.executeUpdate();
	this.cerrarConexion();
	if(i == 1){
		System.out.println("La categoria se inserto correctamente.");
	}else {
		System.out.println("Error en la insersion de la categoria.");
	}
}

public List<Categoria> listar() throws SQLException {
	this.conectarDB();
	String sql ="SELECT * FROM tienda.categoria";
	PreparedStatement sentencia = con.prepareStatement(sql);
	ResultSet datos = sentencia.executeQuery();
	ArrayList<Categoria> cats = new ArrayList<Categoria>();
	while(datos.next()){
		Categoria c = new Categoria(datos.getInt("id"), datos.getString("nombre"));
		cats.add(c);
	}
	this.cerrarConexion();
	return cats;
}

public void eliminar(Categoria c) throws SQLException{
	this.conectarDB();
	String sql = "DELETE FROM categoria WHERE id="+c.getId()+";";
	PreparedStatement sentencia = con.prepareStatement(sql);
	sentencia.executeUpdate();
	this.cerrarConexion();
}

public void modificar(Categoria c) throws SQLException {
	this.conectarDB();
	String sql = "UPDATE categoria SET nombre='"+c.getNombre()+"' WHERE id="+c.getId()+";";
	PreparedStatement sentencia = con.prepareStatement(sql);
	sentencia.executeUpdate();
	this.cerrarConexion();
	
}

public Categoria buscar(int id) throws SQLException {
	this.conectarDB();
	String sql = "SELECT * FROM tienda.categoria WHERE id="+id;
	PreparedStatement sentencia = con.prepareStatement(sql);
	ResultSet datos = sentencia.executeQuery();
	Categoria cat = new Categoria();
	if(datos.next()){
		cat.setId(datos.getInt("id")); 
		cat.setNombre(datos.getString("nombre"));
	}
	this.cerrarConexion();
	return cat;
	
}
	

}
