<%@page import="br.com.ab.mapa.model.Pedido"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<title>Deliver</title>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/pedidos.css">
<script src="resources/js/jquery.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="resources/javascript/mapa.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
<script>
	
</script>

</head>
<body>
	<div class="container">
		<div id="custom-bootstrap-menu" class="navbar navbar-default navbar-fixed-top" role="navigation">
	        <div class="navbar-header"><a class="navbar-brand" href="/deliver/">GTLog</a>
	            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-menubuilder"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
	            </button>
	        </div>
	        <div class="collapse navbar-collapse navbar-menubuilder">
	            <ul class="nav navbar-nav navbar-left">
	                <li><a href="/deliver/">Home</a>
	                </li>
	                <li><a href="/deliver/servicos">Serviços</a>
	                </li>
	                <li><a href="/deliver/clientes">Clientes</a>
	                </li>
	                <li><a href="/deliver/empresa">Empresa</a>
	                </li>
	                <li><a href="/deliver/contato">Contato</a>
	                </li>
	            </ul>
	        </div>
	    </div>
	
		<div id="content">
			<h2>Pedidos</h2>
			<form action="/deliver/pedido/search" method="get">
			 	<div class="row">
					<div class="form-group col-md-2">
						<label for="id" class="pull-right">Código:</label> 
					</div>
					<div class="form-group col-md-3">
						<input type="text" class="form-control pull-left" name="id">
					</div>
					<div class="form-group col-md-2">
						<label for="cliente" class="pull-right">Cliente:</label> 
					</div>
					<div class="form-group col-md-3">
						<input type="text" class="form-control pull-left" name="cliente">
					</div>						 	
				</div>
			 	<div class="row">
					<div class="form-group col-md-2">
						<label for="distancia" class="pull-right">Distância:</label> 
					</div>
					<div class="form-group col-md-3">
						<input type="text" class="form-control pull-left" name="distancia">
					</div>
					<div class="form-group col-md-2">
						<label for="valor" class="pull-right">Valor:</label> 
					</div>
					<div class="form-group col-md-3">
						<input type="text" class="form-control pull-left" name="valor">
					</div>						 	
				</div>
			 	<div class="row">
					<div class="form-group col-md-2">
						<label for="coleta" class="pull-right">Coleta:</label> 
					</div>
					<div class="form-group col-md-3">
						<input type="text" class="form-control pull-left" name="coleta">
					</div>
					<div class="form-group col-md-2">
						<label for="entrega" class="pull-right">Entrega:</label> 
					</div>
					<div class="form-group col-md-3">
						<input type="text" class="form-control pull-left" name="entrega">
					</div>						 	
				</div>	
			 	<div class="row">
					<div class="form-group col-md-2">
						<label for="veiculo" class="pull-right">Veículo:</label> 
					</div>
					<div class="form-group col-md-3">
						<input type="text" class="form-control pull-left" name="veiculo">
					</div>
					<div class="form-group col-md-2">
						<label for="entrega" class="pull-right">Data:</label> 
					</div>
					<div class="form-group col-md-3">
						<input type="text" class="form-control pull-left" name="data">
					</div>						 	
				</div>					
				<button type="submit" class="btn btn-default">Procurar</button>
			</form>
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>Código</th>
							<th>Cliente</th>
							<th>Distância</th>
							<th>Valor</th>
							<th>Coleta</th>
							<th>Entrega</th>
							<th>Veículo</th>
							<th>Data</th>
						</tr>
					</thead>
					<tbody>
						<%
							List<Pedido> pedidoList = (List<Pedido>) request.getAttribute("pedidos");
							for (Pedido p : pedidoList) {
						%>
						<tr>
							<td><%=p.getId()%></td>
							<td><%=p.getCliente()%></td>
							<td><%=p.getDistancia()%></td>
							<td><%=p.getValor()%></td>
							<td><%=p.getColeta()%></td>
							<td><%=p.getEntrega()%></td>
							<td><%=p.getVeiculo()%></td>
							<td><%=p.getData()%></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>