<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Homepage</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons CDN for User Icon -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD8RD20mEV_I4LM8veafl2RmuNbat7u9jU&libraries=places"></script>
    <link href="../CSS/User.css" rel="stylesheet">

    <style>
        .full-bg {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 110%;
            background-image: url('https://images.pexels.com/photos/1955134/pexels-photo-1955134.jpeg?cs=srgb&dl=pexels-sebastian-palomino-933481-1955134.jpg&fm=jpg');
            background-size: cover;
            background-position: center center;
            background-attachment: fixed;
            z-index: -1;
        }

        .user-icon {
            font-size: 1.5rem;
            color: #6c757d;
            background-color: #f1f1f1;
            border-radius: 50%;
            padding: 8px;
            height: 35px;
            width: 35px;
            display: flex;
            justify-content: center;
            align-items: center;
            border: 2px solid #ddd;
            cursor: pointer;
        }

        .user-menu {
            display: none;
            position: absolute;
            top: 40px;
            right: 10px;
            background-color: #fff;
            padding: 10px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .user-info {
            position: relative;
        }

        .user-info:hover .user-menu {
            display: block;
        }

        .logout-btn {
            font-size: 1.5rem;
            font-weight: bold;
            color: #000000;
            background: #edd5d3;
            border: none;
            padding: 5px;
            text-align: center;
        }
        
        .logout-btn:hover {
            color: #e83727;
        }

        .form-container {
            background-color: rgba(0, 0, 0, 0.5);
            border-radius: 8px;
            padding: 10px;
            border: 2px solid #ffffff;
            margin-top: 100px;
            width: 100%;
            height: 100%;
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
        }

        .form-fields label {
            justify-content: center;
            align-items: center;
            font-size: 1rem;
            margin-bottom: 5px;
            color: #ffffff;
        }

        .form-fields input {
            border-radius: 5px;
            border: 1px solid #ffffff;
            margin-bottom: 10px;
            padding: 8px;
            width: 100%;
        }

        .map-container {
            width: 100%;
            border-radius: 8px;
            border: 2px solid #ffffff;
            margin-bottom: 15px;
            margin-top: 10px;
        }

        .choose-cab-btn button {
            width: 50%;
            border-radius: 5px;
            padding: 10px;
            font-size: 1rem;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #map {
            width: 100%;
            height: 250px;
            border-radius: 8px;
        }

        .content-left {
            color: #fff;
            padding: 40px;
            background-color: rgba(0, 0, 0, 0.5);
            border-radius: 8px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 50%;
            text-align: center;
        }

        .content-left h2 {
            font-size: 2.5rem;
            margin-bottom: 20px;
            font-weight: 600;
            color: #f1f1f1;
        }

        .content-left p {
            font-size: 1.2rem;
            line-height: 1.6;
            color: #e0e0e0;
            font-weight: 500;
        }

        .form-container {
            margin-top: 110px;
        }
    </style>
</head>

<body>

    <!-- Header Section -->
    <div class="header d-flex justify-content-between align-items-center">
        <div class="cab-name">MegaCity Cab</div>
        <div class="nav-links d-flex justify-content-center flex-grow-1">
            <a href="U_Homepage.jsp">Home</a>
            <a href="ContactUs.jsp">Contact Us</a>
            <a href="Mybooking.jsp">My Bookings</a>
            <a href="UpdateProfile.jsp">Profile</a>
            <a href="UserGuide.jsp">Guidelines</a>
        </div>
        <div class="user-info d-flex align-items-center">
            <c:if test="${not empty sessionScope.userFirstName}">
                <div class="d-flex align-items-center">
                    <div class="user-icon me-2" onclick="toggleUserMenu()">
                        <i class="bi bi-person-circle"></i>
                    </div>
                    <span class="greeting-text me-2">Hi, ${sessionScope.userFirstName}</span>
                    <c:if test="${not empty sessionScope.userUsername}">
                        <span class="username-text">@${sessionScope.userUsername}</span>
                    </c:if>
                </div>
                <div class="user-menu">
                    <button class="logout-btn" onclick="confirmLogout()">Logout</button>
                </div>
            </c:if>
        </div>
    </div>

    <!-- Full-page background image with overlay -->
    <section>
        <div class="full-bg">
            <div class="container">
                <div class="row justify-content-center">
                    <!-- Left Column with Paragraph (Centered) -->
                    <div class="col-12 col-md-6 d-flex justify-content-center align-items-center">
                        <div class="content-left">
                            <div>
                                <h2>Your Journey with <br>Mega City Cabs<br>
                                	Starts Here. 
                                </h2>
                                <p>
                                    Your safety and comfort is our main concern.
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Right Column with Form -->
                    <div class="col-12 col-md-6">
                        <form id="locationForm" action="<%= request.getContextPath() %>/user/CabServlet" method="POST">
                            <div class="form-container">
                                <!-- Form Fields (Pickup and Dropoff Locations) -->
                                <div class="form-fields">
                                    <label for="pickup">Pickup Location</label>
                                    <input id="pickup" class="form-control" type="text" name="pickupLocation" placeholder="Enter pickup location" required>

                                    <label for="dropoff">Drop-off Location</label>
                                    <input id="dropoff" class="form-control" type="text" name="dropLocation" placeholder="Enter drop-off location" required>

                                    <button type="button" class="btn btn-primary" onclick="validateAndCalculate()">Calculate Distance</button>

                                    <h4 class="text-center mt-3" id="distance-section" style="display: none; color:white;">
                                        Distance: <span id="distance">0</span>
                                    </h4>

                                    <!-- Hidden input field for distance -->
                                    <input type="hidden" id="hiddenDistance" name="distance">
                                </div>

                                <!-- Map Container -->
                                <div class="map-container">
                                    <div id="map"></div>
                                </div>

                                <!-- "Choose a Cab" Button (Redirect to next page) -->
                                <div class="choose-cab-btn" id="choose-cab-btn">
                                    <button type="submit" class="btn btn-success" onclick="return validateAndSubmit();">
                                        Choose a Cab <i class="bi bi-arrow-right"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function toggleUserMenu() {
            let menu = document.querySelector('.user-menu');
            menu.style.display = (menu.style.display === "block") ? "none" : "block";
        }

        function confirmLogout() {
            let confirmAction = confirm("Are you sure you want to logout?");
            if (confirmAction) {
                window.location.href = "U_Login.jsp"; // Redirect to login page
            }
        }

        function validateAndCalculate() {
            let pickup = document.getElementById("pickup").value.trim();
            let dropoff = document.getElementById("dropoff").value.trim();

            if (pickup === "" || dropoff === "") {
                alert("Please enter both Pickup and Drop-off locations before calculating the distance.");
                return;
            }

            // Call the function to calculate the distance
            calculateDistance();
        }

        function validateAndSubmit() {
            let pickup = document.getElementById("pickup").value.trim();
            let dropoff = document.getElementById("dropoff").value.trim();
            let distance = document.getElementById("hiddenDistance").value.trim();

            if (pickup === "" || dropoff === "") {
                alert("Please enter both Pickup and Drop-off locations before choosing a cab.");
                return false; // Prevent form submission
            }

            return true; // Allow form submission
        }

        let map;
        let directionsService;
        let directionsRenderer;

        function initMap() {
            const sriLankaBounds = {
                north: 10.0,
                south: 5.5,
                west: 79.5,
                east: 82.0,
            };

            map = new google.maps.Map(document.getElementById("map"), {
                center: { lat: 7.8731, lng: 80.7718 }, // Centered on Sri Lanka
                zoom: 9,
                restriction: {
                    latLngBounds: sriLankaBounds,
                    strictBounds: true,
                },
            });
            directionsService = new google.maps.DirectionsService();
            directionsRenderer = new google.maps.DirectionsRenderer();
            directionsRenderer.setMap(map);

            const pickupInput = document.getElementById("pickup");
            const dropoffInput = document.getElementById("dropoff");
            new google.maps.places.Autocomplete(pickupInput, { componentRestrictions: { country: "LK" } });
            new google.maps.places.Autocomplete(dropoffInput, { componentRestrictions: { country: "LK" } });
        }

        function calculateDistance() {
            const pickup = document.getElementById("pickup").value;
            const dropoff = document.getElementById("dropoff").value;

            if (!pickup || !dropoff) {
                alert("Please enter both pickup and drop-off locations.");
                return;
            }

            const geocoder = new google.maps.Geocoder();

            // Check if the pickup location is within Sri Lanka
            geocoder.geocode({ address: pickup }, function (results, status) {
                if (status !== google.maps.GeocoderStatus.OK || !isWithinSriLanka(results[0].geometry.location)) {
                    alert("Pickup location must be within Sri Lanka.");
                    return;
                }

                // Check if the dropoff location is within Sri Lanka
                geocoder.geocode({ address: dropoff }, function (results, status) {
                    if (status !== google.maps.GeocoderStatus.OK || !isWithinSriLanka(results[0].geometry.location)) {
                        alert("Drop-off location must be within Sri Lanka.");
                        return;
                    }

                    // Make API request to calculate distance
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
                            document.getElementById("distance-section").style.display = "block";
                            document.getElementById("hiddenDistance").value = distance;
                            document.getElementById("choose-cab-btn").style.display = "block";  // Show the "Choose a Cab" button
                        } else {
                            alert("Could not calculate distance.");
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

        window.onload = initMap;
    </script>

</body>

</html>
