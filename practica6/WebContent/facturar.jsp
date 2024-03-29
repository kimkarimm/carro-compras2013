
<%@ include file="menu.jsp"%>
<div>
	<div class="contacto">
		<center>
			<h3>Factura</h3>
		</center>
		<table rules="all" border="1">
			<tr>
				<th width="220px" align="left">Usuario:</th>
				<td width="200px" align="left"><c:out
						value="${sessionScope.usuario.apellido}"></c:out> <c:out
						value="${sessionScope.usuario.nombre}"></c:out></td>
			</tr>
			<tr>
				<th align="left">Mail:</th>
				<td><c:out value="${sessionScope.usuario.mail }"></c:out></td>
			</tr>
			<tr>
				<th align="left">Fecha de pedido</th>
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
					document.write("" + daym + "/" + month + "/" + year + "")
				</script></td>
			</tr>
			<tr>
				<th align="left">Fecha de Entrega Programada</th>
				<td>10 Dias habiles</td>
			</tr>
		</table>
		<br>

		<div id="centrar">
			<table rules="all" border="2">
				<tr>
					<th width="500px">Nombre</th>
					<th width="50px">Cantidad</th>
					<th width="70px">Precio Unitario</th>
					<th width="80px">Subtotal</th>
				</tr>
				<c:forEach var="comprado" items="${sessionScope.detalle}">
					<tr align="left">
						<td><c:out value="${comprado.nombre}" /></td>
						<td><c:out value="${comprado.cantidad}" /></td>
						<td><c:out value="${comprado.subtotal}" /></td>
						<td><c:out value="${comprado.precio}" /></td>
					</tr>
				</c:forEach>
			</table>
			<table>
				<tr>
					<td width="500px"></td>
					<td width="60px"></td>
					<td width="70px">Total:</td>
					<td width="80px">$<c:out value="${sessionScope.totalPedido}"></c:out></td>
				</tr>
			</table>
		</div>
		<div align="right">
			<a href="javascript:print()"><input type="image" name="imprimir"
				alt="imprimir" src="images/imprimir.gif"/></a>
		</div>
	</div>
	<%@ include file="pie.jsp"%>