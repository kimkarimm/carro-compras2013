	<%@ include file="menu.jsp" %>
					<form action="http://localhost:8080/practica6/UsuarioController?acction=modificar"
						method="post">
						<div class="contacto">
							<center>
							<h1>
								<legend id="titulo">Modificar Usuario</legend>
							</h1>
							</center>
							<br>
								<table>
									<tr>
										<td>Nombre:</td>
										<td><input type="text" name="nombre" value="${sessionScope.usuario.nombre }"></td>
									</tr>
									<tr>
										<td>Apellido:</td>
										<td><input type="text" name="apellido" value="${sessionScope.usuario.apellido }"></td>
									</tr>
									<tr>
										<td>E-mail:</td>
										<td><input type="text" name="mail" value="${sessionScope.usuario.mail }"></td>
									</tr>
									<tr>
										<td>Nombre de Usuario:</td>
										<td><input type="text" name="nomUsr" value="${sessionScope.usuario.nombreUsr }">
									</tr>
									<tr>
										<td>password:</td>
										<td><input type="password" name="pass" value="${sessionScope.usuario.password }">
									</tr>
									<tr>
									<tr>
										<td><p></p></td>
									<tr>
									<td>Permisos de administrador: </td>
									<td><input type="radio" name="admin" value="true" checked="checked" /> No</td>
									</tr>
									<tr>
									<td><p></td>
									<td><input type="radio" name="admin" value="false" /> Si</td>
									</tr>
								</table>
								<center>
									<input type="submit" name="aceptar" value="Aceptar">
								</center>
						<br> <br>
					</div>
					</form>
	<%@ include file="pie.jsp" %>