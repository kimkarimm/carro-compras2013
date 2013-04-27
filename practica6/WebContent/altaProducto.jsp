<%@ include file="menu.jsp"%>

<form
	action="http://localhost:8080/practica6/ProductoController?accion=guardar"
	method="post">
	<div class="contacto">
		<center>
			<h1>
				<legend id="titulo">Alta Producto</legend>
			</h1>
		</center>
		<div id="centrar">
			<table cellpadding="5" cellspacing="5">
				<tr align="left">
					<td>Nombre de producto:</td>
					<td><input title="Se necesita un nombre" type="text"
						name="nombre" required /></td>
				</tr>
				<tr align="left">
					<td>Descripcion:</td>
					<td><textarea title="Se necesita una descripcion" type="text"
							name="nombre" required /></textarea></td>
				</tr>
				<tr align="left">
					<td>Precio:</td>
					<td><input title="Se necesita un precio" type="number"
						name="precio" required value=''></td>
				</tr>
				<tr align="left">
					<td>Categoria:</td>
					<td><select name='categoria'>
							<c:forEach var="cat" items="${sessionScope.listaCategorias}">
								<option value='<c:out value="${cat.id}"/>'>
									<c:out value="${cat.nombre}" />
								</option>
							</c:forEach>
					</select></td>
				</tr>
			</table>
			<div id=centrarBot>
				<input type='submit' value='Enviar'>
			</div>
		</div>

		<br> <br>
	</div>
</form>
<%@ include file="pie.jsp"%>