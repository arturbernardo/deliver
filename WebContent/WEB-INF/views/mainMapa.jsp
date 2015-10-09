<%@page import="br.com.ab.mapa.model.Volume"%>
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
<link rel="stylesheet" type="text/css" href="resources/css/pedidos.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<script src="resources/js/jquery.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="resources/javascript/mapa.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
<script>
	function showLogin() {
		$('#login').css("display", "block");
	}

	function postPedido() {

		var coleta = $('#start').val();
		var entrega = $('#end').val();
		var distancia = $('#distance').html();
		var valor = $('#value').html();
		var volume = $('#volume').find(":selected").val();

		$.ajax({
			url : "/deliver/save",
			data : {
				volume : volume,
				coleta : coleta,
				entrega : entrega,
				distancia : distancia,
				valor : valor
			},
			type : "POST",
			success : function(smartphone) {
				console.log("aadasdasd");
			},
			error : function() {
				console.log("werrrrooooo");
			}
		});

		event.preventDefault();
	}

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
					summaryPanel.innerHTML += '<b>Informações: ' + '</b><br>';
					summaryPanel.innerHTML += route.legs[i].duration.text
							+ '<br>';
					summaryPanel.innerHTML += '<div id="distance">'
							+ route.legs[i].distance.text + '</div>'
							+ '<br><br>';
					var res = Number(route.legs[i].distance.text.replace(" km",
							"").replace(/[$,]+/g, "."))
							* Number(valor);
					summaryPanel.innerHTML += 'Valor: R$' + '<div id="value">'
							+ res + '</div><br><br>';

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
				<form id="formLogin" action="/deliver/login">
					<input type="text" name="user" placeholder="Login"> <input
						type="password" name="pass" placeholder="Senha"> <input
						type="submit" name="action" value="Entrar" class="btn btn-default">
				</form>
			</div>
		</div>
	</div>
	<div id="pedidoMenu" class="container-fluid">
		<h3>Pedido:</h3>

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
		</div>
		<div class="row voffset3">
			<div class="col-md-3">
				<button type="button" class="btn btn-info">Buscar Caminho</button>
			</div>
		</div>
		<div class="row voffset3">
			<div class="col-md-3">
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