
<%@ include file="menu.jsp"%>
<form
	action="http://localhost:8080/practica6/CategoriaController?accion=modificar&categoria=<c:out value="${sessionScope.categoria.id}"/>"
	method="post">
	<div class="contacto">
		<center>
			<h1>
				<legend id="titulo">Modificar Categoria</legend>
			</h1>
		</center>
		<br> <br>
		<table>
			<tr>
				<td>Nuevo nombre: </td>
				<td><input type="text" name="nombre" value="${sessionScope.categoria.nombre}"/></td>
			</tr>
		</table>
		<p></p>
		<p></p>
		<br> <br>
		<center>
			<input type="submit" name="aceptar" value="Aceptar">
		</center>
		<br> <br>
	</div>
</form>
<%@ include file="pie.jsp"%>