<%@ include file="menu.jsp"%>
<div class="contacto">
	<div id="login">
		<div id="titulo">
			<center>
				<h3>�Ha olvidado su contrase�a?</h3>
				<br> <br> <span> Si ha olvidado su contrase�a,
					introduzca su direcci�n de e-mail y le enviaremos un mensaje con
					una contrase�a nueva.</span>
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