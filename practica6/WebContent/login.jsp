			<div id="bar">
				<div id="container">
					<div id="loginContainer">
						<a href="#" id="loginButton"><span>Login</span><em></em></a>
						<div style="clear: both"></div>
						<div id="loginBox">
							<form id="loginForm"
								action="http://localhost:8080/practica6/Login" method="post">
								<fieldset id="body">
									<fieldset>
										<label for="email">Nombre de Usuario</label> <input
											type="text" name="nomUsuario" id="email" />
									</fieldset>
									<fieldset>
										<label for="password">Password</label> <input type="password"
											name="pass" id="password" />
									</fieldset>
									<input type="submit" class="botonEnviar" value="Sign in" /> <label
										for="checkbox"><input type="checkbox" id="checkbox" />Recordarme</label>
								</fieldset>
								<span><a href="#">Olvidó su contraseña?</a></span>
							</form>
						</div>
					</div>
				</div>
			</div>
			
			
			
			
			
			
			
			
			
<script type="text/javascript">
	$(document).ready(function() {
	$('#imagenesC').coinslider({ width: 980, hoverPause: false, navigation: true });
	$(".botonEnviar").click(function(){
	if ($("#email").val() == ""){
	alert('Debe ingresar el nombre');
	return;
	}
	if ($("#password").val() == ""){
	alert('Debe ingresar la password');
	return;
	}
	if (isNaN($("#dni").val())){
	alert('El dni debe contener solo nÃºmeros');
	return;
	} 
	$("#botonEnviar").submit(); 
	});
	});
</script>	