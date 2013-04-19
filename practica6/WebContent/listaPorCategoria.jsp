
<%@ include file="menu.jsp"%>
<div class="contacto">
	<center>
		<h1>
			<legend id="titulo">Lista de Productos </legend>
		</h1>
	</center>
	<div>
		<form action="http://localhost:8080/practica6/LlenarCarrito">

			<div id="centrar">
				<table cellpadding="5" cellspacing="5">
						<tr align="left">
							<th>Nombre:</th>
							<th>Precio</th>
							<th>Agregar al carrito</th>
						</tr>
					<c:forEach var="prod" items="${ sessionScope.listaPorCategoria }">
						<tr align="left">
							<td><c:out value="${prod.nombre}" /></td>
							<td><c:out value="${prod.precio}" /></td>
							<td> <input type="image" name="enviar" src="images/agregar.png"/> </td>
						</tr>
					</c:forEach>
				</table>
				<div id=centrarBot>
					<input type='submit' value='Comprar' class='boton'>
				</div>
			</div>





<!-- 			<table> -->
<%-- 				<c:forEach var="prod" items="${ sessionScope.listaPorCategoria }"> --%>

<!-- 					<tr> -->
<%-- 						<td><c:out value="${prod.nombre}" /></td> --%>
<%-- 						<td><c:out value="${prod.precio}" /></td> --%>
<%-- 						<td><input type="text" name="<c:out value="${prod.id}" />" --%>
<!-- 							value="0" /></td> -->
<!-- 					</tr> -->
<%-- 				</c:forEach> --%>
<!-- 			</table> -->
<!-- 			<center> -->
<!-- 				<input type="submit" name="comprar" value="Comprar"> -->
<!-- 			</center> -->



		</form>
	</div>
	<%@ include file="pie.jsp"%>