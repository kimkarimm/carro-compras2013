
<%@ include file="menu.jsp"%>
<div class="contacto">
	<center>
		<h1>
			<legend id="titulo">Lista de Pedidos </legend>
		</h1>
	</center>
	<div>
		<form action="http://localhost:8080/practica6/PedidoController?accion=listarPorUsuario&condicion=${sessionScope.usuario.id}">

			<div id="centrar">
				<table cellpadding="5" cellspacing="5">
						<tr align="left">
							<th>Fecha de Pedido</th>
							<th>Fecha de entrega</th>
							<th>Estado</th>
						</tr>
					<c:forEach var="lista" items="${ sessionScope.listaPedidosUsuario}">
						<tr align="left">
							<td><c:out value="${lista.fechaPedido}" /></td>
							<td><c:out value="${lista.fechaEntrega}" /></td>
							<td><c:out value="${lista.estado}" /></td>
						</tr>
					</c:forEach>
				</table>
<!-- 				<div id=centrarBot> -->
<!-- 					<input type='submit' value='Comprar' class='boton'> -->
<!-- 				</div> -->
			</div>



		</form>
	</div>
	<%@ include file="pie.jsp"%>