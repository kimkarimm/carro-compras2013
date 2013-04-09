
<%@ include file="menu.jsp"%>
<form
	action="http://localhost:8080/practica6/CategoriaController?accion=guardar"
	method="post">
<!-- comentario  -->
	<div class="contacto">
		<center>
			<h1>
				<legend id="titulo">Alta Categoria</legend>
			</h1>
		</center>
		<br> <br>
		<table>
			<tr>
				<td>Nombre de Categoria:</td>
			</tr>
			<tr>
				<td><input type="text" name="nombre" /></td>
			</tr>
		</table>
		<p></p>
		<br>
		<br>
		<center>
			<input type="submit" name="aceptar" value="Aceptar">
		</center>
		<br> <br>
	</div>
</form>
</center>
<%@ include file="pie.jsp"%>