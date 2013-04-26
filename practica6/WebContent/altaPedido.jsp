
<%@ include file="menu.jsp"%>
<form
	action="http://localhost:8080/practica6/PedidoController?accion=guardar&usuario=${sessionScope.usuario.id}
			&estado=pendiente&fechaPedido=<script>document.write(fecha)</script>&fechaEntrega=10dias"
	method="post">
	<div class="contacto">
		<center>
			<h1>
				<legend id="titulo">Alta Producto</legend>
				<script>
					document.write(fecha)
				</script>
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
				<c:forEach var="comprado" items="${ sessionScope.comprados }">

					<tr>
						<td><img src="images/nokia5030.gif" width="150px"
							height="100px"></td>
						<td><div align="center" width="350px" min-height="100px">
								<b><c:out value="${comprado.nombre}" /></b>
							</div> 
							<div align="left" width="350px" min-height="100px">
								<b>Precio: $</b><u><c:out value="${comprado.precio}" /></u>
							</div>
							<div align="left" width="350px" min-height="100px">
								Cantidad:
								<c:out value="${comprado.cantidad}" />
							</div></td>
						<td align="center"><a
							href="http://localhost:8080/practica6/VaciarCarrito?idproducto=${comprado.id}"><img
								src="images/eliminar.png"></a></td>
					</tr>

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
						var fecha = new String();
						fecha = (daym + "/" + month + "/" + year);
						document.write(fecha);
					</script></td>
				</tr>
			</table>
		</div>

		<div>
			<input type='submit' value='comprar'>
		</div>
</form>
<%@ include file="pie.jsp"%>