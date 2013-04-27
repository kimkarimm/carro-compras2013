<%@ include file="menu.jsp"%>

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
					<td><input title="Se necesita un nombre" type='text'
						name="nombre" required value=''></td>
				</tr>
				<tr align="left">
					<td>Apellido:</td>
					<td><input title="Se necesita un apellido" type='text'
						name="apellido" required value=''></td>
				</tr>
				<tr align="left">
					<td>Email:</td>
					<td><input type="text"
						pattern="^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$"
						name="email" required value='' /></td>
				</tr>
				<tr align="left">
					<td>Nombre de Usuario:</td>
					<td><input title="Ingrese un nombre de usuario" type='text'
						name="nomUsuario" required class='nombreUsr' value=" "></td>
				</tr>
				<tr align="left">
					<td>Contraseña:</td>
					<td><input type="password"
						title="Debe tener entre 8 y 15 caracteres, por lo menos un digito y un alfanumérico, y no puede contener caracteres espaciales"
						pattern="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,15})$"
						name="pwd1" required value=""></td>
				</tr>
				<tr align="left">
					<td>Confirmar contraseña:</td>
					<td><input type="password" name='pwd2' required value=''></td>
				</tr>
			</table>
			<div id=centrarBot>
				<input type='submit' value='Enviar'>
			</div>
		</div>
</form>

<%@ include file="pie.jsp"%>