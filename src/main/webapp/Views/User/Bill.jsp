<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bill</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f7f8fc;
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        .bill-container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0px 6px 20px rgba(0, 0, 0, 0.1);
            max-width: 800px;
            margin: 0 auto;
        }
        .bill-header {
            text-align: center;
            font-size: 1.8rem;
            font-weight: bold;
            color: #28a745;
            margin-bottom: 20px;
        }
        .bill-section {
            display: flex;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }
        .bill-section .section-left,
        .bill-section .section-right {
            flex: 1;
            padding: 15px;
        }
        .section-left {
            border-right: 2px solid #f0f0f0;
        }
        .info-title {
            font-size: 1.1rem;
            font-weight: bold;
            color: #495057;
        }
        .info-content {
            margin-top: 10px;
            font-size: 1rem;
            color: #6c757d;
        }
        .total-amount {
            font-size: 1.5rem;
            font-weight: bold;
            color: #dc3545;
            background-color: #f8d7da;
            padding: 10px;
            border-radius: 8px;
            margin-top: 20px;
            text-align: center;
        }
        .btn-print {
            background-color: #6664b0;
            color: #ffffff;
            font-size: 1rem;
            padding: 8px 20px;
            border-radius: 25px;
            border: none;
            transition: background-color 0.3s ease;
        }
        .btn-print:hover {
            background-color: #0056b3;
        }
        .icon {
            margin-right: 10px;
            color: #28a745;
        }
        /* Adjusting the print button position */
        .text-center {
            margin-top: 20px;
        }
    </style>
</head>
<body onload="window.print()">

<div class="container bill-container">
    <div class="bill-header">
	    <h2 style="color:red; font-weight:bold;">MegaCity Cab</h2>
	    <!-- Keep the Thank You message -->
	    <p style="font-family: cursive;" >Thank you for booking with Us.........!</p>
	</div>


    <!-- User and Booking Details -->
    <div class="bill-section">
        <!-- Left Column: User Details -->
        <div class="section-left">
            <div class="info-title"><i class="fas fa-user icon"></i>User Information</div>
            <div class="info-content">
                <p><strong>Name:</strong> ${sessionScope.name}</p>
                <p><strong>Email:</strong> ${sessionScope.email}</p>
                <p><strong>Phone:</strong> ${sessionScope.phone}</p>
            </div>
        </div>

        <!-- Right Column: Booking Details -->
        <div class="section-right">
            <div class="info-title"><i class="fas fa-car icon"></i>Booking Information</div>
            <div class="info-content">
                <p><strong>Cab Category:</strong> ${sessionScope.cabCategory}</p>
                <p><strong>Cab Model:</strong> ${sessionScope.cabModel}</p>
                <p><strong>Pickup Location:</strong> ${sessionScope.pickupLocation}</p>
                <p><strong>Drop Location:</strong> ${sessionScope.dropLocation}</p>
                <p><strong>Booking Time:</strong> ${sessionScope.bookingTime}</p>
                <p><strong>Distance:</strong> ${sessionScope.distance} km</p>
            </div>
        </div>
    </div>

    <!-- Fare Details and Highlight Total Amount -->
    <div class="total-amount">
        <p><strong>Total Amount:</strong> LKR ${sessionScope.price}</p>
    </div>

    <!-- Print Bill Button -->
    <div class="text-center">
        <button class="btn-print" onclick="window.print()">Print Bill</button>
    </div>
</div>

<!-- Bootstrap JS and Popper -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

</body>
</html>
