
<%@ include file="menu.jsp"%>
<div>
	<div class="contacto">
		<center>
			<h3>Factura</h3>
		</center>
		<table border="1">
			<tr>
				<td width="200px">Usuario:</td>
				<td><c:out value="${sessionScope.usuario.apellido}"></c:out>
					<c:out value="${sessionScope.usuario.nombre}"></c:out></td>
			</tr>
			<tr>
				<td width="200px">Mail:</td>
				<td><c:out value="${sessionScope.usuario.mail }"></c:out></td>
			</tr>
			<tr>
				<td width="200px">Fecha de pedido</td>
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
				<td width="200px">Fecha de Entrega Programada</td>
				<td><c:out value="${sessionScope.pedido.fechaEntrega }"></c:out></td>
			</tr>
		</table>
		<br>
		<table border="1">
			<tr>
				
				<td width="15%">Nombre</td>
				<td width="3%">Cantidad</td>
				<td width="15%">Precio</td>

				<%!%>
			</tr>	
			<br>	
			<tr>
				<td></td>
				<td>Total</td>
				<td></td>
			</tr>
		</table>
	</div>
</div>
<%@ include file="pie.jsp"%>