
<%@ include file="menu.jsp"%>

<script>
function confirmar()
{
	if(confirm('¿Estas seguro que desea eliminar el usuario?'))

	return true;
		else
			return false;
	}
</script>

<div class="contacto">
	<center>
		<h1>
			<legend id="titulo">Lista de Usuarios: </legend>
		</h1>
	</center>
	<div>
		<table cellpadding="5" cellspacing="5" rules="all" border-bottom="3"
			bordercolor="#23ACF0">
				<th width="15%">Nombre</th>
				<th width="15%">Apellido</th>
				<th width="15%">Nombre de Usuario</th>
				<th width="15%">E-mail</th>
				<th width="8%">Permisos de Administrador</th>
				<th colspan="2">Opciones</th>				
			<c:forEach var="usr" items="${ sessionScope.listaUsuarios }">
				<tr>
					<td><c:out value="${ usr.nombre }" /></td>
					<td><c:out value="${ usr.apellido}" /></td>
					<td><c:out value="${ usr.nomusuario}" /></td>
					<td><c:out value="${ usr.mail}" /></td>
					<c:if test="${ usr.permisos==1 }">
						<td>Si</td>
					</c:if>
					<c:if test="${ usr.permisos==0 }">
						<td>No</td>
					</c:if>
						<td align="center"><a
							href="UsuarioController?accion=buscar&usuario=<c:out value='${usr.id}' />" ><input
								type="image" name="modificar" alt="modificar" src="images/modificar.gif" /> </a></td>
						<td align="center"><a
							href="UsuarioController?accion=eliminar&usuario=<c:out value='${usr.id}'/>" onclick="return confirmar()"><input
								type="image" name="enviar" src="images/eliminar.gif" /> </a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<%@ include file="pie.jsp"%>