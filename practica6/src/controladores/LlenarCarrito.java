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
			if (!comprados.isEmpty()) {
				Comprado comprado = comprados.get(0);
				int i = 1;
				while ((comprado.getId() != producto.getId())
						&& (!comprados.isEmpty())) {
					comprado = comprados.get(i);
					i++;
				}
				if (comprado.getId() == producto.getId()) {
					comprado.setSubtotal(comprado.getSubtotal()
							+ comprado.getPrecio());
					comprado.setCantidad(comprado.getCantidad() + 1);
					comprados.set(i, comprado);
					double total = (double) sesion.getAttribute("total");
					total = total + producto.getPrecio();
					sesion.setAttribute("total", total);
				}
			}
			if (comprados.isEmpty()) {
				Comprado comp = new Comprado(producto.getId(),
						producto.getNombre(), producto.getPrecio(), 1,
						producto.getPrecio());
				comprados.add(comp);
			}
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
