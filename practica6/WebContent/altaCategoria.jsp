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
				<tr align="left">
					<td>Nombre de categoria:</td>
					<td><input title="Ingrese un nombre de una categoria" type='text' name="nombre"
						value='' required></td>
				</tr>
			</table>
			<div id="centrarBot">
				<input type='submit' value='Enviar' name="enviar">
			</div>
		</div>
		<br> <br>
	</div>
</form>
<%@ include file="pie.jsp"%>