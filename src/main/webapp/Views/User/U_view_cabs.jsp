<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.MegaCityCab.user.model.CabDetails" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Vehicles</title>
    <link href="../CSS/User.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        
    <style>
       .vehicle-bar {
		    display: flex;
		    justify-content: center;
		    flex-wrap: wrap;
		    padding: 15px;
		    gap: 10px;
		}
		
		.vehicle-option {
		    cursor: pointer;
		    width: 100px;
		    padding: 10px 20px;
		    border: 2px solid #ddd;
		    border-radius: 8px;
		    transition: 0.3s;
		    font-size: 1rem;
		    text-align: center;
		    display: inline-flex; 
		    flex-direction: column;
		    align-items: center; 
		    box-sizing: border-box;
		}
		 
	
		.category-icon {
		    width: 60px;  
		    height: 50px; 
		    margin-bottom: 5px;
		}
		
		.vehicle-option:hover,
		.vehicle-option.active {
		    background-color: #007bff;
		    color: white;
		    border-color: #0056b3;
		}
		
		/* For the 9 Seater and 14 Seater buttons */
		.vehicle-option .category-icon {
		    width: 35px;  
		    height: 35px; 
		}

	    /* Container for cab cards */
		.cab-card {
		    margin-bottom: 20px;
		    border: 2px solid #007bff; /* Solid border */
		    border-radius: 15px; /* Rounded corners */
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Slight shadow for depth */
		    overflow: hidden; /* To make sure the border-radius applies to images as well */
		    display: flex;
		    flex-direction: column;
		    justify-content: space-between;
		    height: 100%;
		}
		
		.cab-card img {
		    width: 100%;
		    height: 200px; /* Fixed image height */
		    object-fit: cover; /* Ensure the image covers the area without distortion */
		}
		
		.cab-card .card-body {
		    padding: 15px;
		    text-align: center;
		}
		
		.cab-title {
		    font-size: 1.2rem;
		    font-weight: bold;
		    color: #333;
		}
		
		.cab-category {
		    font-size: 1rem;
		    color: #666;
		    margin-bottom: 15px;
		}
		
		.btn-book-now {
		    background-color: #007bff;
		    color: white;
		    border: none;
		    border-radius: 8px;
		    padding: 10px 20px;
		    cursor: pointer;
		    transition: background-color 0.3s ease;
		}
		
		.btn-book-now:hover {
		    background-color: #0056b3;
		}
		
		.btn-more {
		    background-color: #6c757d;
		    color: white;
		    border: none;
		    border-radius: 8px;
		    padding: 10px 20px;
		    cursor: pointer;
		    transition: background-color 0.3s ease;
		}
		
		.btn-more:hover {
		    background-color: #5a6268;
		}
		
		/* Display three items per row */
		.row {
		    display: flex;
		    justify-content: space-between;
		    flex-wrap: wrap;
		    gap: 15px; /* Space between items */
		}
		
		/* Ensure the cards are not too wide */
		.col-md-4 {
		    flex: 0 1 32%; /* 3 items per row */
		    box-sizing: border-box;
		    margin-bottom: 30px;
		}
		
		/* Ensure all buttons align properly */
		button {
		    width: 100%;
		}
		
		
		/* Booking Modal */
		.modal-header {
	        background-color: #007bff;
	        color: white;
	        border-bottom: 2px solid #0056b3;
	        font-weight: bold;
	    }
	
	    .modal-title {
	        font-size: 1.5rem;
	    }
	
	    .modal-body {
	        font-family: Arial, sans-serif;
	    }
	
	    .cab-details {
	        margin-bottom: 20px;
	        background-color: #f8f9fa;
	        border-radius: 8px;
	        padding: 20px;
	        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	    }
	
	    .cab-category {
	        font-weight: bold;
	        font-size: 1.2rem;
	    }
	
	    .form-control {
	        border-radius: 10px;
	        box-shadow: none;
	        border-color: #ccc;
	        margin-bottom: 10px;
	    }
	
	    .form-control:focus {
	        border-color: #007bff;
	        box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
	    }
	
	    .row .col-md-6 {
	        margin-bottom: 20px;
	    }
	
	    .modal-footer {
	        border-top: 1px solid #ddd;
	        padding-top: 10px;
	    }
	
	    .btn-primary, .btn-secondary {
	        border-radius: 8px;
	        padding: 10px 20px;
	        font-size: 1rem;
	    }
	
	    .btn-primary {
	        background-color: #007bff;
	        border: none;
	    }
	
	    .btn-secondary {
	        background-color: #6c757d;
	        border: none;
	    }
	
	    .btn-primary:hover {
	        background-color: #0056b3;
	    }
	
	    .btn-secondary:hover {
	        background-color: #5a6268;
	    }
	    
	    .location-row {
            display: flex;
            justify-content: space-between;
        }

        .location-row .col-md-6 {
            flex: 0 1 48%; /* Adjust width of each field to ensure they stay side-by-side */
        }

        /* Center the Date and Time Picker */
        .center-time {
            display: flex;
            justify-content: center;
            align-items:center;
            width:45%;
            margin-left:200px;
        }
	
	    /* Responsive Layout */
	    @media (max-width: 767px) {
	        .row .col-md-4, .row .col-md-6 {
	            margin-bottom: 15px;
	        }
	    }
	
	    </style>
