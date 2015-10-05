
<html>
<head>
<title>Deliver</title>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/mainMapa.css">
<script src="resources/js/jquery.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="resources/javascript/mapa.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
<script>
	var directionsDisplay;
	var directionsService = new google.maps.DirectionsService();
	var map;
	
    var style = [{
                     "featureType": "road",
                     "elementType": "geometry",
                     "stylers": [
                         {
                             "lightness": 100
                         },
                         {
                             "visibility": "simplified"
                         }
                     ]
                 },
                 {
                     "featureType": "water",
                     "elementType": "geometry",
                     "stylers": [
                         {
                             "visibility": "on"
                         },
                         {
                             "color": "#C6E2FF"
                         }
                     ]
                 },
                 {
                     "featureType": "poi",
                     "elementType": "geometry.fill",
                     "stylers": [
                         {
                             "color": "#C5E3BF"
                         }
                     ]
                 },
                 {
                     "featureType": "poi.business",
                     "stylers": [
                               { "visibility": "off" }
                     ]
                 },
                 {
                     "featureType": "road",
                     "elementType": "geometry.fill",
                     "stylers": [
                         {
                             "color": "#D1D1B8"
                         }
                     ]
                 }
             ]

	function initialize() {
		directionsDisplay = new google.maps.DirectionsRenderer();
		var cidade = new google.maps.LatLng(-30.101117, -51.1589488);
		var mapOptions = {
			zoom : 7,
			mapTypeId : google.maps.MapTypeId.ROADMAP,
			center : cidade,
			styles: style
		}
		
		map = new google.maps.Map(document.getElementById("map-canvas"),
				mapOptions);
		directionsDisplay.setMap(map);

	}

	function calcRoute() {
		var start = document.getElementById("start").value;
		var end = document.getElementById("end").value;

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
					summaryPanel.innerHTML += '<b>Informa��es: ' + '</b><br>';
					summaryPanel.innerHTML += route.legs[i].start_address
							+ ' <br> para <br>';
					summaryPanel.innerHTML += route.legs[i].end_address
							+ '<br>';
					summaryPanel.innerHTML += route.legs[i].duration.text
							+ '<br>';
					summaryPanel.innerHTML += route.legs[i].distance.text
							+ '<br><br>';
					var res =  "Valor: R$ " + Number(route.legs[i].distance.text.replace(" km", "").replace(/[$,]+/g,".")) * 10;
					summaryPanel.innerHTML += res  + '<br><br>';

				}

			}
		});
	}
	google.maps.event.addDomListener(window, 'load', initialize);
</script>

</head>
<body>
	<div id="pedidoMenu" class="container-fluid">
		<h3>Pedido:</h3>
	 	<div class="row voffset3">
	        <div class="col-md-3">Coleta:</div>
	        <div class="col-md-6"><input id="start" type="text" onChange="calcRoute();"></div>
      	</div>
      	<div class="row voffset3">
	        <div class="col-md-3">Entrega:</div>
	        <div class="col-md-6"><input id="end" type="text" onChange="calcRoute();"></div>
      	</div>
	    <div class="row voffset3">
			    <div class="col-md-3">
            	<button type="button" class="btn btn-info">Buscar Caminho</button>
           	</div>
          	</div>
           <div class="row voffset3">
      	 		<div class="col-md-3">
        	 	<form action="/Home/SearchResults" class="" method="post">  
            		<button type="submit" class="btn btn-success">Confirmar Pedido</button>
            	</form>
           	</div>
           </div>
		<div class="row voffset3">
			<div id="directions_panel" class="col-md-9"></div>
		</div>
	</div>
	
	<div id="map-canvas"></div>
</body>
</html>