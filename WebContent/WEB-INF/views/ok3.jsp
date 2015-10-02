
<html>
<head>
<title>Simple Map</title>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<style>
html, body, #map-canvas {
	margin: 0;
	padding: 0;
	height: 100%;
}
</style>
<script
	src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
<script>

	var directionsDisplay;
	var directionsService = new google.maps.DirectionsService();
	var map;
	
	function initialize() {
	directionsDisplay = new google.maps.DirectionsRenderer();
	var cidade = new google.maps.LatLng(-30.101117, -51.1589488);
	var mapOptions = {
	zoom:7,
	mapTypeId: google.maps.MapTypeId.ROADMAP,
	center: cidade
	}
	map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
	directionsDisplay.setMap(map);
	
	}
	
	function calcRoute() {
		var start = document.getElementById("start").value;
		var end = document.getElementById("end").value;
		
		var request = {
			origin:start,
			destination:end,
			travelMode: google.maps.TravelMode.DRIVING
		};
		
		directionsService.route(request, function(response, status) {
			if (status == google.maps.DirectionsStatus.OK) {
				directionsDisplay.setDirections(response);
				var route = response.routes[0];
				//  alert(route.legs[1].duration.text);
				var summaryPanel = document.getElementById('directions_panel');
				summaryPanel.innerHTML = '';
				// For each route, display summary information.
				for (var i = 0; i < route.legs.length; i++) {
					var routeSegment = i + 1;
					summaryPanel.innerHTML += '<b>Route Segment: ' + routeSegment + '</b><br>';
					summaryPanel.innerHTML += route.legs[i].start_address + ' to ';
					summaryPanel.innerHTML += route.legs[i].end_address + '<br>';
					summaryPanel.innerHTML += route.legs[i].duration.text + '<br>';
					summaryPanel.innerHTML += route.legs[i].distance.text + '<br><br>';
					
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
	<!--  <div id="map-canvas"></div>-->
	<h3>Valor: R$ 10,00 por kilometro rodado</h3>
	<div>
		<input id="start" type="text" onChange="calcRoute();">
		<input id="end"type="text" onChange="calcRoute();">
	</div>

	<div id="map-canvas" style="float: left; width: 70%; height: 40%"></div>

	<div id="directions_panel"
		style="margin: 20px; background-color: #FFEE77;"></div>

</body>
</html>