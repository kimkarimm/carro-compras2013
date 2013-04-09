	<%@ include file="menu.jsp" %>
					<form action="http://localhost:8080/practica6/PedidoController?accion=guardar&usuario=${sessionScope.usuario.id}"
						method="post">
						<div class="contacto">
							<center>
							<h1>
								<legend id="titulo">Alta Producto</legend>
							</h1>
							</center>
								<table>
									<tr>
										<td width="150px">Fecha de pedido:</td>
										<td><input type="text" name="fechaPedido"></td>
									</tr>
									<tr>
										<td width="150px">Fecha de entrega:</td>
										<td><input type="text" name="fechaEntrega"></td>
									</tr>
									<tr>
										<td width="150px">Estado:</td>
										<td>&nbsp; Pendiente </td>
									</tr>
									<tr><td><p>   </p></td></tr>
								</table>
								<p> </p>
								<br>
								<center>
									<input type="submit" name="aceptar" value="Aceptar">
								</center>
						<br> <br>
					</div>
					</form>
	<%@ include file="pie.jsp" %>