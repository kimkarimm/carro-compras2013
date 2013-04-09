package baseDAO;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.mysql.jdbc.Connection;

public class ManejadorDB {
	
	protected String driver="com.mysql.jdbc.Driver";
	protected String url ="jdbc:mysql://localhost/tienda";
	protected String user ="root";
	protected java.sql.Connection con;
	private Statement sent;
	
	 public ManejadorDB() {
		 try {
			Class.forName(driver).newInstance();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
	}
	
public void conectarDB() throws SQLException {
		con = DriverManager.getConnection(url, user, "");
		sent = con.createStatement();
	}
	


public void cerrarConexion() {
	try {
		con.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
}

public ResultSet executeQuery(String query){
	ResultSet datos;
	try {
		this.conectarDB();
		PreparedStatement sentencia = con.prepareStatement(query);
		datos = sentencia.executeQuery();
		this.cerrarConexion();
		return datos;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println("No se pudo realizar la consulta. " + e.getMessage());
		return null;
	}
	
}

}
