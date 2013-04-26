
<%@ include file="menu.jsp"%>
<div class="contacto">
	<center>
		<h1>
			<legend id="titulo">Lista de Usuarios: </legend>
		</h1>
	</center>
	<div>
		<table cellpadding="5" cellspacing="5" rules="all" border-bottom="3" bordercolor="#23ACF0">
			<c:forEach var="usr" items="${ sessionScope.listaUsuarios }">
				<tr>
					<td><c:out value="${ usr.nombre }" /></td>
					<td><c:out value="${ usr.apellido}" /></td>
					<td><c:out value="${ usr.nomusuario}" /></td>
					<td><c:out value="${ usr.mail}" /></td>
					<td width="19%">Admin<c:out value="${ usr.permisos}" /></td>
					<c:if test="${sessionScope.permisos == 1}">
						<td><a
							href="UsuarioController?accion=buscar&usuario=<c:out value='${usr.id}' />">Modificar
						</a></td>
						<td><a
							href="UsuarioController?accion=eliminar&usuario=<c:out value='${usr.id}'/>">Eliminar
						</a></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
	</div>
	<%@ include file="pie.jsp"%>