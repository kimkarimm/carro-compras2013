<ul>
	<li><a href='Index.jsp'><span>Inicio</span></a></li>
	<li class='has-sub'><a href='#'><span>Productos</span></a>
		<ul>
			<li><a href='ProductoController?accion=listar'><span>Listar</span></a></li>
			<li class='last'><a href='altaProducto.jsp'><span>Agregar</span></a></li>
		</ul></li>
	<li class='has-sub'><a href='#'><span>Categoria</span></a>
		<ul>
			<li><a href='listaCategorias.jsp'><span>Listar</span></a></li>
			<li class='last'><a href='altaCategoria.jsp'><span>Agregar</span></a></li>
		</ul></li>
	<li class='has-sub last'><a href='#'><span>Usuarios</span></a>
		<ul>
			<li><a href='UsuarioController?accion=listar'><span>Listar</span></a></li>
			<li class='last'><a href='altaUsuario.jsp'><span>Agregar</span></a></li>
		</ul></li>
	
	<li class='has-sub last'><a href='#'><span>Pedidos</span></a>
		<ul>
			<li><a href='PedidoController?accion=listar'><span>Listar</span></a></li>
		</ul></li>
	<%@ include file="cerrarSesion.jsp" %>
</ul>
