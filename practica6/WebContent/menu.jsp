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
<style type="text/css"></style>
<title>Tienda digital</title>
</head>

<body>

	<div id="wrapper">
		<div id="header" class="clearfix">
			<div class="h_left"></div>
			<center>
<!-- 				<a><img src="encabezado1.jpg.png" alt="" class="logo"></a> -->
			</center>
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
									<div  id='cssmenuv'>
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
										<ul>
											<form action="http://localhost:8080/practica6/altaPedido.jsp">
												<c:forEach var="comp" items="${sessionScope.comprados}">
													<li><c:out value="${comp.nombre}" /></li>
												</c:forEach>
												<div id='postotal'>
													<h6>
														<span>Total:<c:out value="${sessionScope.total}"></c:out></span>
													</h6>
												</div>
											</form>
										</ul>
										<br>
										<c:if test="${sessionScope.usuario.permisos != null}">
											<div style="position: absolute;">
												<input id=posLogin type="submit" name="facturar"
													value="Comprar">
											</div>
										</c:if>
									</div>
								</div>