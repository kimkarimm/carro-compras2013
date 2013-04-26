
<%@ include file="menu.jsp"%>
<div class="contacto">
	<center>
		<h3>Productos</h3>
	</center>
	<div id="centrar">
		<table cellpadding="5" cellspacing="5">
			<c:forEach var="productos"
				items="${ sessionScope.productos}">
					<tr>
					<c:out value="${ productos.nombre }"></c:out>
					</tr>
				</c:forEach>

					</div>
					<br>
					<br>
	</div>



	<%@ include file="pie.jsp"%>