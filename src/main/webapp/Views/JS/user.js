	let map;
    let markers = [];
    let directionsService;
    let directionsRenderer;

    function initMap() {
        map = new google.maps.Map(document.getElementById("map"), {
            center: { lat: 7.8731, lng: 80.7718 },
            zoom: 6,
        });
        directionsService = new google.maps.DirectionsService();
        directionsRenderer = new google.maps.DirectionsRenderer();
        directionsRenderer.setMap(map);

        const pickupInput = document.getElementById("pickup");
        const dropoffInput = document.getElementById("dropoff");
        new google.maps.places.Autocomplete(pickupInput);
        new google.maps.places.Autocomplete(dropoffInput);
    }

    function addMarker(location) {
        const marker = new google.maps.Marker({
            position: location,
            map: map
        });
        markers.push(marker);
    }

    function calculateDistance() {
        const pickup = document.getElementById("pickup").value;
        const dropoff = document.getElementById("dropoff").value;

        if (!pickup || !dropoff) {
            alert("Please enter both locations");
            return;
        }

        const geocoder = new google.maps.Geocoder();

        geocoder.geocode({ address: pickup }, function (results, status) {
            if (status !== google.maps.GeocoderStatus.OK || !isWithinSriLanka(results[0].geometry.location)) {
                alert("Pickup location must be within Sri Lanka");
                return;
            }

            geocoder.geocode({ address: dropoff }, function (results, status) {
                if (status !== google.maps.GeocoderStatus.OK || !isWithinSriLanka(results[0].geometry.location)) {
                    alert("Drop-off location must be within Sri Lanka");
                    return;
                }

                const request = {
                    origin: pickup,
                    destination: dropoff,
                    travelMode: google.maps.TravelMode.DRIVING,
                };

                directionsService.route(request, function (result, status) {
                    if (status == google.maps.DirectionsStatus.OK) {
                        directionsRenderer.setDirections(result);
                        const distance = result.routes[0].legs[0].distance.text;
                        document.getElementById("distance").innerText = distance;
                    } else {
                        alert("Could not calculate distance");
                    }
                });
            });
        });
    }

    function isWithinSriLanka(location) {
        const sriLankaBounds = new google.maps.LatLngBounds(
            new google.maps.LatLng(5.5, 79.5),
            new google.maps.LatLng(10.0, 82.0)
        );
        return sriLankaBounds.contains(location);
    }

