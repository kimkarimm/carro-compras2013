<%@ include file="menu.jsp"%>
<form
	action="http://localhost:8080/practica6/CategoriaController?accion=guardar"
	method="post">


	<div class="contacto">
		<center>
			<h1>
				<legend id="titulo">Alta Categoria</legend>
			</h1>
		</center>
		<br> <br>	
		<div id="centrar">
			<table cellpadding="5" cellspacing="5">
	            <tr align="left"><td>Nombre de categoria:</td><td><input type='text' name="nombre" class='nombre' value=''></td></tr>
			</table>
			<div id=centrarBot>	<input type='submit' value='Enviar' class='boton'></div>
		</div>
	
<!-- 		<table> -->
<!-- 			<tr> -->
<!-- 				<th>Nombre de Categoria:</th> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td><input type="text" name="nombre" /></td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
<!-- 		<p></p> -->
<!-- 		<br> -->
<!-- 		<br> -->
<!-- 		<div id=centrarBot> -->
<!-- 		<input type='submit' value='Enviar'></div> -->

		<br> <br>
	</div>
</form>
<%@ include file="pie.jsp"%>