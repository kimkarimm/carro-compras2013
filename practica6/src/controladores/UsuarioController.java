package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Pedido;
import modelo.Usuario;
import clasesDAO.PedidoDao;
import clasesDAO.UsuarioDao;

/**
 * Servlet implementation class UsuarioController
 */
public class UsuarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UsuarioController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			PrintWriter out = response.getWriter();
			String accion = request.getParameter("accion");
			if (accion == null || accion.isEmpty()) {
				out.println("El mensaje no reconoce esta accion");
				out.close();
			} else if (accion.equals("listar")) {
				HttpSession sesion = request.getSession();
				UsuarioDao daousuario = new UsuarioDao();
				List<Usuario> listaUsuarios = daousuario.listar();
				sesion.setAttribute("listaUsuarios", listaUsuarios);
				getServletContext().getRequestDispatcher("/listarUsuarios.jsp")
						.forward(request, response);
			} else if (accion.equals("listarPedidos")) {
				UsuarioDao daousuario = new UsuarioDao();
				int id = Integer.parseInt(request.getParameter("nombre"));
				Usuario usuario = daousuario.buscar(id);
				request.setAttribute("listaDePedidos", usuario.getPedidos());
				getServletContext().getRequestDispatcher("/listarPedidos.jsp")
						.forward(request, response);
			} else if (accion.equals("buscar")) {
				HttpSession sesion = request.getSession();
				UsuarioDao daousuario = new UsuarioDao();
				Usuario usuario = daousuario.buscar(Integer.parseInt(request
						.getParameter("usuario")));
				request.setAttribute("usuario", usuario);
				getServletContext().getRequestDispatcher(
						"/modificarUsuario.jsp").forward(request, response);
			} else if (accion.equals("guardar")) {
				HttpSession sesion = request.getSession();
				UsuarioDao daousuario = new UsuarioDao();
				String nombre = request.getParameter("nombre");
				String apellido = request.getParameter("apellido");
				String mail = request.getParameter("mail");
				String nomusuario = request.getParameter("nomUsuario");
				String password = request.getParameter("password");
				ArrayList<Pedido> pedidos = new ArrayList<>();
				Usuario usuario = new Usuario(nombre, apellido, mail,
						nomusuario, password, pedidos);
				if (!daousuario.guardar(usuario)) {
					sesion.setAttribute("cargado", false);
				} else {
					sesion.setAttribute("cargado", true);
					getServletContext()
							.getRequestDispatcher("/altaUsuario.jsp").forward(
									request, response);
				}
			} else if (accion.equals("eliminar")) {
				HttpSession sesion = request.getSession();
				UsuarioDao daousuario = new UsuarioDao();
				int id = Integer.parseInt(request.getParameter("usuario"));
				Usuario usuario = daousuario.buscar(id);
				daousuario.eliminar(usuario);
				getServletContext().getRequestDispatcher("/listaUsuarios.jsp");
				List<Usuario> listaUsuarios = daousuario.listar();
				sesion.setAttribute("listaUsuarios", listaUsuarios);
				getServletContext().getRequestDispatcher("/listarUsuarios.jsp")
						.forward(request, response);
			} else if (accion.equals("modificar")) {
				HttpSession sesion = request.getSession();
				UsuarioDao daousuario = new UsuarioDao();
				PedidoDao daopedidos = new PedidoDao();
				int id = Integer.parseInt(request.getParameter("usuario"));
				Usuario usuario = daousuario.buscar(id);
				if (sesion.getAttribute("permisos").equals(0)) {
					usuario.setNombre(request.getParameter("nombre"));
					usuario.setApellido(request.getParameter("apellido"));
					usuario.setMail(request.getParameter("mail"));
					usuario.setNomusuario(request.getParameter("nomusuario"));
					usuario.setPassword(request.getParameter("password"));
					daousuario.modificar(usuario);
					getServletContext().getRequestDispatcher(
							"/listarUsuarios.jsp").forward(request, response);
				} else {
					usuario.setPermisos(Integer.parseInt(request
							.getParameter("permisos")));
					usuario.setNombre(request.getParameter("nombre"));
					usuario.setApellido(request.getParameter("apellido"));
					usuario.setMail(request.getParameter("mail"));
					usuario.setNomusuario(request.getParameter("nomusuario"));
					usuario.setPassword(request.getParameter("password"));
					daousuario.modificar(usuario);
					List<Usuario> listaUsuarios = daousuario.listar();
					sesion.setAttribute("listaUsuarios", listaUsuarios);
					getServletContext().getRequestDispatcher(
							"/listarUsuarios.jsp").forward(request, response);
				}
			}
		} catch (Exception error) {
			error.printStackTrace();
			response.sendRedirect("/web_mensaje.jsp?mensaje="
					+ error.getMessage());
		}
	}

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
