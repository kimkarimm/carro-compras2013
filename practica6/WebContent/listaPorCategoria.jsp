<%@ include file="menu.jsp"%>
<div class="contacto">
	<center>
		<h1>
			<legend id="titulo">Lista de Productos </legend>
		</h1>
	</center>
	<div>

		<div id="centrar">
			<table cellpadding="5" cellspacing="5">
				<tr align="left">
					<th>Nombre:</th>
					<th>Precio</th>
					<th>Agregar al carrito</th>
				</tr>
				<c:forEach var="prod" items="${ sessionScope.listaPorCategoria }">
					<form
						action="http://localhost:8080/practica6/LlenarCarrito?idproducto=${prod.id}" method="post">
						<tr align="left">
							<td><c:out value="${prod.nombre}" /></td>
							<td><c:out value="${prod.precio}" /></td>
							<td align="center"><input type="image" name="enviar"
								src="images/agregar.png" /></td>
						</tr>
					</form>
				</c:forEach>
			</table>
		</div>

	</div>
	<%@ include file="pie.jsp"%>