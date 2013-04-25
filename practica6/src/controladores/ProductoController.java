package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import clasesDAO.CategoriaDao;
import clasesDAO.ProductoDao;

import modelo.Categoria;
import modelo.Producto;

/**
 * Servlet implementation class ProductoController
 */
public class ProductoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductoController() {
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
				ProductoDao daoproducto = new ProductoDao();
				List<Producto> listaproductos = daoproducto.listar(null);
				sesion.setAttribute("listaProductos", listaproductos);
				getServletContext()
						.getRequestDispatcher("/listarProductos.jsp").forward(
								request, response);
			} else if (accion.equals("listarPorCategoria")) {
				ProductoDao daoproducto = new ProductoDao();
				HttpSession sesion = request.getSession();
				int id = Integer.parseInt(request.getParameter("categoria"));
				List<Producto> listaproducto = daoproducto
						.listar("categoria_id=" + id);
				sesion.setAttribute("listaProductos", listaproducto);
				getServletContext().getRequestDispatcher(
						"/listaPorCategoria.jsp").forward(request, response);
			} else if (accion.equals("buscar")) {
				HttpSession sesion = request.getSession();
				ProductoDao daoproducto = new ProductoDao();
				Producto prod = daoproducto.buscar(Integer.parseInt(request
						.getParameter("producto")));
				if (prod != null) {
					sesion.setAttribute("producto", prod);
					getServletContext().getRequestDispatcher(
							"/modificarProducto.jsp")
							.forward(request, response);
				} else {
					out.println("El producto que usted esta buscando no se encuentra disponible en nuestra base de datos. Por favor, vuelva a intentarlo");
					out.close();
				}
			} else if (accion.equals("guardar")) {
				HttpSession sesion = request.getSession();
				ProductoDao daoproducto = new ProductoDao();
				CategoriaDao daocategoria = new CategoriaDao();
				String nombre = request.getParameter("nombre");
				String descripcion = request.getParameter("descripcion");
				double precio = Double.parseDouble(request
						.getParameter("precio"));
				int cat = Integer.parseInt(request.getParameter("categoria"));
				Categoria categoria = daocategoria.buscar(cat);
				Producto prod = new Producto(nombre, descripcion, precio,
						categoria);
				if (!daoproducto.guardar(prod)) {
					sesion.setAttribute("cargado", false);
				} else {
					sesion.setAttribute("cargado", true);
				}
				List<Producto> listaproductos = daoproducto.listar(null);
				sesion.setAttribute("listaProductos", listaproductos);
				getServletContext().getRequestDispatcher("/altaProducto.jsp")
						.forward(request, response);
			} else if (accion.equals("eliminar")) {
				HttpSession sesion = request.getSession();
				ProductoDao daoproducto = new ProductoDao();
				int id = Integer.parseInt(request.getParameter("producto"));
				Producto prod = daoproducto.buscar(id);
				daoproducto.eliminar(prod);
				List<Producto> listaproductos = daoproducto.listar(null);
				sesion.setAttribute("listaProductos", listaproductos);
				getServletContext()
						.getRequestDispatcher("/listarProductos.jsp").forward(
								request, response);
			} else if (accion.equals("modificar")) {
				HttpSession sesion = request.getSession();
				ProductoDao daoproducto = new ProductoDao();
				CategoriaDao daocategoria = new CategoriaDao();
				int id = Integer.parseInt(request.getParameter("producto"));
				Producto prod = daoproducto.buscar(id);
				int cat = Integer.parseInt(request.getParameter("categoria"));
				Categoria categoria = daocategoria.buscar(cat);
				prod.setCategoria(categoria);
				prod.setDescripcion(request.getParameter("descripcion"));
				prod.setNombre(request.getParameter("nombre"));
				prod.setPrecio(Double.parseDouble(request
						.getParameter("precio")));
				daoproducto.modificar(prod);
				List<Producto> listaproductos = daoproducto.listar(null);
				sesion.setAttribute("listaProductos", listaproductos);
				getServletContext()
						.getRequestDispatcher("/listarProductos.jsp").forward(
								request, response);
			}

		} catch (Exception error) {
			error.printStackTrace();
			response.sendRedirect("web_mensaje.jsp?mensaje="
					+ error.getMessage());
		}
	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}
