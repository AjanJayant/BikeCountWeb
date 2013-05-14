/* For main map in Step 2 */
function initialize() {
    var ucla = new google.maps.LatLng(34.07008, -118.444469);
    var santa_monica = new google.maps.LatLng(34.026201, -118.491383);
    var mapOptions = {
        center: ucla,
        zoom: 11,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
    var marker = new google.maps.Marker({
        position: ucla,
        map: map,
        draggable: true,
        animation: google.maps.Animation.DROP
    });
    google.maps.event.addListener(marker, 'click', toggleBounce);
    var marker2 = new google.maps.Marker({
        position: santa_monica,
        map: map,
        draggable: true,
        animation: google.maps.Animation.DROP
    });
    google.maps.event.addListener(marker2, 'click', toggleBounce);
}

google.maps.event.addDomListener(window, 'load', initialize);

function toggleBounce() {
    if (marker.getAnimation() != null) {
        marker.setAnimation(null);
    }
    else {
        marker.setAnimation(google.maps.Animation.BOUNCE);
    }
}

var myCoordsLength = 6;
var geocoder = new google.maps.Geocoder();

function geocodePosition(pos) {
  geocoder.geocode({
    latLng: pos
  }, function(responses) {
    if (responses && responses.length > 0) {
      updateMarkerAddress(responses[0].formatted_address);
    } else {
      updateMarkerAddress('Cannot determine address at this location.');
    }
  });
}

function updateMarkerStatus(str) {
  document.getElementById('markerStatus').innerHTML = str;
}

function updateMarkerPosition(latLng) {
  document.getElementById('Latitude').value = latLng.lat().toFixed(myCoordsLength);
  document.getElementById('Longitude').value = latLng.lng().toFixed(myCoordsLength);
}

function updateMarkerAddress(str) {
document.getElementById('address').innerHTML = str;
}

/* Map for popup in Step 2 */

var map2;
function initialize2() 
{
    var latLng = new google.maps.LatLng(34.048376, -118.183256);
    var mapOptions = {
        zoom: 9,
        center: latLng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map2 = new google.maps.Map(document.getElementById("mapcanvas"), mapOptions);
    google.maps.event.trigger(map2, 'resize');

    var reCenter = new google.maps.LatLng(34.048376, -118.183256);                  
    map2.setCenter(reCenter);

    var marker = new google.maps.Marker({
        position: latLng,
        title: 'Point A',
        map: map2,
        draggable: true,
    });     

    // Update current position info.
    updateMarkerPosition(latLng);
    geocodePosition(latLng);     

    // Add dragging event listeners.
    google.maps.event.addListener(marker, 'dragstart', function() {
        updateMarkerAddress('Dragging...');
    });
     
    google.maps.event.addListener(marker, 'drag', function() {
        updateMarkerStatus('Dragging...');
        updateMarkerPosition(marker.getPosition());
        
    });
      
    google.maps.event.addListener(marker, 'dragend', function() {
        updateMarkerStatus('Drag ended');
        geocodePosition(marker.getPosition());
    });

}
google.maps.event.addDomListener(window, 'load', initialize2);
window.onload = function(){window.onload; map2.checkResize()} 