</head>
<body>
	
	
	<%
	    String category = request.getParameter("category");
	    if (category == null) {
	        category = "Expo";  
	    }
	    List<CabDetails> cabs = (List<CabDetails>) session.getAttribute("cabs");
	    if (cabs == null || cabs.isEmpty()) {
	        request.setAttribute("error", "No cabs found.");
	    }
	%>
    <!-- Category Selection Bar -->
  	<div class="vehicle-bar">
	    <form action="<%= request.getContextPath() %>/user/CabServlet" method="GET">
	        <input type="hidden" name="category" id="selectedCategory">
	        
	        <!-- Category Buttons with Custom Images -->
	        <button type="submit" class="btn vehicle-option ${selectedCategory eq 'Expo' ? 'active' : ''}" onclick="setCategory('Expo')">
	            <img src="../Images/expo.png" alt="Expo" class="category-icon"> Expo
	        </button>
	        <button type="submit" class="btn vehicle-option ${selectedCategory eq 'Budget' ? 'active' : ''}" onclick="setCategory('Budget')">
	            <img src="../Images/budget.png" alt="Budget" class="category-icon"> Budget
	        </button>
	        <button type="submit" class="btn vehicle-option ${selectedCategory eq 'Semi' ? 'active' : ''}" onclick="setCategory('Semi')">
	            <img src="../Images/semi.png" alt="Semi" class="category-icon"> Semi
	        </button>
	        <button type="submit" class="btn vehicle-option ${selectedCategory eq 'Car' ? 'active' : ''}" onclick="setCategory('Car')">
	            <img src="../Images/car.png" alt="Car" class="category-icon"> Car
	        </button>
	        <button type="submit" class="btn vehicle-option ${selectedCategory eq '9 Seater' ? 'active' : ''}" onclick="setCategory('9 Seater')">
	            <img src="../Images/9 seater.png" alt="9 Seater" class="category-icon"> 9 Seater
	        </button>
	        <button type="submit" class="btn vehicle-option ${selectedCategory eq '14 Seater' ? 'active' : ''}" onclick="setCategory('14 Seater')">
	            <img src="../Images/14 seater.png" alt="14 Seater" class="category-icon"> 14 Seater
	        </button>
	    </form>
	</div>



    <!-- Cabs Display Section -->
  	<div class="container mt-4">
	    <div class="row">
	        <c:forEach var="cab" items="${cabs}">
	            <div class="col-md-4">
	                <div class="card cab-card">
	                    <img src="<%= request.getContextPath() %>/${cab.image}" class="card-img-top" alt="Cab Image">
	                    <div class="card-body">
	                        <h5 class="cab-title">${cab.model}</h5>
	                        <p class="cab-category">${cab.category}</p>
	                        <!-- Hidden Booking Form -->
	                        <form id="bookingForm" action="<%= request.getContextPath() %>/user/CabServlet" method="POST">
	                            <input type="hidden" id="bookCabModel" name="cabModel">
	                            <input type="hidden" id="bookCabCategory" name="cabCategory">
	                            <input type="hidden" id="bookCabRate" name="cabRate">
	                            <input type="hidden" id="bookCabFare" name="cabFare">
	                            <input type="hidden" id="bookCabId" name="cabId">
	                            <input type="hidden" id="bookCabDistance" name="distance">
	                        </form>
	                        
	                        <form action="<%= request.getContextPath() %>/user/CabDetailsServlet" method="POST">
	                            <input type="hidden" name="cabId" value="${cab.id}">
	                        	<button type="submit" class="btn btn-book-now" data-bs-toggle="modal" data-bs-target="#">Book Now</button>
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


	<!-- Unified Booking Modal -->
	<div class="modal fade" id="bookingModal" tabindex="-1" aria-labelledby="bookingModalLabel" aria-hidden="true">
	    <div class="modal-dialog modal-lg">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="bookingModalLabel">Book a Cab</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body" style="background-color: #ebe68d;">
	                <!-- Cab Details Section -->
	                <div class="cab-details">
	                    <c:if test="${not empty sessionScope.cabCategory}">
	                        <p class="cab-category"><strong>Category:</strong> ${sessionScope.cabCategory}</p>
	                        <p><strong>About cab:</strong> ${sessionScope.cabDescription}</p>
	                        <p><strong>Model:</strong> ${sessionScope.cabModel}</p>
	                        <p><strong>Category Rate:</strong> ${sessionScope.cabRate} LKR/km</p>
	                        <p><strong>Basic Fare:</strong> ${sessionScope.cabFare} LKR</p>
	                    </c:if>
	
	                    <c:if test="${empty sessionScope.cabCategory}">
	                        <p>No cab details found for the provided ID.</p>
	                    </c:if>
	                </div>
	                <hr>
	
	                <!-- Booking Form Section -->
	                <form action="<%= request.getContextPath() %>/user/BookingServlet" method="POST">
	                    <!-- Pickup and Drop Location Fields -->
	                   <div class="location-row">
                            <div class="col-md-6">
                                <label for="pickupLocation">Pickup Location</label>
                                <input type="text" class="form-control" id="pickupLocation" name="pickupLocation" readonly value="${sessionScope.pickupLocation}">
                            </div>
                            <div class="col-md-6">
                                <label for="dropLocation">Drop Location</label>
                                <input type="text" class="form-control" id="dropLocation" name="dropLocation" readonly value="${sessionScope.dropLocation}">
                            </div>
                        </div>

                        <!-- Date and Time Picker (Centered) -->
                        <div class="center-time mt-4">
                            <div class="col-md-12">
                                <label for="bookingTime">Select Date and Time</label>
                                <input type="datetime-local" class="form-control" id="bookingTime" name="bookingTime" required>
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
	                            <label for="email">Email</label>
	                            <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
	                        </div>
	                    </div>
	
	                    <!-- Hidden Cab Data -->
	                    <input type="hidden" id="cabModel" name="cabModel" value="${sessionScope.cabModel}">
	                    <input type="hidden" id="cabCategory" name="cabCategory" value="${sessionScope.cabCategory}">
	                    <input type="hidden" id="distance" name="distance" value="${sessionScope.distance}">
	                    <input type="text" id="regid" name="regid" value="${sessionScope.registerId}">
	                    <input type="hidden" id="fare" name="fare" value="${sessionScope.cabFare}">
	                    <input type="hidden" id="rate" name="rate" value="${sessionScope.cabRate}">
	                    <input type="hidden" id="drivername" name="dname" value="${sessionScope.driverName}">
	                    <input type="hidden" id="driverContact" name="driverContact" value="${sessionScope.driverContact}">
	                    <input type="hidden" id="driverAddress" name="driverAddress" value="${sessionScope.driverAddress}">
	                    <input type="hidden" id="plate" name="plate" value="${sessionScope.plateNumber}"> 
	
	                    <div class="modal-footer">
	                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	                        <button type="submit" class="btn btn-primary">Next</button>
	                    </div>   
	                </form>
	            </div>
	        </div>
	    </div>
	</div>

	
	<c:if test="${not empty sessionScope.cabCategory}">
	    <script>
	        document.addEventListener("DOMContentLoaded", function() {
	            var modal = new bootstrap.Modal(document.getElementById('bookingModal'));
	            modal.show();
	        });
	    </script>
	</c:if>
	

	
	
	<script>
	    function submitBooking() {
	        // You can add AJAX or form submission logic here
	        alert("Booking details submitted!");
	    }
	
	    function setCategory(category) {
	        document.getElementById("selectedCategory").value = category;
	    }
	</script>
	
	<!-- Bootstrap JS (required for modals) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>

</body>
</html>
