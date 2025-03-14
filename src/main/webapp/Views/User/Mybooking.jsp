<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Bookings</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="../CSS/User.css" rel="stylesheet">
    

    <style>
        .full-bg {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('https://images.pexels.com/photos/1955134/pexels-photo-1955134.jpeg');
            background-size: cover;
            background-position: center center;
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
        

        .container {
            margin-top: 100px;
        }

        .table-container {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 8px;
        }

        .table thead {
            background-color: #343a40;
            color: white;
        }

        .table th,
        .table td {
            text-align: center;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: rgba(0, 0, 0, 0.2);
        }

        .btn {
            background-color: #28a745;
            color: white;
            border-radius: 5px;
            font-size: 1.1rem;
            padding: 10px;
        }

        .btn:hover {
            background-color: #218838;
        }

        /* Responsive table */
        @media (max-width: 768px) {
            .table-responsive {
                overflow-x: auto;
            }
        }
    </style>
</head>

<body>

    <div class="full-bg"></div>
    
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

    <div class="container">
        <div class="table-container">
            <h2 class="text-center text-white mb-4">My Booking Details</h2>
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Customer Name</th>
                            <th>Phone Number</th>
                            <th>Email</th>
                            <th>Pickup</th>
                            <th>Drop</th>
                            <th>Date</th>
                            <th>Time</th>
                            <th>Amount</th>
                            <th>Status</th> <!-- Added status column -->
                        </tr>
                    </thead>
                    <tbody>
                        <!-- This data will be populated dynamically from the database -->
                        <c:forEach var="booking" items="${bookings}">
                            <tr>
                                <td>${booking.customerName}</td>
                                <td>${booking.phoneNumber}</td>
                                <td>${booking.email}</td>
                                <td>${booking.pickup}</td>
                                <td>${booking.drop}</td>
                                <td>${booking.date}</td>
                                <td>${booking.time}</td>
                                <td>${booking.amount}</td>
                                <td>${booking.status}</td> <!-- Display the status -->
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="text-center">
                <a href="U_Homepage.jsp" class="btn">Back to Home</a>
            </div>
        </div>
    </div>

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
	</script>
	

</body>

</html>
