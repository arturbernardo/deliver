<%@page import="br.com.ab.mapa.model.Volume"%>
<%@page import="java.util.List"%>
<%@ page session="true" %>
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
<link rel="stylesheet" type="text/css" href="resources/css/pedidos.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<script src="resources/js/jquery.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="resources/javascript/mapa.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
<script>
	
	function atualizaValores() {
		calcRoute();
	}

	var directionsDisplay;
	var directionsService = new google.maps.DirectionsService();
	var map;

	var style = [ {
		"featureType" : "road",
		"elementType" : "geometry",
		"stylers" : [ {
			"lightness" : 100
		}, {
			"visibility" : "simplified"
		} ]
	}, {
		"featureType" : "water",
		"elementType" : "geometry",
		"stylers" : [ {
			"visibility" : "on"
		}, {
			"color" : "#C6E2FF"
		} ]
	}, {
		"featureType" : "poi",
		"elementType" : "geometry.fill",
		"stylers" : [ {
			"color" : "#C5E3BF"
		} ]
	}, {
		"featureType" : "poi.business",
		"stylers" : [ {
			"visibility" : "off"
		} ]
	}, {
		"featureType" : "road",
		"elementType" : "geometry.fill",
		"stylers" : [ {
			"color" : "#D1D1B8"
		} ]
	} ]

	function initialize() {
		directionsDisplay = new google.maps.DirectionsRenderer();
		var cidade = new google.maps.LatLng(-30.0381544, -51.2311619);
		var mapOptions = {
			zoom : 15,
			mapTypeId : google.maps.MapTypeId.ROADMAP,
			center : cidade,
			styles : style
		}

		map = new google.maps.Map(document.getElementById("map-canvas"),
				mapOptions);
		directionsDisplay.setMap(map);

	}

	function calcRoute() {
		var start = document.getElementById("start").value;
		var end = document.getElementById("end").value;
		var valor = $(".selectpicker option:selected").val();

		var request = {
			origin : start,
			destination : end,
			travelMode : google.maps.TravelMode.DRIVING
		};
		directionsService.route(request, function(response, status) {
			if (status == google.maps.DirectionsStatus.OK) {
				directionsDisplay.setDirections(response);
				var route = response.routes[0];

				var summaryPanel = document.getElementById('directions_panel');

				summaryPanel.innerHTML = '';

				for (var i = 0; i < route.legs.length; i++) {
					var routeSegment = i + 1;
					summaryPanel.innerHTML += '<div id="distance">'
							+ route.legs[i].distance.text + '</div>';
							var res = Number(route.legs[i].distance.text.replace(" km",
							"").replace(/[$,]+/g, "."))
							* Number(valor);
					summaryPanel.innerHTML += 'R$:' + '<div id="value">' +  res.toFixed(2) + '</div>';

				}

			}
		});
	}
	google.maps.event.addDomListener(window, 'load', initialize);
</script>

