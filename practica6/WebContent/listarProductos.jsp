
<%@ include file="menu.jsp"%>
<div class="contacto">
	<center>
		<h1>
			<legend id="titulo">Lista de Productos</legend>
		</h1>
	</center>
	<div>
		<table>
			<tr>
				<th>Nombre</th>
				<th>Descripcion</th>
				<th>Precio</th>
			</tr>
			<c:forEach var="prod" items="${sessionScope.listaProductos}">
				<tr>
					<td width="5%"><c:out value="${ prod.nombre }" /></td>
					<td width="20%"><c:out value="${ prod.descripcion}" /></td>
					<td width="7%"><c:out value="${ prod.precio}" /></td>
					<c:if test="${sessionScope.usuario.permisos  == 1}">
						<td width="4%"><a
							href="ProductoController?accion=buscar&producto=<c:out value='${prod.id}' />">Modificar
						</a></td>
						<td width="4%"><a
							href="ProductoController?accion=eliminar&producto=<c:out value='${prod.id}'/>">Eliminar</a></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
	</div>
	<%@ include file="pie.jsp"%>