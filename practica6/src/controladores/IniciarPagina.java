package controladores;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.org.apache.xalan.internal.xsltc.runtime.Hashtable;

import modelo.Comprado;
import modelo.Pedido;
import modelo.Producto;

/**
 * Servlet implementation class IniciarPagina
 */
public class IniciarPagina extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IniciarPagina() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession sesion = request.getSession();
			if (sesion.getAttribute("pedido") == null) {
				Pedido pedido = new Pedido();
				sesion.setAttribute("pedido", pedido);
			}
			if (sesion.getAttribute("comprados") == null) {
				ArrayList<Comprado> comprados = new ArrayList<>();
				sesion.setAttribute("comprados", comprados);
			}
			if (sesion.getAttribute("total") == null) {
				double total = 0;
				sesion.setAttribute("total", total);
			}
			getServletContext().getRequestDispatcher(
					"/CategoriaController?accion=listar").forward(request,
					response);
		} catch (Exception error) {
			error.printStackTrace();
			response.sendRedirect("vistas/web_mensaje.jsp?mensaje="
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
