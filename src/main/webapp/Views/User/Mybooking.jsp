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
        body {
            background-color: #f4f7fa;
        }

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

        .container {
            margin-top: 80px;
        }

        .table-container {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .table thead {
            background-color: #007bff;
            color: white;
            font-size: 1.1rem;
            font-weight: bold;
        }

        .table th, .table td {
            text-align: center;
            padding: 12px 15px;
            font-size: 1rem;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: rgba(0, 0, 0, 0.2);
        }

        .table-hover tbody tr:hover {
            background-color: #f1f1f1;
            cursor: pointer;
        }

        .btn {
            background-color: #28a745;
            color: white;
            border-radius: 5px;
            font-size: 1.1rem;
            padding: 10px 15px;
        }

        .btn:hover {
            background-color: #218838;
        }

        .nav-link.active {
            background-color: #ddd;
            color: #ebb521;
            font-weight: bold;
            border-radius: 5px;
            padding: 5px 10px;
        }

        .nav-link {
            text-decoration: none;
            color: #333;
            padding: 10px 15px;
            font-size: 1rem;
        }

        .btn-back {
            background-color: #007bff;
            border-color: #0056b3;
        }

        .btn-back:hover {
            background-color: #0056b3;
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

    <input type="hidden" id="id" value="${sessionScope.userId}">

    <div class="container">
        <div class="table-container">
            <h2 class="text-center text-white mb-4">My Booking Details</h2>
            <div class="table-responsive">
                <table class="table table-striped table-hover">
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
                                <td>${booking.pickupLocation}</td>
                                <td>${booking.dropLocation}</td>
                                <td>${booking.bookingDate}</td>
                                <td>${booking.bookingTime}</td>
                                <td>${booking.amount}</td>
                                <td>${booking.status}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="text-center">
                <a href="<%= request.getContextPath() %>/Views/User/U_Homepage.jsp" class="btn btn-back">Back to Home</a>
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

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const navLinks = document.querySelectorAll('.nav-link');
            navLinks.forEach(link => {
                link.classList.remove('active');
                if (window.location.pathname.includes(link.getAttribute('href'))) {
                    link.classList.add('active');
                }
            });

            navLinks.forEach(link => {
                link.addEventListener('click', function () {
                    navLinks.forEach(link => link.classList.remove('active'));
                    this.classList.add('active');
                });
            });
        });
    </script>

</body>

</html>
