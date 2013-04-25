
<%@ include file="menu.jsp"%>
<form
	action="http://localhost:8080/practica6/PedidoController?accion=guardar&usuario=${sessionScope.usuario.id}
			&estado=pendiente&fechaPedido=daym+'/'+month+'/'+year&fechaEntrega=10dias"
	method="post">
	<div class="contacto">
		<center>
			<h1>
				<legend id="titulo">Alta Producto</legend>
			</h1>
		</center>
		<div id="centrar">
			<table cellpadding="5" cellspacing="5" rules="all" border-bottom="3"
				bordercolor="#23ACF0">
				<tr>
					<th>Imagen</th>
					<th>Descripcion General</th>
					<th>Quitar del Carrito</th>
				</tr>
				<c:forEach var="comprados" items="${ sessionScope.comprados }">
					<form
						action="http://localhost:8080/practica6/VaciarCarrito?idproducto=${comprado.id}"
						method="post">
						<tr>
							<td><img src="images/nokia5030.gif" width="150px"
								height="100px"></td>
							<td><div align="center" width="350px" min-height="100px">
									<b><c:out value="${comprados.nombre}" /></b>
								</div>
								<div align="left" width="350px" min-height="100px">
									<b>Precio: $</b><u><c:out value="${comprados.precio}" /></u>
								</div>
								<div align="left" width="350px" min-height="100px">
									Cantidad:
									<c:out value="${comprados.cantidad}" />
								</div></td>
							<td align="center"><input type="image" name="enviar"
								src="images/eliminar.png" /></td>
						</tr>
					</form>
				</c:forEach>
			</table>
			<table style="border-top: 30px;">
				<tr>
					<th>Detalles de la compra</th>
				</tr>
				<tr>
					<td>Estado:</td>
					<td>&nbsp; Pendiente</td>
				</tr>
				<tr width="150px">
					<td>Fecha de pedido:</td>
					<td><script>
						var mydate = new Date();
						var year = mydate.getYear();
						if (year < 1000)
							year += 1900;
						var day = mydate.getDay();
						var month = mydate.getMonth() + 1;
						if (month < 10)
							month = "0" + month;
						var daym = mydate.getDate();
						if (daym < 10)
							daym = "0" + daym;
						document.write("" + daym + "/" + month + "/" + year
								+ "");
					</script></td>
				</tr>
			</table>
		</div>

		<div>
			<input type='submit' value='comprar'>
		</div>
</form>
















<!-- 				   			<div id="centrar"> -->
<!-- 								<table cellpadding="5" cellspacing="5"> -->
<!-- 						            <tr align="left"><td>Fecha de pedido:</td><td><input type='text' name="fechaPedido" class='nombre' value=''></td></tr> -->
<!-- 						            <tr align="left"><td>Fecha de entrega::</td><td> <input type='text' name="fechaEntrega" class='apellido' value=''></td></tr> -->
<!-- 						            <tr align="left"><td>Estado:</td><td>&nbsp; Pendiente</td></tr>> -->
<!-- 								</table> -->
<!-- 								<div id=centrarBot> <input type='submit' value='Enviar' class='boton'> </div> -->
<!-- 							</div>		 -->




<!-- 								<table> -->
<!-- 									<tr> -->
<!-- 										<td width="150px">Fecha de pedido:</td> -->
<!-- 										<td><input type="text" name="fechaPedido"></td> -->
<!-- 									</tr> -->
<!-- 									<tr> -->
<!-- 										<td width="150px">Fecha de entrega:</td> -->
<!-- 										<td><input type="text" name="fechaEntrega"></td> -->
<!-- 									</tr> -->
<!-- 									<tr> -->
<!-- 										<td width="150px">Estado:</td> -->
<!-- 										<td>&nbsp; Pendiente </td> -->
<!-- 									</tr> -->
<!-- 									<tr><td><p>   </p></td></tr> -->
<!-- 								</table> -->
<!-- 								<p> </p> -->
<!-- 								<br> -->
<!-- 								<center> -->
<!-- 									<input type="submit" name="aceptar" value="Aceptar"> -->
<!-- 								</center> -->
<!-- 						<br> <br> -->


<%@ include file="pie.jsp"%>