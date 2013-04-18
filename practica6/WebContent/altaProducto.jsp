	<%@ include file="menu.jsp" %>
					<form action="http://localhost:8080/practica6/ProductoController?accion=guardar" method="post">
						<div class="contacto">
							<center>
							<h1>
								<legend id="titulo">Alta Producto</legend>
							</h1>
							</center>
							
		<div id="centrar">
			<table cellpadding="5" cellspacing="5">
	            <tr align="left"><td>Nombre de producto:</td><td><input type='text' name="nombre" class='nombre' value=''></td></tr>
	            <tr align="left"><td>Descripcion:</td><td> <input type='text' name="apellido" class='apellido' value=''></td></tr>
	            <tr align="left"><td>Precio:</td><td> <input type='text' name="mail" class='email' value=''></td></tr>
	            <tr align="left"><td>Categoria:</td><td> <select name='categoria'>
											<c:forEach var="cat" items="${sessionScope.listaCategorias}">
											<option value='<c:out value="${cat.id}"/>'><c:out value="${cat.nombre}"/></option>
											</c:forEach>
										</select></td></tr>
			</table>
		<div id=centrarBot>
		<input type='submit' value='Enviar' class='boton'></div>
		</div>
							
							
							
							
<!-- 								<table> -->
<!-- 									<tr> -->
<!-- 										<td>Nombre de Producto:</td> -->
<!-- 										<td><input type="text" name="nombre"></td> -->
<!-- 									</tr> -->
<!-- 									<tr> -->
<!-- 										<td>Descripcion:</td> -->
<!-- 										<td><textarea name="descripcion" cols="40" rows="5"></textarea></td> -->
<!-- 									</tr> -->
<!-- 									<tr> -->
<!-- 										<td>Precio:</td> -->
<!-- 										<td><input type="text" name="precio" maxlength="10"> $ </td> -->
<!-- 									</tr> -->
<!-- 									<tr><td><p>   </p></td></tr> -->
<!-- 									<tr> -->
<!-- 										<td>Categoria</td> -->
<!-- 										<td><select name='categoria'> -->
<%-- 											<c:forEach var="cat" items="${sessionScope.listaCategorias}"> --%>
<%-- 											<option value='<c:out value="${cat.id}"/>'><c:out value="${cat.nombre}"/></option> --%>
<%-- 											</c:forEach> --%>
<!-- 										</select></td> -->
<!-- 									</tr> -->
<!-- 								</table> -->
								<p> </p>
								<br>
								<center>
									<input type="submit" name="aceptar" value="Aceptar">
								</center>
						<br> <br>
					</div>
					</form>
	<%@ include file="pie.jsp" %>