</head>
<body>
	<div id="map-canvas"></div>
	<div class="">
		<div id="custom-bootstrap-menu"
			class="navbar navbar-default navbar-fixed-top" role="navigation">
			<div class="navbar-header">
				<a class="navbar-brand" href="/deliver/">GTLog</a>
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-menubuilder">
					<span class="sr-only">Toggle navigation</span><span
						class="icon-bar"></span><span class="icon-bar"></span><span
						class="icon-bar"></span>
				</button>
			</div>
			<div class="collapse navbar-collapse navbar-menubuilder">
				<ul class="nav navbar-nav navbar-right">
					<li><span id="showLoginButton" onclick="showLogin()"><i
							class="fa fa-user fa-2x"></i></span></li>
				</ul>
			</div>
		</div>
	</div>
	<div style='float: right; width: 180px;'>
		<div style='position: fixed'>
			<div id="login">
				<form id="formLogin" action="/deliver/login" method="post">
					<input type="text" name="user" placeholder="Login"> 
					<input type="password" name="pass" placeholder="Senha"> 
					<input type="submit" name="action" value="Entrar" class="btn btn-default">
				</form>
			</div>
		</div>
	</div>
	<div id="pedidoMenu" class="container-fluid">
		<h3>Pedido:</h3>
		
		<div id="hiddenClient" style="display:none">
			<input id="cliente" type="text" class="form-control" value="${sessionScope.usuarioLogado}">
		</div>

		<div class="row voffset3">
			<div class="col-md-3">Serviço:</div>

			<div class="col-md-6">
				<select id="volume" class="selectpicker form-control"
					onclick="atualizaValores()">
					<%
						List<Volume> volumeList = (List<Volume>) request.getAttribute("volumes");
						for (Volume v : volumeList) {
					%>
					<option value="<%=v.getValor()%>"><%=v.getNome()%></option>
					<%
						}
					%>
				</select>
			</div>
		</div>

		<div class="row voffset3">
			<div class="col-md-3">Coleta:</div>
			<div class="col-md-6">
				<input id="start" type="text" class="form-control"
					onChange="calcRoute();">
			</div>
		</div>
			<div class="row voffset3">
				<div class="col-md-3">Entrega:</div>
				<div class="col-md-6">
					<input id="end" type="text" class="form-control"
						onChange="calcRoute();">
				</div>
				<div class="col-md-1">
					<button type="button" class="btn btn-warning" onclick="addRoteNode()"><i class="fa fa-plus"></i></button>
				</div>
			</div>
			
		<div id="routes">
			
			<div class="nodeRoute" id="route2" style="display:none">
			<span><b>2</b></span> 
			<button type="button" class="btn btn-danger" onclick="removeRoteNode(2)"><i class="fa fa-minus"></i></button>
				<div class="row voffset3">
					<div class="col-md-3">Coleta:</div>
					<div class="col-md-6">
						<input id="start2" type="text" class="form-control"
							onChange="calcRoute();">
					</div>
				</div>
				<div class="row voffset3">
					<div class="col-md-3">Entrega:</div>
					<div class="col-md-6">
						<input id="end2" type="text" class="form-control"
							onChange="calcRoute();">
					</div>
				</div>
			</div>
			
			<div class="nodeRoute" id="route3" style="display:none">
			<span><b>3</b></span>
			<button type="button" class="btn btn-danger" onclick="removeRoteNode(3)"><i class="fa fa-minus"></i></button>
				<div class="row voffset3">
					<div class="col-md-3">Coleta:</div>
					<div class="col-md-6">
						<input id="start3" type="text" class="form-control"
							onChange="calcRoute();">
					</div>
				</div>
				<div class="row voffset3">
					<div class="col-md-3">Entrega:</div>
					<div class="col-md-6">
						<input id="end3" type="text" class="form-control"
							onChange="calcRoute();">
					</div>
				</div>
			</div>
			
			<div class="nodeRoute" id="route4" style="display:none">
			<span><b>4</b></span>
			<button type="button" class="btn btn-danger" onclick="removeRoteNode(4)"><i class="fa fa-minus"></i></button>
				<div class="row voffset3">
					<div class="col-md-3">Coleta:</div>
					<div class="col-md-6">
						<input id="start4" type="text" class="form-control"
							onChange="calcRoute();">
					</div>
				</div>
				<div class="row voffset3">
					<div class="col-md-3">Entrega:</div>
					<div class="col-md-6">
						<input id="end4" type="text" class="form-control"
							onChange="calcRoute();">
					</div>
				</div>
			</div>
			
			<div class="nodeRoute" id="route5" style="display:none">
			<span><b>5</b></span>
			<button type="button" class="btn btn-danger" onclick="removeRoteNode(5)"><i class="fa fa-minus"></i></button>
				<div class="row voffset3">
					<div class="col-md-3">Coleta:</div>
					<div class="col-md-6">
						<input id="start5" type="text" class="form-control"
							onChange="calcRoute();">
					</div>
				</div>
				<div class="row voffset3">
					<div class="col-md-3">Entrega:</div>
					<div class="col-md-6">
						<input id="end5" type="text" class="form-control"
							onChange="calcRoute();">
					</div>
				</div>
			</div>
			<div class="nodeRoute" id="route6" style="display:none">
			<span><b>6</b></span>
			<button type="button" class="btn btn-danger" onclick="removeRoteNode(6)"><i class="fa fa-minus"></i></button>
				<div class="row voffset3">
					<div class="col-md-3">Coleta:</div>
					<div class="col-md-6">
						<input id="start6" type="text" class="form-control"
							onChange="calcRoute();">
					</div>
				</div>
				<div class="row voffset3">
					<div class="col-md-3">Entrega:</div>
					<div class="col-md-6">
						<input id="end6" type="text" class="form-control"
							onChange="calcRoute();">
					</div>
				</div>
			</div>
			
			<div class="nodeRoute" id="route7" style="display:none">
			<span><b>7</b></span>
			<button type="button" class="btn btn-danger" onclick="removeRoteNode(7)"><i class="fa fa-minus"></i></button>
				<div class="row voffset3">
					<div class="col-md-3">Coleta:</div>
					<div class="col-md-6">
						<input id="start7" type="text" class="form-control"
							onChange="calcRoute();">
					</div>
				</div>
				<div class="row voffset3">
					<div class="col-md-3">Entrega:</div>
					<div class="col-md-6">
						<input id="end7" type="text" class="form-control"
							onChange="calcRoute();">
					</div>
				</div>
			</div>
			
			<div class="nodeRoute" id="route8" style="display:none">
			<span><b>8</b></span>
			<button type="button" class="btn btn-danger" onclick="removeRoteNode(8)"><i class="fa fa-minus"></i></button>
				<div class="row voffset3">
					<div class="col-md-3">Coleta:</div>
					<div class="col-md-6">
						<input id="start8" type="text" class="form-control"
							onChange="calcRoute();">
					</div>
				</div>
				<div class="row voffset3">
					<div class="col-md-3">Entrega:</div>
					<div class="col-md-6">
						<input id="end8" type="text" class="form-control"
							onChange="calcRoute();">
					</div>
				</div>
			</div>
			<div class="nodeRoute" id="route9" style="display:none">
			<span><b>9</b></span>
			<button type="button" class="btn btn-danger" onclick="removeRoteNode(9)"><i class="fa fa-minus"></i></button>
				<div class="row voffset3">
					<div class="col-md-3">Coleta:</div>
					<div class="col-md-6">
						<input id="start9" type="text" class="form-control"
							onChange="calcRoute();">
					</div>
				</div>
				<div class="row voffset3">
					<div class="col-md-3">Entrega:</div>
					<div class="col-md-6">
						<input id="end9" type="text" class="form-control"
							onChange="calcRoute();">
					</div>
				</div>
			</div>
			<div class="nodeRoute" id="route10" style="display:none">
			<span><b>10</b></span>
			<button type="button" class="btn btn-danger" onclick="removeRoteNode(10)"><i class="fa fa-minus"></i></button>
				<div class="row voffset3">
					<div class="col-md-3">Coleta:</div>
					<div class="col-md-6">
						<input id="start10" type="text" class="form-control"
							onChange="calcRoute();">
					</div>
				</div>
				<div class="row voffset3">
					<div class="col-md-3">Entrega:</div>
					<div class="col-md-6">
						<input id="end10" type="text" class="form-control"
							onChange="calcRoute();">
					</div>
				</div>
			</div>
			
		</div>
		
		<div class="row voffset3">
			<div class="col-md-6">
				<button type="button" class="btn btn-info">Buscar Caminho</button>
			</div>
			<div class="col-md-6">
				<%
					if (session.getAttribute("usuarioLogado") != null) {
				%>
				<button type="button" class="btn btn-success" onClick="postPedido()">Confirmar
					Pedido</button>
				<%
					} else {
				%>
				<button type="button" class="btn btn-success" disabled="disabled">Confirmar
					Pedido</button>
				<%
					}
				%>
			</div>
		</div>
		<div class="row voffset3">
			<div id="directions_panel" class="col-md-9"></div>
		</div>
	</div>
</body>
</html>