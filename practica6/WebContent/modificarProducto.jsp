
<%@ include file="menu.jsp"%>
<form
	action="http://localhost:8080/practica6/ProductoController?accion=modificar&producto=<c:out value='${sessionScope.producto.id}' />"
	method="post">
	<div class="contacto">
		<center>
			<h1>
				<legend id="titulo">ModificarProducto</legend>
			</h1>
		</center>
		<br>
		<table>
			<tr>

				<td>Nombre de Producto:</td>
				<td><input type="text" name="nombre"
					value="${sessionScope.producto.nombre}" /></td>
			</tr>
			<tr>
				<td>Descripcion:</td>
				<td><textarea name="descripcion" cols="40"
						rows="5"/>${sessionScope.producto.descripcion}</textarea></td>
			</tr>
			<tr>
				<td>Precio:</td>
				<td><input type="text" name="precio"
					value="${sessionScope.producto.precio}" />$</td>
			</tr>
			<tr>
				<td>Categoria: </td>
				<td><select name='categoria'>
						<c:forEach var="cat" items="${sessionScope.listaCategorias}">
							<option value='<c:out value="${cat.id}"/>'><c:out value="${cat.nombre}" /></option>
						</c:forEach>
				</select></td>
			</tr>
		</table>
		<p></p>
		<p></p>
		<center>
			<input type="submit" name="aceptar" value="Aceptar">
		</center>
		<br> <br>
	</div>
</form>
<%@ include file="pie.jsp"%>