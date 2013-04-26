
<%@ include file="menu.jsp"%>
<div class="contacto">
	<center>
		<h1>
			<legend id="titulo">Lista de Pedidos </legend>
		</h1>
	</center>
	<div>
			<div id="centrar">
				<table  cellpadding="5" cellspacing="5" rules="all" border-bottom="3" bordercolor="#23ACF0">
						<tr align="left">
							<th>Nombre</th>
							<th>Apellido</th>
							<th>Fecha de Pedido</th>
							<th>Fecha de entrega</th>
							<th>Estado</th>
							<th>Productos</th>
						</tr>
					<c:forEach var="lista" items="${ sessionScope.listaPedidos}">
						<tr align="left">
							<td><c:out value="${lista.usuario.nombre}" /></td>
							<td><c:out value="${lista.usuario.apellido}" /></td>
							<td><c:out value="${lista.fechaPedido}" /></td>
							<td><c:out value="${lista.fechaEntrega}" /></td>
							<td><c:out value="${lista.estado}"/></td>
							<td><a href="http://localhost:8080/practica6/verProductos.jsp?accion=buscar&pedido=${ lista.id }">--> ver Productos</a></td>							
						</tr>
					</c:forEach>
				</table>
				
<!-- 				<div id=centrarBot> -->
<!-- 					<input type='submit' value='Comprar' class='boton'> -->
<!-- 				</div> -->
			
			
			</div>


	</div>
	<%@ include file="pie.jsp"%>