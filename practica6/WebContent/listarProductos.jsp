
<%@ include file="menu.jsp"%>
<div class="contacto">
	<center>
		<h1>
			<legend id="titulo">Lista de Productos</legend>
		</h1>
	</center>
	<div>

		<div id="centrar">
			<table cellpadding="5" cellspacing="5" rules="all" border-bottom="3"
				bordercolor="#23ACF0">
				<c:forEach var="prod" items="${sessionScope.listaProductos}">
					<form
						action="http://localhost:8080/practica6/LlenarCarrito?idproducto=${prod.id}"
						method="post">
					<tr>
						<td><img src="images/nokia5030.gif" width="150px"
							height="100px"></td>
						<td><div align="center" width="300px" min-height="100px">
								<b><c:out value="${prod.nombre}" /></b>
							</div>
							<div align="left" width="300px" min-height="100px">
								<c:out value="${prod.descripcion}" />
							</div>
							<div align="left" width="300px" min-height="100px">
								<b>Precio: </b><u> $<c:out value="${prod.precio}" /></u>
							</div></td>
						<c:if test="${sessionScope.usuario.permisos  == 1}">
							<td align="center">
								<div>
									<a
										href="ProductoController?accion=buscar&producto=<c:out value='${prod.id}' />">Modificar</a>
								</div>
								<div>
									<a
										href="ProductoController?accion=eliminar&producto=<c:out value='${prod.id}'/>">Eliminar</a>
								</div>
							</td>
						</c:if>
						<c:if test="${sessionScope.usuario.permisos  != 1}">
						<td align="center"><input type="image" name="enviar"
							src="images/agregar.png" /></td>
						</c:if>

					</tr>
					</form>
				</c:forEach>
			</table>
		</div>
		<%@ include file="pie.jsp"%>