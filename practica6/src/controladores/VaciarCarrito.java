package controladores;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Comprado;

/**
 * Servlet implementation class VaciarCarrito
 */
public class VaciarCarrito extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public VaciarCarrito() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession sesion = request.getSession();
			ArrayList<Comprado> comprados = (ArrayList<Comprado>) sesion
					.getAttribute("comprados");
			double total = (double) sesion.getAttribute("total");
			int id = Integer.parseInt(request.getParameter("idproducto"));
			int i = 0;
			for (Comprado comprado : comprados) {
				if (comprado.getId() == id) {
					comprado.setCantidad(comprado.getCantidad() - 1);
					total = total - comprado.getPrecio();
					if (comprado.getCantidad() == 0) {
						comprados.remove(i);
						break;
					} else {
						comprados.get(i).setCantidad(comprado.getCantidad());
						break;
					}
				}
				i++;
			}
			sesion.setAttribute("total", total);
			sesion.setAttribute("comprados", comprados);
			getServletContext().getRequestDispatcher("/altaPedido.jsp")
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
