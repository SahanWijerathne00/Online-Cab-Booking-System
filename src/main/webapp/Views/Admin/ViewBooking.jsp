<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Bookings</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Views/CSS/Admin1.css">
    
    <style>
    /* General Table Styling */
		.table {
		    width: 100%;
		    margin: 20px 0;
		    border-collapse: collapse;
		}
		
		.table th, .table td {
		    padding: 15px;
		    text-align: left;
		    border-bottom: 1px solid #ddd;
		}
		
		.table th {
		    background-color: #343a40;
		    color: #fff;
		}
		
		.table td {
		    background-color: #f9f9f9;
		}
		
		.table-responsive {
		    overflow-x: auto;
		    -webkit-overflow-scrolling: touch;
		}
		
		/* Action Buttons Styling */
		.btn {
		    padding: 8px 15px;
		    font-size: 14px;
		    border: none;
		    cursor: pointer;
		}
		
		.btn-success {
		    background-color: #28a745;
		    color: white;
		}
		
		.btn-danger {
		    background-color: #dc3545;
		    color: white;
		}
		
		.btn:hover {
		    opacity: 0.8;
		}
		
		/* Mobile Responsiveness */
		@media (max-width: 768px) {
		    .table th, .table td {
		        padding: 8px;
		    }
		
		    .table th {
		        font-size: 12px;
		    }
		
		    .table td {
		        font-size: 10px;
		    }
		
		    .btn {
		        font-size: 12px;
		        padding: 6px 12px;
		    }
		}
		
		/* Add alternating row colors */
		.table tr:nth-child(even) {
		    background-color: #f2f2f2;
		}
		
		.table tr:hover {
		    background-color: #f1f1f1;
		}
		
		/* Set column widths */
#cabTable th:nth-child(1), #cabTable td:nth-child(1) {
    width: 80px;
}

#cabTable th:nth-child(2), #cabTable td:nth-child(2) {
    width: 80px;
}

#cabTable th:nth-child(3), #cabTable td:nth-child(3) {
    width: 280px;
}

#cabTable th:nth-child(4), #cabTable td:nth-child(4) {
    width: 180px;
}

#cabTable th:nth-child(5), #cabTable td:nth-child(5) {
    width: 180px;
}

#cabTable th:nth-child(6), #cabTable td:nth-child(6) {
    width: 260px;
}

#cabTable th:nth-child(7), #cabTable td:nth-child(7) {
    width: 340px;
}

#cabTable th:nth-child(8), #cabTable td:nth-child(8) {
    width: 540px;
}

#cabTable th:nth-child(9), #cabTable td:nth-child(9) {
    width: 120px;
}

#cabTable th:nth-child(10), #cabTable td:nth-child(10) {
    width: 180px;
}
  
		    
    </style>
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
                <h4>Booking List</h4>
            </div>

            <!-- Booking List Table -->
            <div class="card mt-3">
		    <div class="card-body">
		        <div class="table-responsive">
		            <table class="table table-bordered" id="cabTable">
		                <thead class="table-dark">
		                    <tr>
		                        <th>Booking ID</th>
		                        <th>Customer Name</th>
		                        <th>Booking Time</th>
		                        <th>Pickup Location</th>
		                        <th>Drop Location</th>
		                        <th>Customer Details</th>
		                        <th>Cab Details</th>
		                        <th>Driver Details</th>
		                        <th>Amount (Rs.)</th>
		                        <th>Status</th>
		                        <th>Action</th>
		                    </tr>
		                </thead>
		                <tbody>
		                    <c:forEach var="booking" items="${bookings}">
		                        <tr>
		                            <td>${booking.id}</td>
		                            <td>${booking.customerName}</td>
		                            <td>${booking.bookingTime}</td>
		                            <td>${booking.pickupLocation}</td>
		                            <td>${booking.dropLocation}</td>
		                            <td>
		                                <strong>Email:</strong> ${booking.customerEmail}<br>
		                                <strong>Phone:</strong> ${booking.customerPhoneNumber}<br>
		                            </td>
		                            <td>
		                                <strong>Category:</strong> ${booking.cabCategory}<br>
		                                <strong>Model:</strong> ${booking.cabModel}<br>
		                                <strong>Plate:</strong> ${booking.cabPlateNumber}<br>
		                            </td>
		                            <td>
		                                <strong>Name:</strong> ${booking.driverName}<br>
		                                <strong>Phone:</strong> ${booking.driverContact}<br>
		                                <strong>Address:</strong> ${booking.driverAddress}<br>
		                            </td>
		                            <td>${booking.amount }
		                            	<strong>Payment Method:</strong> ${booking.method}<br>
		                            </td>
		                            
		                            <td>
		                                <c:choose>
		                                    <c:when test="${booking.status == 'Pending'}">
		                                        <button class="btn btn-warning">${booking.status}</button>
		                                    </c:when>
		                                    <c:when test="${booking.status == 'Confirmed'}">
		                                        <button class="btn btn-success">${booking.status}</button>
		                                    </c:when>
		                                    <c:when test="${booking.status == 'Cancelled'}">
		                                        <button class="btn btn-danger">${booking.status}</button>
		                                    </c:when>
		                                    <c:otherwise>
		                                        <button class="btn btn-secondary">${booking.status}</button>
		                                    </c:otherwise>
		                                </c:choose>
		                            </td>
		                            <td>
		                                <form action="<%= request.getContextPath() %>/Admin/UpdateBookingStatusServlet" method="POST">
		                                    <input type="hidden" name="bookingId" value="${booking.id}">
		                                    <button type="button" class="btn btn-success" onclick="openModal(${booking.id}, 'Confirmed')">Confirm</button>
		                                    <button type="button" class="btn btn-danger" onclick="openModal(${booking.id}, 'Cancelled')">Cancel</button>
		                                </form>
		                            </td>
		                        </tr>
		                    </c:forEach>
		                </tbody>
		            </table>
		        </div>
		    </div>
		</div>

        </div>
    </div>
    
    <div class="modal fade" id="confirmationModal" tabindex="-1" aria-labelledby="confirmationModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="confirmationModalLabel">Confirm Status Change</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body">
	                Are you sure you want to change the status of this booking?
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	                <form id="statusChangeForm" method="POST" action="<%= request.getContextPath() %>/Admin/UpdateBookingStatusServlet">
	                    <input type="hidden" id="bookingId" name="bookingId">
	                    <input type="hidden" id="newStatus" name="newStatus">
	                    <button type="submit" class="btn btn-primary">Confirm</button>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>

<script>
    var bookingIdToUpdate = null;
    var newStatusToSet = null;

    // Function to open the confirmation modal and set the necessary details
    function openModal(bookingId, newStatus) {
        bookingIdToUpdate = bookingId;
        newStatusToSet = newStatus;
        document.getElementById('bookingId').value = bookingIdToUpdate;
        document.getElementById('newStatus').value = newStatusToSet;
        $('#confirmationModal').modal('show');
    }
</script>
    
    
    <script>
        function toggleSidebar() {
            const sidebar = document.getElementById('sidebar');
            const mainContent = document.getElementById('main-content');

            // Toggle sidebar state
            sidebar.classList.toggle('collapsed');
            mainContent.classList.toggle('expanded');
        }
    </script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Include Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>
