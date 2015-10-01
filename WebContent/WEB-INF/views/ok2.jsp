<html>
  <head>
	<script src="https://maps.googleapis.com/maps/api/js"></script>
	<script src="../../resources/js/jquery.js"></script>
	<style>
	  #map {
	    width: 500px;
	    height: 400px;
	    background-color: #CCC;
	  }
	</style>
    <script>
    
    function initialize() {
        var mapCanvas = document.getElementById('map');
        var mapOptions = {
          center: new google.maps.LatLng(44.5403, -78.5463),
          zoom: 8,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        var map = new google.maps.Map(mapCanvas, mapOptions)
      }
      google.maps.event.addDomListener(window, 'load', initialize);
    
    var directionsDisplay;
    var directionsService = new google.maps.DirectionsService();
    var map;

    function initialize() {
      directionsDisplay = new google.maps.DirectionsRenderer();
      var chicago = new google.maps.LatLng(41.850033, -87.6500523);
      var mapOptions = {
        zoom:7,
        center: chicago
      }
      map = new google.maps.Map(document.getElementById("map"), mapOptions);
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
      directionsService.route(request, function(result, status) {
        if (status == google.maps.DirectionsStatus.OK) {
          directionsDisplay.setDirections(result);
          $('#distance').text(directionsResult.routes[0].legs[0].distance.text);
          $('#duration').text(directionsResult.routes[0].legs[0].duration.text);
        }
      });
    }
    
  	</script>
  </head>
  <body>
  <div>
<h3 id="distance"></h3>
<h3 id="duration"></h3>
<strong>Start: </strong>
<select id="start" onchange="calcRoute();">
  <option value="chicago, il">Chicago</option>
  <option value="st louis, mo">St Louis</option>
  <option value="joplin, mo">Joplin, MO</option>
  <option value="oklahoma city, ok">Oklahoma City</option>
  <option value="amarillo, tx">Amarillo</option>
  <option value="gallup, nm">Gallup, NM</option>
  <option value="flagstaff, az">Flagstaff, AZ</option>
  <option value="winona, az">Winona</option>
  <option value="kingman, az">Kingman</option>
  <option value="barstow, ca">Barstow</option>
  <option value="san bernardino, ca">San Bernardino</option>
  <option value="los angeles, ca">Los Angeles</option>
</select>
<strong>End: </strong>
<select id="end" onchange="calcRoute();">
  <option value="chicago, il">Chicago</option>
  <option value="st louis, mo">St Louis</option>
  <option value="joplin, mo">Joplin, MO</option>
  <option value="oklahoma city, ok">Oklahoma City</option>
  <option value="amarillo, tx">Amarillo</option>
  <option value="gallup, nm">Gallup, NM</option>
  <option value="flagstaff, az">Flagstaff, AZ</option>
  <option value="winona, az">Winona</option>
  <option value="kingman, az">Kingman</option>
  <option value="barstow, ca">Barstow</option>
  <option value="san bernardino, ca">San Bernardino</option>
  <option value="los angeles, ca">Los Angeles</option>
</select>
</div>
    <div id="map"></div>
  </body>
</html>

