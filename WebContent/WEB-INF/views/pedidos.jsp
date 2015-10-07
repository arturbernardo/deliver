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
<link rel="stylesheet" type="text/css" href="resources/css/mainMapa.css">
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
		<h2>Pedidos</h2>
		<p>asdasdasd:</p>
		<div class="table-responsive">
			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>Firstname</th>
						<th>Lastname</th>
						<th>Age</th>
						<th>City</th>
						<th>Country</th>
					</tr>
				</thead>
				<tbody>
			        <%
			            List<Pedido> pedidoList = (List<Pedido>) request.getAttribute("pedidos");
			            for(Pedido p : pedidoList) {
			        %>
						<tr>
							<td>1</td>
							<td>Anna</td>
							<td>Pitt</td>
							<td>35</td>
							<td>New York</td>
							<td>USA</td>
						</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>