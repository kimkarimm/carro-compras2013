package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Comprado;
import modelo.Pedido;
import modelo.Producto;
import modelo.Usuario;
import clasesDAO.PedidoDao;
import clasesDAO.ProductoDao;
import clasesDAO.UsuarioDao;

/**
 * Servlet implementation class PedidoDao
 */
public class PedidoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PedidoController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected String getFecha() {
		Date fecha = new Date();
		String fechaActual = new String((fecha.getDay() + 21) + "/"
				+ (fecha.getMonth() + 1) + "/" + (fecha.getYear() + 1900));
		return fechaActual;
	}

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
				PedidoDao daopedido = new PedidoDao();
				List<Pedido> listaPedidos = daopedido.listar(null);
				sesion.setAttribute("listaPedidos", listaPedidos);
				getServletContext().getRequestDispatcher("/listaPedidos.jsp")
						.forward(request, response);
			} else if (accion.equals("listarPorUsuario")) {
				HttpSession sesion = request.getSession();
				PedidoDao daopedido = new PedidoDao();
				int id = Integer.parseInt(request.getParameter("condicion"));
				List<Pedido> listaPedidosUsuario = daopedido
						.listar("usuario_id=" + id);
				sesion.setAttribute("listaPedidos", listaPedidosUsuario);
				getServletContext().getRequestDispatcher("/listaPedidos.jsp")
						.forward(request, response);
			} else if (accion.equals("buscar")) {
				HttpSession sesion = request.getSession();
				PedidoDao daopedidos = new PedidoDao();
				int id = Integer.parseInt(request.getParameter("pedido"));
				Pedido pedido = daopedidos.buscar(id);
				if (pedido != null) {
					sesion.setAttribute("pedido", pedido);
					getServletContext().getRequestDispatcher("/buscarPedido")
							.forward(request, response);
				} else {
					out.println("El pedido que usted esta buscando no se encuentra disponible en nuestra base de datos. Por favor, vuelva a intentarlo");
					out.close();
				}

			} else if (accion.equals("guardar")) {
				HttpSession sesion = request.getSession();
				UsuarioDao daousuario = new UsuarioDao();
				PedidoDao daopedido = new PedidoDao();
				String estado = request.getParameter("estado");
				int idusuario = Integer.parseInt(request
						.getParameter("usuario"));
				Usuario usuario = daousuario.buscar(idusuario);
				String fechaPedido = new String(getFecha());
				String fechaEntrega = new String(
						(String) request.getParameter("fechaEntrega"));
				ArrayList<Comprado> comprados = new ArrayList<>();
				comprados = (ArrayList<Comprado>) sesion
						.getAttribute("comprados");
				Pedido pedido = new Pedido(fechaPedido, fechaEntrega, usuario,
						comprados);
				daopedido.guardar(pedido);
				ProductoDao daoproducto = new ProductoDao();
				ArrayList<Producto> productos = new ArrayList<>();
				for (Comprado comprado : comprados) {
					Producto producto = new Producto();
					int id = comprado.getId();
					producto = daoproducto.buscar(id);
					productos.add(producto);
				}
				double totalPedido = (double) sesion.getAttribute("total");
				sesion.setAttribute("totalPedido", totalPedido);
				sesion.setAttribute("detalle", comprados);
				double total = 0;
				sesion.setAttribute("total", total);
				ArrayList<Comprado> nuevaCompra = new ArrayList<>();
				sesion.setAttribute("comprados", nuevaCompra);
				getServletContext().getRequestDispatcher("/facturar.jsp")
						.forward(request, response);
			} else if (accion.equals("eliminar")) {
				PedidoDao daopedido = new PedidoDao();
				int id = Integer.parseInt(request.getParameter("pedido"));
				Pedido pedido = daopedido.buscar(id);
				daopedido.eliminar(pedido);
				getServletContext().getRequestDispatcher("/eliminarPedido.jsp")
						.forward(request, response);
			} else if (accion.equals("modificar")) {
				HttpSession sesion = request.getSession();
				PedidoDao daopedido = new PedidoDao();
				ArrayList<Pedido> pedidos = (ArrayList<Pedido>) sesion
						.getAttribute("listaPedidos");
				int i = 0;
				for (Pedido pedido : pedidos) {
					if (!pedido.getEstado().equals("entregado")) {
						String estado = (String) request.getParameter(""
								+ pedido.getId() + "");
						pedidos.get(i).setEstado(estado);
						daopedido.modificar(pedidos.get(i));
					}
					i++;
				}
				sesion.setAttribute("listaPedidos", pedidos);
				getServletContext().getRequestDispatcher("/listaPedidos.jsp")
						.forward(request, response);
			}
		} catch (Exception error) {
			error.printStackTrace();
			response.sendRedirect("vistas/web_mensaje.jsp?mensaje="
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
