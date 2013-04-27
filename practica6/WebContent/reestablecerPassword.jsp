<%@ include file="menu.jsp"%>
<div class="contacto">
	<div id="login">
		<div id="titulo">
			<center>
				<h3>¿Ha olvidado su contraseña?</h3>
				<br> <br> <span> Si ha olvidado su contraseña,
					introduzca su dirección de e-mail y le enviaremos un mensaje con
					una contraseña nueva.</span>
				<fieldset>
					<br> <br>
					<form>
						<table>
							<tr>
								<fieldset>
									<td><label for="email">E-mail </label></td>
									<td><input type="text" name="email" value='' required /></td>
								</fieldset>
							</tr>
							<tr>
								<td></td>
								<td  class="boton"><input name="enviar" type="button"
									onclick='alert("El mensaje fue enviado correcctamente")'
									value="Enviar" /></td>
							<tr>
						</table>
					</form>
				</fieldset>
			</center>
		</div>
	</div>
</div>
<%@ include file="pie.jsp"%>