package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Categoria;

import clasesDAO.CategoriaDao;

/**
 * Servlet implementation class CategoriaCotroller
 */
public class CategoriaController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CategoriaController() {
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
				CategoriaDao daocategoria = new CategoriaDao();
				List<Categoria> listaCategoria = daocategoria.listar();
				sesion.setAttribute("listaCategorias", listaCategoria);
				getServletContext().getRequestDispatcher("/Inicio.jsp")
						.forward(request, response);
			} else if (accion.equals("buscar")) {
				HttpSession sesion = request.getSession();
				CategoriaDao daocategoria = new CategoriaDao();
				int id = Integer.parseInt((request.getParameter("categoria")));
				Categoria categoria = daocategoria.buscar(id);
				if (categoria != null) {
					sesion.setAttribute("categoria", categoria);
					getServletContext().getRequestDispatcher(
							"/modificarCategoria.jsp").forward(request,
							response);
				} else {
					out.println("La categoria que usted esta buscando no se encuentra disponible en nuestra base de datos. Por favor, vuelva a intentarlo");
					out.close();
				}
			} else if (accion.equals("guardar")) {
				HttpSession sesion = request.getSession();
				CategoriaDao daocategoria = new CategoriaDao();
				String nombre = request.getParameter("nombre");
				Categoria categoria = new Categoria(nombre);
				boolean cargado = daocategoria.guardar(categoria);
				if (cargado) {
					sesion.setAttribute("cargada", false);
				} else {
					sesion.setAttribute("cargada", true);
				}
				List<Categoria> listaCategoria = daocategoria.listar();
				sesion.setAttribute("listaCategorias", listaCategoria);
				getServletContext().getRequestDispatcher("/altaCategoria.jsp")
						.forward(request, response);

			} else if (accion.equals("eliminar")) {
				HttpSession sesion = request.getSession();
				CategoriaDao daocategoria = new CategoriaDao();
				int id = Integer.parseInt(request.getParameter("categoria"));
				Categoria categoria = daocategoria.buscar(id);
				daocategoria.eliminar(categoria);
				List<Categoria> listaCategoria = daocategoria.listar();
				sesion.setAttribute("listaCategorias", listaCategoria);
				getServletContext()
						.getRequestDispatcher("/listaCategorias.jsp").forward(
								request, response);
			} else if (accion.equals("modificar")) {
				HttpSession sesion = request.getSession();
				CategoriaDao daocategoria = new CategoriaDao();
				Categoria categoria = daocategoria.buscar(Integer
						.parseInt(request.getParameter("categoria")));
				categoria.setNombre(request.getParameter("nombre"));
				daocategoria.modificar(categoria);
				List<Categoria> listaCategoria = daocategoria.listar();
				sesion.setAttribute("listaCategorias", listaCategoria);
				getServletContext()
						.getRequestDispatcher("/listaCategorias.jsp").forward(
								request, response);
			}
		} catch (Exception error) {
			error.printStackTrace();
			response.sendRedirect("web_mensaje.jsp?mensaje="
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
