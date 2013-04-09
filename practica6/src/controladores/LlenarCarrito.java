package controladores;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.org.apache.xalan.internal.xsltc.runtime.Hashtable;

import modelo.Comprado;
import modelo.Producto;

import clasesDAO.ProductoDao;

/**
 * Servlet implementation class LlenarCarrito
 */
public class LlenarCarrito extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LlenarCarrito() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession sesion = request.getSession();
			List<Producto> productos = (List) sesion
					.getAttribute("listaPorCategoria");
			ArrayList<Comprado> comprados = (ArrayList<Comprado>) sesion
					.getAttribute("comprados");
			double total = (double) sesion.getAttribute("total");
			for (Producto producto : productos) {
				int cantidad = Integer.parseInt((request.getParameter(Integer
						.toString(producto.getId()))));
				if (cantidad != 0) {
					total = total + (producto.getPrecio() * cantidad);
					Comprado comprado = new Comprado(producto.getId(),
							producto.getNombre(), producto.getPrecio(),
							cantidad);
					comprados.add(comprado);
				}
			}
			sesion.setAttribute("total", total);
			sesion.setAttribute("comprados", comprados);
			getServletContext().getRequestDispatcher("/listaPorCategoria.jsp")
					.forward(request, response);
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
