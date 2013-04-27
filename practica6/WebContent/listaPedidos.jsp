
<%@ include file="menu.jsp"%>
<form
	action="http://localhost:8080/practica6/PedidoController?accion=modificar&listaPedidos=${ sessionScope.listaPedidos }"
	method="post">
	<div class="contacto">
		<center>
			<h1>
				<legend id="titulo">Lista de Pedidos </legend>
			</h1>
		</center>
		<div>
			<div id="centrar">
				<table cellpadding="5" cellspacing="5" rules="all" border-bottom="3"
					bordercolor="#23ACF0">
					<tr align="left">
						<th>Nombre</th>
						<th>Apellido</th>
						<th>Fecha de Pedido</th>
						<th>Fecha de entrega</th>
						<th>Estado</th>
						<th>Opciones</th>
					</tr>
					<c:forEach var="pedido" items="${ sessionScope.listaPedidos}">
						<tr align="left">
							<td><c:out value="${pedido.usuario.nombre}" /></td>
							<td><c:out value="${pedido.usuario.apellido}" /></td>
							<td><c:out value="${pedido.fechaPedido}" /></td>
							<td><c:out value="${pedido.fechaEntrega}" /></td>
							<c:if test="${ pedido.estado == 'pendiente'}">
								<td><select name='${ pedido.id }'>
										<option value="pendiente" selected="selected">Pendiente</option>
										<option value="entregado">Entregado</option>
										<option value="eetrasado">Retrasado</option>
								</select></td>
							</c:if>
							<c:if test="${ pedido.estado != 'pendiente'}">
								<td><c:out value="${lista.estado}" /></td>
							</c:if>
							<td><a
								href="http://localhost:8080/practica6/verProductos.jsp?accion=buscar&pedido=${ pedido.id }">->
									Ver Productos</a></td>
						</tr>
					</c:forEach>
				</table>
				<div id=centrarBot>
					<input type='submit' value='Aplicar'>
				</div>
			</div>
		</div>
	</div>
</form>
		<%@ include file="pie.jsp"%>