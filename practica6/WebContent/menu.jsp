<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page
	import="com.sun.org.apache.xalan.internal.xsltc.runtime.Hashtable"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>

<head>
<link rel="stylesheet" type="text/css" href="estilo.css" title="style" />
<link href="estilo1.css" rel="stylesheet" type="text/css">
<link href="estilo.css" rel="stylesheet" type="text/css">
<link href="estiloForm.css" rel="stylesheet" type="text/css">
<link href="style.css" rel="stylesheet" type="text/css">
<script
	src='http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js'></script>
<script src='funciones.js'></script>
<script src='login.js'></script>
<style type="text/css"></style>
<title>Tienda digital</title>


<script src="javascripts/jquery.js" type="text/javascript"></script>
<script src="javascripts/jquery.tipsy.js" type="text/javascript"></script>

</head>
<body width="100%">
	<div id="wrapper">
		<div id="header" class="clearfix">
			<div class="h_left"></div>
			<%-- 			<center> --%>
			<!-- 				<a><img src="encabezado1.jpg.png" alt="" class="logo"></a> -->
			<%-- 			</center> --%>


			<!-- 			<div id ="topnav"class="topnav"> Iniciar Sesion  -->
			<!-- 				<a href ="login"class="signin"> -->
			<!-- 				<span>Login</span></a> -->
			<!-- 			</div> -->
			<!-- 			<fieldset id="signin_menu">  -->
			<!-- 				<form action="http://localhost:8080/practica6/Login" -->
			<!-- 								method="post"> -->
			<!-- 				<p>				 -->
			<!-- 				<label for="username">Nombre de Usuario</label>  -->
			<!-- 					<input id ="username" name="nomUsuario" value="" title="username" -->
			<!-- 					tabindex="4" type="text"> -->
			<!-- 					</p> -->
			<!-- 					<p> -->
			<!-- 						<label for="password">Contraseña</label>  -->
			<!-- 						<input id ="password"name="password" value="" title="password" tabindex="5" -->
			<!-- 							type="password"> -->
			<!-- 					</p> -->
			<!-- 					<p class="remember"> -->
			<!-- 						<input id ="signin_submit"value="Sign in" -->
			<!-- 							tabindex="6" type="submit">  -->
			<!-- 						<input id -->
			<!-- 							="remember"name="remember_me" value="1" tabindex="7" type="checkbox"> -->
			<!-- 						<label for="remember">Recordarme</label> -->
			<!-- 					</p> -->
			<!-- 				</form> -->
			<!-- 			</fieldset> -->


			<div class="titulo">
				<h1 align="center"></h1>
			</div>
			<div align="left">
				<div id="main_navi" class="clearfix">

					<body>
						<div id='cssmenuh'>
							<c:if test="${sessionScope.permisos == null}">
								<%@ include file="menuhnormal.jsp"%>
							</c:if>
							<c:if test="${sessionScope.usuario.permisos  == 1}">
								<%@ include file="menuhadmin.jsp"%>
							</c:if>
							<c:if test="${sessionScope.usuario.permisos == 0}">
								<%@ include file="menuhusr.jsp"%>
							</c:if>
					</body>

					<link rel="stylesheet" type="text/css" href="data:css,">
					<div id="page" class="clearfix">
						<div id="content">
							<br> <br> <br>
							<div class="clearfix"></div>


						</div>
						<div id="sidebar">
							<div class="sidebar_top">
								<div class="cont_menu">
									<div id='cssmenuv'>
										<h3>
											<span>Categorias</span>
										</h3>
										<ul>
											<c:forEach var="cat"
												items="${ sessionScope.listaCategorias }">
												<li><a
													href="ProductoController?accion=listarPorCategoria&categoria=<c:out value= "${cat.id}"/>">
														<c:out value="${cat.nombre}" />
												</a></li>
											</c:forEach>
										</ul>
										<br>
									</div>
								</div>
								<div class="cont_menu">
									<div id="carrito">
										<h3>
											<span>Carrito</span>
										</h3>
										<form action="http://localhost:8080/practica6/facturar.jsp">
											<ul>
												<c:forEach var="comp" items="${sessionScope.comprados}">
													<li><c:out value="${comp.nombre}" /></li>
												</c:forEach>
											</ul>
											<div id='postotal'>
												<h4>
													Total:
													<c:out value="${sessionScope.total}"></c:out>
												</h4>
											</div>
											<br>
											<div>
												<c:if test="${sessionScope.usuario.permisos != null}">
													<input id="posComprar" type="submit" name="facturar"
														value="Comprar">
												</c:if>
											</div>
										</form>

									</div>
								</div>