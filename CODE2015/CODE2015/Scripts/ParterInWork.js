




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

                //Check result 1
                var result = results[1];
                //look for locality tag and administrative_area_level_1
                var city = "";
                var prov = "";
                for (var i = 0, len = result.address_components.length; i < len; i++) {
                    var ac = result.address_components[i];
                    if (ac.types.indexOf("locality") >= 0) city = ac.long_name;
                    if (ac.types.indexOf("administrative_area_level_1") >= 0) prov = ac.long_name;
                }
                $('#HiddenFieldRegion').val(prov);
                $('#HiddenFieldCity').val(city);

                $("#StatsLoading").css("visibility", "visible");
               
                $('#TextBoxLocation').val(results[1].formatted_address);
                $('#TextBoxStatsLocation').val(results[1].formatted_address);

                $("#ButtonAddressChange").click();

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

                //Check result 0
                var result = results[0];
                //look for locality tag and administrative_area_level_1
                var city = "";
                var prov = "";
                for (var i = 0, len = result.address_components.length; i < len; i++) {
                    var ac = result.address_components[i];
                    if (ac.types.indexOf("locality") >= 0) city = ac.long_name;
                    if (ac.types.indexOf("administrative_area_level_1") >= 0) prov = ac.long_name;
                }


                $('#HiddenFieldRegion').val(prov);
                $('#HiddenFieldCity').val(city);

                $("#StatsLoading").css("visibility", "visible");
                
                $('#TextBoxStatsLocation').val(results[0].formatted_address);

                $("#ButtonAddressChange").click();

            } else {
                alert('No results found - Check Location input');
            }
        } else {
            alert('Geocoder failed due to: ' + status);
        }
    });

}

function statsRefresh() {
    geocoder.geocode({ 'address': $('#TextBoxStatsLocation').val() }, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            if (results[0]) {
                map.setCenter(results[0].geometry.location);
                map.setZoom(14);
                marker = new google.maps.Marker({
                    position: results[0].geometry.location,
                    map: map
                });

                //Check result 0
                var result = results[0];
                //look for locality tag and administrative_area_level_1
                var city = "";
                var prov = "";
                for (var i = 0, len = result.address_components.length; i < len; i++) {
                    var ac = result.address_components[i];
                    if (ac.types.indexOf("locality") >= 0) city = ac.long_name;
                    if (ac.types.indexOf("administrative_area_level_1") >= 0) prov = ac.long_name;
                }


                $('#HiddenFieldRegion').val(prov);
                $('#HiddenFieldCity').val(city);

                $("#StatsLoading").css("visibility", "visible");

                $('#TextBoxStatsLocation').val(results[0].formatted_address);

                $("#ButtonAddressChange").click();

            } else {
                alert('No results found - Check Location input');
            }
        } else {
            alert('Geocoder failed due to: ' + status);
        }
    });
}


