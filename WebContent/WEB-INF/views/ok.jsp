<html>
  <head>
	<script src="https://maps.googleapis.com/maps/api/js"></script>
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
    </script>
  </head>
  <body>
    <div id="map"></div>
  </body>
</html>

