
<%@ include file="menu.jsp"%>
<div class="contacto">
	<center>
		<h1>
			<legend id="titulo">Lista de Categorias</legend>
		</h1>
	</center>
	<div>
		<table cellpadding="5" cellspacing="5" rules="all" border-bottom="3" bordercolor="#23ACF0">
			<tr>
				<th>Nombre</th>
				<th colspan="2">Opciones</th>
			</tr>
			<c:forEach var="cat" items="${sessionScope.listaCategorias}">
				<tr>
					<td width="500px"><c:out value="${cat.nombre}"></c:out></td>
					<c:if test="${sessionScope.permisos == 1}">
						<td width="100px"><a
							href="CategoriaController?accion=buscar&categoria=<c:out value='${cat.id}' />">
								Modificar </a></td>
						<td width="100px"><a
							href="CategoriaController?accion=eliminar&categoria=<c:out value='${cat.id}'/>">Eliminar</a></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
	</div>
	<%@ include file="pie.jsp"%>