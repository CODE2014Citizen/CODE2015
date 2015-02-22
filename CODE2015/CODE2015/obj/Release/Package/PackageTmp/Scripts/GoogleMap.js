google.maps.event.addDomListener(window, 'load', init);



var map;
var geocoder;

function init() {
 
    // Create map parameters
    var mapOptions = {
        center: new google.maps.LatLng(44.3000, -78.3167, 4),
        zoom: 15,
        zoomControl: true,
        zoomControlOptions: {
            style: google.maps.ZoomControlStyle.SMALL,
        },
        disableDoubleClickZoom: true,
        mapTypeControl: true,
        mapTypeControlOptions: {
            style: google.maps.MapTypeControlStyle.DROPDOWN_MENU,
        },
        scaleControl: false,
        scrollwheel: true,
        streetViewControl: true,
        draggable: true,
        overviewMapControl: false,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        styles: [
		{
		    featureType: "landscape",
		    stylers: [
			{ saturation: -100 },
			{ lightness: 65 },
			{ visibility: "on" }
		    ]
		}, {
		    featureType: "poi",
		    stylers: [
			{ saturation: -100 },
			{ lightness: 51 },
			{ visibility: "simplified" }
		    ]
		}, {
		    featureType: "road.highway",
		    stylers: [
			{ saturation: -100 },
			{ visibility: "simplified" }
		    ]
		}, {
		    featureType: "road.arterial",
		    stylers: [
			{ saturation: -100 },
			{ lightness: 30 },
			{ visibility: "on" }
		    ]
		}, {
		    featureType: "road.local",
		    stylers: [
			{ saturation: -100 },
			{ lightness: 40 },
			{ visibility: "on" }
		    ]
		}, {
		    featureType: "transit",
		    stylers: [
			{ saturation: -100 },
			{ visibility: "simplified" }
		    ]
		}, {
		    featureType: "administrative.province",
		    stylers: [
			{ visibility: "off" }
		    ]
		    /** /
                },{
                    featureType: "administrative.locality",
                    stylers: [
                        { visibility: "off" }
                    ]
                },{
                    featureType: "administrative.neighborhood",
                    stylers: [
                        { visibility: "on" }
                    ]
                    /**/
		}, {
		    featureType: "water",
		    elementType: "labels",
		    stylers: [
			{ visibility: "on" },
			{ lightness: -25 },
			{ saturation: -100 }
		    ]
		}, {
		    featureType: "water",
		    elementType: "geometry",
		    stylers: [
			{ hue: "#ffff00" },
			{ lightness: -25 },
			{ saturation: -97 }
		    ]
		}
        ],

    }

    var mapElement = document.getElementById('map');
    map = new google.maps.Map(mapElement, mapOptions);
    var locations = [

    ];

    // Mark our location
    for (i = 0; i < locations.length; i++) {
        marker = new google.maps.Marker({
            icon: '',
            position: new google.maps.LatLng(locations[i][1], locations[i][2]),
            map: map
        });
    }

    // Init geocoder
    geocoder = new google.maps.Geocoder();

    if (navigator.geolocation) navigator.geolocation.getCurrentPosition(onPositionUpdate);
}


// Set Location
function onPositionUpdate(position) {
    curLat = position.coords.latitude;
    curLong = position.coords.longitude;
    var center = new google.maps.LatLng(curLat, curLong);

    // Update Map when user's position changes   
    map.setCenter(center, 14);
    map.panTo(center);

    // Reverse Geocode address
    
    geocoder.geocode({ 'latLng': center }, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            if (results[1]) {
                map.setZoom(14);
                marker = new google.maps.Marker({
                    position: center,
                    map: map
                });

                
                $('#TextBoxLocation').val(results[1].formatted_address);
                $('#LabelStatsLocation').html(results[1].formatted_address);

            } else {
        //        alert('No results found');
            }
        } else {
      //      alert('Geocoder failed due to: ' + status);
        }
    });


}


function addressTextChanged(newAddress) {
   // alert(newAddress);
    geocoder.geocode({ 'address': newAddress }, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            if (results[0]) {
                map.setCenter(results[0].geometry.location);
                map.setZoom(14);
                marker = new google.maps.Marker({
                    position: results[0].geometry.location,
                    map: map
                });
                
                $("#StatsLoading").css("visibility", "visible");
                $("#ButtonAddressChange").click();
                $('#LabelStatsLocation').html(results[0].formatted_address);

            } else {
                alert('No results found - Check Location input');
            }
        } else {
            alert('Geocoder failed due to: ' + status);
        }
    });

}





