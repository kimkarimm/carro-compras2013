
<form id="login" action="http://localhost:8080/practica6/Login"
	method="post">
		<fieldset id="body">
			<br>
			<table>
				<tr><fieldset>
					<td>
						<label for="email">Nombre de Usuario </label></td>
					<td><input type="text"
						name="nomUsuario" id="email" /></td>
					</fieldset>
				</tr>
				<tr><fieldset>
					<td>
						<label for="password">Password </label></td>
					<td><input type="password"
						name="pass" id="password" /></td>
					</fieldset>
				</tr>
			 	<tr>
			 		<td><label><input type="submit" id="sing" value="Sign in" /></td>
					<td><input type="checkbox" id="checkbox" />Recordarme</label></td>
				</tr>
			</table>
		</fieldset>
		<span><a href="reestablecerPassword.jsp">Olvidó su contraseña?</a></span>
		</table>
</form>
