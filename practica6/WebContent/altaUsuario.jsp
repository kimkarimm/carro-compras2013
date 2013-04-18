
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
		            <tr align="left"><td>Nombre:</td><td><input type='text' name="nombre" class='nombre' value=''></td></tr>
		            <tr align="left"><td>Apellido:</td><td> <input type='text' name="apellido" class='apellido' value=''></td></tr>
		            <tr align="left"><td>Email:</td><td> <input type='text' name="mail" class='email' value=''></td></tr>
		            <tr align="left"><td>Nombre de Usuario:</td><td> <input type='text' name="nomUsuario" class='nombreUsr' value=''></td></tr>
		            <tr align="left"><td>Contraseña:</td><td> <input type="password" name="password" class='password' value=''></td></tr>
		            <tr align="left"><td>Confirmar contraseña:</td><td> <input type="password" class='confirm_password' value=''></td></tr>
				</table>
				<div id=centrarBot> <input type='submit' value='Enviar' class='boton'> </div>
			</div>
</form>

	<%@ include file="pie.jsp"%>
