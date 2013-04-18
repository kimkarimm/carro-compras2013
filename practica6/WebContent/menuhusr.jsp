	<ul>
		<li><a href='Index.jsp'><span>Inicio</span></a></li>
		<li class='has-sub'><a href='#'><span>Productos</span></a>
			<ul>
				<li><a href='ProductoController?accion=listar'><span>Listar</span></a></li>
			</ul></li>
		<li class='has-sub last'><a href='#'><span>Usuarios</span></a>
			<ul>
				<li><a href="UsuarioController?accion=buscar&usuario=${sessionScope.usuario.id}">Modificar</a></ahref></li>
			</ul></li>
		<li class='has-sub last'><a href='#'><span>Pedidos</span></a>
		<ul>
			<li><a href='PedidoController?accion=listarPorUsuario&condicion=${sessionScope.usuario.id}'><span>Listar</span></a></li>
		</ul></li>
		
		<form action="http://localhost:8080/practica6/CerrarSesion">
			<input id=posLogin type="submit" name="cerrarSesion" value="Cerrar Sesion">
		</form>
	</ul>