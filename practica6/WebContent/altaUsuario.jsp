
<%@ include file="menu.jsp"%>

<script type="text/javascript">
	function checkForm(form) {
		if (form.pwd1.value != "" && form.pwd1.value == form.pwd2.value) {
			if (form.pwd1.value.length < 6) {
				alert("Error: Password must contain at least six characters!");
				form.pwd1.focus();
				return false;
			}
			if (form.pwd1.value == form.username.value) {
				alert("Error: Password must be different from Username!");
				form.pwd1.focus();
				return false;
			}
			re = /[0-9]/;
			if (!re.test(form.pwd1.value)) {
				alert("Error: password must contain at least one number (0-9)!");
				form.pwd1.focus();
				return false;
			}
			re = /[a-z]/;
			if (!re.test(form.pwd1.value)) {
				alert("Error: password must contain at least one lowercase letter (a-z)!");
				form.pwd1.focus();
				return false;
			}
			re = /[A-Z]/;
			if (!re.test(form.pwd1.value)) {
				alert("Error: password must contain at least one uppercase letter (A-Z)!");
				form.pwd1.focus();
				return false;
			}
		} else {
			alert("Error: Please check that you've entered and confirmed your password!");
			form.pwd1.focus();
			return false;
		}

		alert("You entered a valid password: " + form.pwd1.value);
		return true;
	}
</script>

<form
	action="http://localhost:8080/practica6/UsuarioController?accion=guardar" 
	method="post">
	<div class="contacto">
		<center>
			<h1>
				<legend id="titulo">Alta Usuario</legend>
			</h1>
		</center>
		<br> <br>
		<div id="centrar">
			<table cellpadding="5" cellspacing="5">
				<tr align="left">
					<td>Nombre:</td>
					<td><input type='text' name="nombre" required class='nombre' value=''></td>
				</tr>
				<tr align="left">
					<td>Apellido:</td>
					<td><input type='text' name="apellido" required class='apellido'
						value=''></td>
				</tr>
				<tr align="left">
					<td>Email:</td>
					<td><input type='text' name="mail" required class='email' value=''></td>
				</tr>
				<tr align="left">
					<td>Nombre de Usuario:</td>
					<td><input type='text' name="nomUsuario" required class='nombreUsr'
						value=''></td>
				</tr>
				<tr align="left">
					<td>Contraseña:</td>
					<td><input type="password" name="pwd1" required value=''></td>
				</tr>
				<tr align="left">
					<td>Confirmar contraseña:</td>
					<td><input type="password" name='pwd2' required placeholder="Enter a valid email address" value=''></td>
				</tr>
			</table>
			<div id=centrarBot>
				<input type='submit' value='Enviar' class='boton'>
			</div>
		</div>
</form>

<%@ include file="pie.jsp"%>
