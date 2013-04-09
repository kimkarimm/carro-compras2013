	<%@ include file="menu.jsp" %>
					<form action="http://localhost:8080/practica6/UsuarioController?accion=guardar"
						method="post">
						<div class="contacto">
							<center>
							<h1>
								<legend id="titulo">Alta Usuario</legend>
							</h1>
							</center>
							<br> <br>
								<table>
									<tr>
										<td>Nombre:</td>
										<td><input type="text" name="nombre" maxlength="30"></td>
									</tr>
									<tr>
										<td>Apellido:</td>
										<td><input type="text" name="apellido" maxlength="30"></td>
									</tr>
									<tr>
										<td>E-mail:</td>
										<td><input type="text" name="mail" maxlength="30"></td>
									</tr>
									<tr>
										<td>Nombre de Usuario:</td>
										<td><input type="text" name="nomUsuario" maxlength="30"></td>
									</tr>
									<tr>
										<td>password:</td>
										<td><input type="password" name="password" maxlength="30"></td>
									</tr>
								</table>
								<p> </p>
								<center>
									<input type="submit" name="aceptar" value="Aceptar">
								</center>
						<br> <br>
					</div>
					</form>
	<%@ include file="pie.jsp" %>