
<%@ include file="menu.jsp"%>
<div class="contacto">
	<center>
		<h1>
			<legend id="titulo">Lista de Categorias</legend>
		</h1>
	</center>
	<div>
		<table>
			<tr>
				<th>Nombre</th>
				<th>Opciones</th>
			</tr>
			<c:forEach var="cat" items="${sessionScope.listaCategorias}">
				<tr>
					<td width="3%"><c:out value="${cat.nombre}"></c:out></td>
					<c:if test="${sessionScope.permisos == 1}">
						<td width="1%"><a
							href="CategoriaController?accion=buscar&categoria=<c:out value='${cat.id}' />">
								Modificar </a></td>
						<td width="1%"><a
							href="CategoriaController?accion=eliminar&categoria=<c:out value='${cat.id}'/>">Eliminar</a></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
	</div>
	<%@ include file="pie.jsp"%>