
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
	var chicago = new google.maps.LatLng(26.912417,75.787288);
	var mapOptions = {
	zoom:7,
	mapTypeId: google.maps.MapTypeId.ROADMAP,
	center: chicago
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
		<strong>Start: </strong> <select id="start" onChange="calcRoute();">
			<option value="Jaipur">Jaipur</option>
			<option value="jagatpura">jagatpura</option>
			<option value="malviya nagar, Jaipur">Malviya Nagar</option>
			<option value="khatu">Sikar</option>
			<option value="Dausa">Dausa</option>
			<option value="Luniawas">Luniyawas</option>
			<option value="Karoli">Karoli</option>
			<option value="Baran">Baran</option>
			<option value="Sawai Madhopur">Sawai Madhopur</option>
			<option value="Udaipur">Udaipur</option>
			<option value="Bikaner">Bikaner</option>
			<option value="Churu">Churu</option>
		</select> <strong>End: </strong> <select id="end" onChange="calcRoute();">
			<option value="Jaipur">Jaipur</option>
			<option value="bassi">bassi</option>
			<option value="goner">goner</option>
			<option value="Khaniya">Khaniya</option>
			<option value="Luniawas">Luniyawas</option>
			<option value="Ajmer">Ajmer</option>
			<option value="Karoli">Karoli</option>
			<option value="Baran">Baran</option>
			<option value="Sawai Madhopur">Sawai Madhopur</option>
			<option value="Udaipur">Udaipur</option>
			<option value="Bikaner">Bikaner</option>
			<option value="Churu">Churu</option>
		</select>
	</div>

	<div id="map-canvas" style="float: left; width: 70%; height: 40%"></div>

	<div id="directions_panel"
		style="margin: 20px; background-color: #FFEE77;"></div>

</body>
</html>