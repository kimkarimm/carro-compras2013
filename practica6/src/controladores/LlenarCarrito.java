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
			ArrayList<Comprado> comprados = (ArrayList<Comprado>) sesion
					.getAttribute("comprados");
			ProductoDao daoproducto = new ProductoDao();
			int id = Integer.parseInt(request.getParameter("idproducto"));
			Producto producto = daoproducto.buscar(id);
			int i = 1;
			if (!comprados.isEmpty()) {
				for (Comprado comprado : comprados) {
					if (comprado.getId() == producto.getId()) {
						int pos = i - 1;
						comprados.get(pos).setSubtotal(
								comprados.get(pos).getSubtotal()
										+ producto.getPrecio());
						comprados.get(pos).setCantidad(
								comprados.get(pos).getCantidad() + 1);
						double total = (double) sesion.getAttribute("total");
						total = total + producto.getPrecio();
						sesion.setAttribute("total", total);
						break;
					}
					i++;
				}
			}
			if ((comprados.isEmpty()) || (i > comprados.size())) {
				Comprado comp = new Comprado(producto.getId(),
						producto.getNombre(), producto.getPrecio(), 1,
						producto.getPrecio());
				double total = (double) sesion.getAttribute("total");
				total = total + producto.getPrecio();
				sesion.setAttribute("total", total);
				comprados.add(comp);
			}
			sesion.setAttribute("comprados", comprados);
			getServletContext().getRequestDispatcher("/listarProductos.jsp")
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
