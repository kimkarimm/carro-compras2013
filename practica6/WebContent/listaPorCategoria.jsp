<%@ include file="menu.jsp"%>
<script>
	function confirmar() {
		if (confirm('¿Estas seguro que desea eliminar el producto?'))
			return true;
		else
			return false;
	}
</script>

<div class="contacto">
	<center>
		<h1>
			<legend id="titulo">Lista de Productos </legend>
		</h1>
	</center>
	<div>

		<div id="centrar">
			<table cellpadding="5" cellspacing="5" rules="all" border-bottom="3"
				bordercolor="#23ACF0">
				<tr>
					<th>Imagen</th>
					<th>Descripcion General</th>
					<th colspan="2">Opciones</th>
				</tr>
				<c:forEach var="prod" items="${ sessionScope.listaProductos }">
					<form
						action="http://localhost:8080/practica6/LlenarCarrito?idproducto=${prod.id}"
						method="post">
						<tr>
							<td><img src="images/nokia5030.gif" width="150px"
								height="100px"></td>
							<td><div align="center" width="350px" min-height="100px">
									<b><c:out value="${prod.nombre}" /></b>
								</div>
								<div align="left" width="350px" min-height="100px">
									<c:out value="${prod.descripcion}" />
								</div>
								<div align="left" width="350px" min-height="100px">
									<b>Precio: </b><u> $<c:out value="${prod.precio}" /></u>
								</div></td>
							<c:if test="${sessionScope.usuario.permisos  == 1}">
								<td align="center">
									<div>
										<a
											href="ProductoController?accion=buscar&producto=<c:out value='${prod.id}'/>"><input
											type="image" name="modificar" alt="modificar"
											src="images/modificar.gif" /> </a>
									</div>
									<div>
										<a
											href="ProductoController?accion=eliminar&producto=<c:out value='${prod.id}'/>"onclick="return
											confirmar()"><input type="image" name="eliminar"
											src="images/eliminar.gif" />
										</a>
									</div>
								</td>
							</c:if>
							<c:if test="${sessionScope.usuario.permisos  == 0}">
								<td align="center"><input type="image" name="enviar"
									src="images/agregar.png" /></td>
								<td></td>
							</c:if>
					</form>
				</c:forEach>
			</table>
		</div>

	</div>
	<%@ include file="pie.jsp"%>