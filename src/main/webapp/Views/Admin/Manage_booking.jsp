<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - View Bookings</title>

<!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Views/CSS/Admin.css">
   
</head>

<body>

    <%@ include file="Slidebar.jsp" %>


 <div class="main-content" id="main-content">
        <nav class="navbar navbar-light bg-light px-3">
            <button class="btn btn-dark" type="button" onclick="toggleSidebar()">
                <i class="fas fa-bars"></i>
            </button>
            <span class="navbar-text" style="font-size: 1.2rem; font-weight: 500;">Mega City Cab - Admin Panel</span>
        </nav>

        <div class="container mt-4">
        	 <div class="d-flex justify-content-between align-items-center">
    			<h4>List of Bookings</h4>
			</div>
            <!-- Search Bar -->
            <div class="mt-3 mb-3">
                <input type="text" class="form-control" placeholder="Search Bookings...">
            </div>

            <!-- Cab Table -->
            <div class="card mt-3">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="cabTable">
                            <thead class="table-dark">
                                 <tr>
			                        <th>#</th>
			                        <th>Date Booked</th>
			                        <th>Client</th>
			                        <th>Pickup Location</th>
			                        <th>Dropoff Location</th>
			                        <th>Status</th>
			                        <th>Action</th>
			                    </tr>
                            </thead>
                            <tbody>
                                <!-- Loop through the cab data -->
                                <c:forEach var="booking" items="${bookings}">
			                        <tr>
			                            <td>${booking.id}</td>
			                            <td>${booking.dateBooked}</td>
			                            <td>${booking.client}</td>
			                            <td>${booking.pickup}</td>
			                            <td>${booking.dropoff}</td>
			                            <td class="status-${booking.status.toLowerCase()}">${booking.status}</td>
			                            <td><button class="action-btn">View</button></td>
			                        </tr>
			                    </c:forEach>

                            </tbody>
                        </table>
                    </div>

                    <div class="d-flex justify-content-between mt-3">
                        <p>Showing 1 to ${cabs.size()} of ${cabs.size()} entries</p>
                        <nav>
                            <ul class="pagination">
                                <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
