<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Vehicles</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        .cab-card { margin-bottom: 20px; }
        .vehicle-bar { display: flex; justify-content: center; flex-wrap: wrap; background-color: #f4f4f4; padding: 15px; }
        .vehicle-option { cursor: pointer; margin: 5px; padding: 10px; border: 2px solid #ddd; border-radius: 8px; transition: 0.3s; }
        .vehicle-option:hover, .vehicle-option.active { background-color: #007bff; color: white; border-color: #0056b3; }
    </style>
</head>
<body>

    <!-- Header -->
    <header class="bg-dark text-white text-center py-3">
        <h1>Welcome to Mega City Cab</h1>
    </header>

    <!-- Category Selection Bar -->
    <div class="container">
        <div class="vehicle-bar">
            <form action="<%= request.getContextPath() %>/user/CabServlet" method="GET">
                <input type="hidden" name="category" id="selectedCategory">
                <button type="submit" class="btn vehicle-option ${selectedCategory eq 'Expo' ? 'active' : ''}" onclick="setCategory('Expo')">Expo</button>
                <button type="submit" class="btn vehicle-option ${selectedCategory eq 'Budget' ? 'active' : ''}" onclick="setCategory('Budget')">Budget</button>
                <button type="submit" class="btn vehicle-option ${selectedCategory eq 'City' ? 'active' : ''}" onclick="setCategory('City')">City</button>
                <button type="submit" class="btn vehicle-option ${selectedCategory eq 'Semi' ? 'active' : ''}" onclick="setCategory('Semi')">Semi</button>
                <button type="submit" class="btn vehicle-option ${selectedCategory eq 'Car' ? 'active' : ''}" onclick="setCategory('Car')">Car</button>
                <button type="submit" class="btn vehicle-option ${selectedCategory eq '9 Seater' ? 'active' : ''}" onclick="setCategory('9 Seater')">9 Seater</button>
                <button type="submit" class="btn vehicle-option ${selectedCategory eq '14 Seater' ? 'active' : ''}" onclick="setCategory('14 Seater')">14 Seater</button>
            </form>
        </div>
    </div>
    
    <%@ page import="java.util.List" %>
<%@ page import="com.MegaCityCab.user.model.CabDetails" %>

<%
    List<CabDetails> cabs = (List<CabDetails>) session.getAttribute("cabs");
    if (cabs == null) {
        request.setAttribute("error", "No cabs found.");
    }
%> 

    <!-- Cabs Display Section -->
   <div class="container mt-4">
    <div class="row">
        <c:forEach var="cab" items="${cabs}">
            <div class="col-md-4">
                <div class="card cab-card">
                    <img src="${cab.image}" class="card-img-top" alt="${cab.model}">
                    <div class="card-body">
                        <h5 class="card-title">${cab.model}</h5>
                        <p class="card-text">${cab.category}</p>
                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#bookingModal">Book Now</button>

                        <!-- "More" Button Submits Form to Servlet -->
                        <form action="<%= request.getContextPath() %>/user/CabDetailsServlet" method="POST">
                            <input type="hidden" name="cabId" value="${cab.id}">
                            <button type="submit" class="btn btn-secondary">More</button>
                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>

        <c:if test="${empty cabs}">
            <div class="col-12 text-center">
                <h4>No cabs available for ${selectedCategory}</h4>
            </div>
        </c:if>
    </div>
</div>

<!-- More Details Modal (Shows Only If Data Exists) -->
<c:if test="${not empty sessionScope.cabCategory}">
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var modal = new bootstrap.Modal(document.getElementById('moreDetailsModal'));
            modal.show();
        });
    </script>
</c:if>

<div class="modal fade" id="moreDetailsModal" tabindex="-1" aria-labelledby="moreDetailsLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="moreDetailsLabel">Cab Details</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p><strong>Category:</strong> ${sessionScope.cabCategory}</p>
                <p><strong>Description:</strong> ${sessionScope.cabDescription}</p>
                <p><strong>Model:</strong> ${sessionScope.cabModel}</p>
                <p><strong>Rate:</strong> ${sessionScope.cabRate} LKR/km</p>
                <p><strong>Basic Fare:</strong> ${sessionScope.cabFare} LKR</p>
                <p><strong>Driver:</strong> ${sessionScope.driverName}</p>
                <p><strong>Contact:</strong> ${sessionScope.driverContact}</p>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>


<!-- Bootstrap JS -->
<!-- Debugging session values -->
<p>DEBUG: Cab Model - ${sessionScope.cabModel}</p>
<p>DEBUG: Category - ${sessionScope.cabCategory}</p>
<p>DEBUG: Description - ${sessionScope.cabDescription}</p>
<p>DEBUG: Rate - ${sessionScope.cabRate}</p>
<p>DEBUG: Fare - ${sessionScope.cabFare}</p>
<p>DEBUG: Driver - ${sessionScope.driverName}</p>
<p>DEBUG: Contact - ${sessionScope.driverContact}</p>



<!-- Bootstrap JS -->


	    
    
    

    <!-- Booking Modal -->
   <!-- Booking Modal -->
	<!-- Booking Modal -->
	<div class="modal fade" id="bookingModal" tabindex="-1" aria-labelledby="bookingModalLabel" aria-hidden="true">
	    <div class="modal-dialog modal-lg">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="bookingModalLabel">Book a Cab</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body">
	                <form action="<%= request.getContextPath() %>/user/BookingServlet" method="POST">
	                    <!-- Pickup and Drop Location Fields -->
	                    <div class="row">
	                        <div class="col-md-6">
	                            <label for="pickupLocation">Pickup Location:</label>
	                            <input type="text" class="form-control" id="pickupLocation" name="pickupLocation" readonly value="${sessionScope.pickupLocation}">
	                        </div>
	                        <div class="col-md-6">
	                            <label for="dropLocation">Drop Location:</label>
	                            <input type="text" class="form-control" id="dropLocation" name="dropLocation" readonly value="${sessionScope.dropLocation}">
	                        </div>
	                    </div>
	
	                    <!-- Date and Time Picker -->
	                    <div class="row mt-4">
	                        <div class="col-md-12 d-flex justify-content-center">
	                            <div class="text-center">
	                                <label for="bookingTime">Select Date and Time</label>
	                                <input type="datetime-local" class="form-control" id="bookingTime" name="bookingTime" required>
	                            </div>
	                        </div>
	                    </div>
	
	                    <hr>
	
	                    <!-- User Details Fields -->
	                    <div class="row">
	                        <div class="col-md-4">
	                            <label for="name">Name</label>
	                            <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name" required>
	                        </div>
	                        <div class="col-md-4">
	                            <label for="phone">Phone Number</label>
	                            <input type="text" class="form-control" id="phone" name="phone" placeholder="Enter your phone number" required>
	                        </div>
	                        <div class="col-md-4">
	                            <label for="email">Email (Optional)</label>
	                            <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email">
	                        </div>
	                    </div>
	
	                    <!-- Hidden Cab Data -->
	                    <input type="text" id="cabModel" name="cabModel" value="${cab.model}" >
	                    <input type="hidden" id="cabCategory" name="cabCategory" value="${sessionScope.cabCategory}">
	                    <input type="text" id="distance" name="distance" value="${sessionScope.distance}">
	                    
	                    <div class="modal-footer">
	                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	                        <button type="submit" class="btn btn-primary">Next</button>
	                    </div>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>
	
	<script>
	
	    // Function to handle form submission
	    function submitBooking() {
	        // You can add AJAX or form submission logic here
	        alert("Booking details submitted!");
	    }
	
	    function setCategory(category) {
	        document.getElementById("selectedCategory").value = category;
	    }
	</script>
	
	<script>
    document.addEventListener("DOMContentLoaded", function() {
        // Get modal element
        var modalElement = document.getElementById('moreDetailsModal');
        var modal = new bootstrap.Modal(modalElement);
        
        // Check if session data exists to show the modal
        if ('${sessionScope.cabCategory}' != '') {
            modal.show(); // Show the modal
        }
    });
</script>




    <!-- Bootstrap JS (required for modals) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>

</body>
</html>
