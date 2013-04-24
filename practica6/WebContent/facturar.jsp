
<%@ include file="menu.jsp"%>
<div>
	<div class="contacto">
		<center>
			<h3>Factura</h3>
		</center>
		<table border="1">
			<tr>
				<th width="200px">Usuario:</th>
				<td><c:out value="${sessionScope.usuario.apellido}"></c:out>
					<c:out value="${sessionScope.usuario.nombre}"></c:out></td>
			</tr>
			<tr>
				<th width="200px">Mail:</th>
				<td><c:out value="${sessionScope.usuario.mail }"></c:out></td>
			</tr>
			<tr>
				<th width="200px">Fecha de pedido</th>
				<td><script>
					var mydate=new Date();
					var year=mydate.getYear();
					if (year < 1000)
						year+=1900;
					var day=mydate.getDay();
					var month=mydate.getMonth()+1;
					if (month<10)
						month="0"+month;
					var daym=mydate.getDate();
					if (daym<10)
						daym="0"+daym;
					document.write(""+daym+"/"+month+"/"+year+"")
				</script></td>
			</tr>
			<tr>
				<tg width="200px">Fecha de Entrega Programada</tg>
				<td>10 Dias habiles</td>
			</tr>
		</table>
		<br>

		<div id="centrar">
		<table cellpadding="5" cellspacing="5" border="1">
			<tr>
				<th>Nombre</th>
				<th>Cantidad</th>
				<th>Precio Unitario</th>
				<th>Subtotal</th>
			</tr>
			<c:forEach var="comprados" items="${sessionScope.comprados}">
						<tr align="left">
							<td><c:out value="${comprados.nombre}" /></td>
							<td><c:out value="${comprados.cantidad}" /></td>
							<td><c:out value="${comprados.subtotal}" /></td>
							<td><c:out value="${comprados.precio}" /></td>
						</tr>
			</c:forEach>
		</table>
			
		<table>		
			<br>	
			<tr>
				<td></td>
				<td>Total</td>
				<td>"${sessioScope.comprados.total}"</td>
			</tr>
		</table>
	</div>
</div>
<%@ include file="pie.jsp"%>