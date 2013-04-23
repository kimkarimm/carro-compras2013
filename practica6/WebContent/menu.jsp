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
<link href="style.css" rel="stylesheet" type="text/css">
<link href="estiloForm.css" rel="stylesheet" type="text/css">
<link href="css/screen.css" rel="stylesheet" type="text/css">

<script
 src='http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js'></script>
<script src='funciones.js'></script>
<script src='login.js'></script>
<style type="text/css"></style>
<title>Tienda digital</title>



<link href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" rel="stylesheet"/>


<script src="javascripts/jquery.js" type="text/javascript"></script>
<script src="javascripts/jquery.tipsy.js" type="text/javascript"></script>

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/easySlider1.7.js"></script>

 
<script type="text/javascript">
    $(document).ready(function(){  
        $("#slider").easySlider({
            auto: true,
            continuous: true,
            nextId: "slider1next",
            prevId: "slider1prev"
        });
    });
</script>



</head>
<body width="100%">
	<div id="wrapper">
		<div id="header" class="clearfix">
			<div class="h_left"></div>
						<center>
							<a><img src="images/encabezado.jpg" alt=""></a>
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
													<li><p style="border-bottom: solid 1px #000033; width: 170px; padding-top: 5px; padding-top: 5px; "><c:out value="${comp.nombre}" /></p></li>
												</c:forEach>
											</ul>
											<div id='postotal'>
												<h4 style="width: 170px; padding-top: 10px">
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