
<%@ include file="menu.jsp"%>
<script>
	function confirmar() {
		if (confirm('¿Estas seguro que desea eliminar la categoria?'))
			return true;
		else
			return false;
	}
</script>


<div class="contacto">
	<center>
		<h1>
			<legend id="titulo">Lista de Categorias</legend>
		</h1>
	</center>
	<div>
		<table cellpadding="5" cellspacing="5" rules="all" border-bottom="3"
			bordercolor="#23ACF0">
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
								<input type="image" name="modificar" alt="modificar"
								src="images/modificar.gif" />
						</a></td>
						<td width="100px"><a
							href="CategoriaController?accion=eliminar&categoria=<c:out value='${cat.id}'/>"
							onclick="return confirmar()"><input type="image"
								name="enviar" src="images/eliminar.gif" /> </a></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
	</div>
	<%@ include file="pie.jsp"%>