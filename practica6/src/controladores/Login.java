package controladores;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.org.apache.xalan.internal.xsltc.runtime.Hashtable;

import modelo.Usuario;

import clasesDAO.UsuarioDao;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession sesion = request.getSession();
			UsuarioDao daousuario = new UsuarioDao();
			List<Usuario> usuarios = daousuario.listar();
			Hashtable users = new Hashtable();
			for (Usuario usuario : usuarios) {
				users.put(usuario.getNomusuario(), usuario);
			}
			String nomUsuario = request.getParameter("nomUsuario");
			String pass = request.getParameter("pass");
			if (users.containsKey(nomUsuario)
					&& ((Usuario) users.get(nomUsuario)).getPassword().equals(pass)) {
				Usuario user = (Usuario) users.get(nomUsuario);
				sesion.setAttribute("usuario", user);
				sesion.setAttribute("permisos", user.getPermisos());
				getServletContext().getRequestDispatcher("/Index.jsp").forward(
						request, response);
			} else {
				String msj= "Error en la codificacion del usuario o contraseña. Intentelo de nuevo.";
				sesion.setAttribute("mensajeError", msj
						);
				getServletContext().getRequestDispatcher("/error.jsp").forward(
						request, response);
			}
		} catch (Exception error) {
			error.printStackTrace();
			response.sendRedirect("/web_mensaje.jsp?mensaje="
					+ error.getMessage());
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}
