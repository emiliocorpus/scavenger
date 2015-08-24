        var clueNum = 0;
        var map;
        var markers = []

function start() {    

  navigator.geolocation.getCurrentPosition(function(position) {

        var lat = position.coords.latitude;
        var lng = position.coords.longitude;
        var myCenter=new google.maps.LatLng(lat,lng);
        
        function initialize()
        {
        var mapProp = {
          center:myCenter,
          zoom:13,
          mapTypeId:google.maps.MapTypeId.ROADMAP
          };

          map = new google.maps.Map(document.getElementById("map-canvas"),mapProp);

          google.maps.event.addListener(map, 'click', function(event) {
            placeMarker(event.latLng);
          });

        }


        function placeMarker(location) {
          clueNum += 1
          var marker = new google.maps.Marker({
            position: location,
            map: map,
          });
          var infowindow = new google.maps.InfoWindow({
            content: 'Clue Number: ' + String(clueNum) + '<br>Latitude: ' + location.lat() + '<br>Longitude: ' + location.lng()
          });
          markers.push(marker)
          google.maps.event.addListener(marker, 'click', function() {
            infowindow.open(map,marker);
            });

          infowindow.open(map,marker);
        }


        console.log("***************************")
        initialize()

    })
}




start()

function setMapOnAll(map) {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(map);
  }
}

function clearMarkers() {
  setMapOnAll(null);
}

// Shows any markers currently in the array.
function showMarkers() {
  setMapOnAll(map);
}

// Deletes all markers in the array by removing references to them.
function deleteMarkers() {
  clearMarkers();
  markers = [];
}
            
