
<%@ include file="menu.jsp"%>
<form
	action="http://localhost:8080/practica6/UsuarioController?accion=modificar&usuario=${usuario.id}"
	method="post">
	<div class="contacto">
		<center>
			<h1>
				<legend id="titulo">Modificar Usuario</legend>
			</h1>
		</center>
		<table>
			<tr>
				<td>Nombre:</td>
				<td><input type="text" name="nombre" value="${usuario.nombre}" /></td>
			</tr>
			<tr>
				<td>Apellido:</td>
				<td><input type="text" name="apellido"
					value="${usuario.apellido}" /></td>
			</tr>
			<tr>
				<td>E-mail:</td>
				<td><input type="text" name="mail" value="${usuario.mail}" /></td>
			</tr>
			<tr>
				<td>Nombre de Usuario:</td>
				<td><input type="text" name="nomusuario"
					value="${usuario.nomusuario}" /></td>
			</tr>
			<tr>
				<td>password:</td>
				<td><input type="password" name="password"
					value="${usuario.password}" /></td>
			</tr>
			<td><p></p></td>
			<c:if test="${ sessionScope.permisos == 1 }">
				<tr>
					<td>Permisos de administrador:</td>
					<td><input type="radio" name="permisos" value="0" /> No</td>
				</tr>
				<tr>
					<td><p></td>
					<td><input type="radio" name="permisos" value="1" /> Si</td>
				</tr>
			</c:if>
		</table>
		<center>
			<input type="submit" name="aceptar" value="Aceptar">
		</center>
		<br> <br>
	</div>
</form>
<%@ include file="pie.jsp"%>