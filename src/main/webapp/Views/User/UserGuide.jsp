<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MegaCity Cab - User Guide</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500&display=swap" rel="stylesheet" />
    <link href = "../CSS/User.css" rel="stylesheet">
    
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f4f7fb;
            color: #333;
        }
        .container {
  			font-family: Arial, Helvetica, sans-serif;
            max-width: 1200px;
            margin: 100px auto;
            padding: 30px;
        }
        h1, h2 {
            color: #333;
            margin-bottom: 15px;
            text-transform: uppercase;
            font-weight:bold;
            
        }
        p {
            font-size: 1rem;
            line-height: 1.6;
            color: #555;
            margin-bottom: 15px;
        }
        .step {
            background-color: #d1d1d1;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .step-main h1{
        	color:#ab617b;
        	justify-content: center;
            align-items: center;
        }
        .step h2 {
            font-size: 1.3rem;
            color: #0a0a0a;
            margin-bottom: 10px;
        }
        .step p {
            font-size: 1rem;
            color: #555;
        }
        .faq-section {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            margin-top: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .faq-section h2 {
            color: #a81347;
            margin-bottom: 20px;
            font-size: 1.5rem;
        }
        .faq-section ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        .faq-section ul li {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            transition: background-color 0.3s ease;
        }
        .faq-section ul li:hover {
            background-color: #f1f1f1;
        }
        footer {
            background-color: #000000;
            color: white;
            padding: 10px;
            font-weight:bold;
        }
        @media (max-width: 768px) {
            h2 {
                font-size: 1.2rem;
            }
            p {
                font-size: 0.9rem;
            }
            .container {
                padding: 15px;
            }
        }
    </style>
</head>
<body>

<header>
    <div class="header d-flex justify-content-between align-items-center">
        <div class="cab-name">MegaCity Cab</div>
        <div class="nav-links d-flex justify-content-center flex-grow-1">
            <a href="U_Homepage.jsp">Home</a>
            <a href="ContactUs.jsp">Contact Us</a>
            <a href="#">My Bookings</a>
            <a href="#">Profile</a>
            <a href="UserGuide.jsp">Guidelines</a>
        </div>
        
            
         <div class="user-info d-flex align-items-center">
    
		    <c:if test="${not empty sessionScope.userFirstName}">
		        <!-- Stylish user icon and greeting -->
		        <div class="d-flex align-items-center">
		            <div class="user-icon me-2">
		                <i class="bi bi-person-circle"></i> 
		            </div>
		           
		            <span class="greeting-text me-2">Hi, ${sessionScope.userFirstName}</span>
		            <c:if test="${not empty sessionScope.userUsername}">
		                <span class="username-text">@${sessionScope.userUsername}</span>
		            </c:if>
		        </div>
		    </c:if>
		</div>
    </div>
</header>

<div class="container">

    <!-- Introduction -->
    <div class="step-main">
        <h1>Welcome to Mega City Cab</h1>
        <p>MegaCity Cab is a reliable and efficient online cab reservation service that allows users to book cabs for their transportation needs. This guide will walk you through the process of booking a cab, selecting your preferred vehicle, and confirming your ride in a few easy steps.</p>
    </div>

    <!-- Step 1: Enter Pickup and Drop-off Locations -->
    <div class="step">
        <h2>Step 1: Enter Pickup and Drop-off Locations</h2>
        <p>Start by entering the pickup location and the drop-off location. This will help us calculate the best route and estimate the distance for your ride.</p>
    </div>

    <!-- Step 2: Calculate Distance -->
    <div class="step">
        <h2>Step 2: Calculate Distance</h2>
        <p>Click the <strong>Calculate Distance</strong> button. The system will calculate the distance between your pickup and drop-off locations. This will help us provide you with the estimated fare.</p>
    </div>

    <!-- Step 3: Interactive Map -->
    <div class="step">
        <h2>Step 3: Interactive Map</h2>
        <p>The interactive map will help you see the routes between your pickup and drop-off locations. It’s a helpful tool for better planning your trip.</p>
    </div>

    <!-- Step 4: Choose Your Cab -->
    <div class="step">
        <h2>Step 4: Choose Your Cab</h2>
        <p>Select the cab that fits your preferences and budget. You can choose from a variety of categories such as budget-friendly options, expo cabs, city cabs, and larger 9-seater or 14-seater cabs.</p>
    </div>

    <!-- Step 5: Fill in Your Personal Details -->
    <div class="step">
        <h2>Step 5: Fill in Your Personal Details</h2>
        <p>Enter your personal information, including your name, phone number, and optional email address. These details will be used to confirm your ride and send you booking information.</p>
    </div>

    <!-- Step 6: Select Payment Method -->
    <div class="step">
        <h2>Step 6: Select Payment Method</h2>
        <p>Choose a payment method that suits you best. You can pay using cash, a credit card, or via a digital wallet.</p>
    </div>

    <!-- Step 7: Review and Confirm Your Ride -->
    <div class="step">
        <h2>Step 7: Review and Confirm Your Ride</h2>
        <p>Review your booking details before confirming the ride. Double-check the pickup and drop-off locations, as well as the estimated distance and fare. Once you’re satisfied, click on <strong>Confirm Ride</strong> to complete your booking.</p>
    </div>

    <!-- Step 8: Booking Notifications -->
    <div class="step">
        <h2>Step 8: Booking Notifications</h2>
        <p>Once your booking is confirmed, you’ll receive a notification on your mobile or email with all the booking details, including driver information and the expected pickup time.</p>
    </div>

    <!-- Stylish FAQs Section -->
    <div class="faq-section">
        <h2>Frequently Asked Questions</h2>
        <ul>
            <li><strong>How can I cancel my booking?</strong><br>To cancel your booking, simply visit the "My Bookings" section and select the "Cancel" option next to your reservation.</li>
            <li><strong>Can I change my ride details after booking?</strong><br>Yes, you can modify the details by contacting customer support before the ride is confirmed.</li>
            <li><strong>What happens if I miss my cab?</strong><br>If you miss your cab, you can reschedule or book another one through the app.</li>
        </ul>
    </div>
    
</div>

<footer class="text-center">
        <p>&copy; 2025 Mega City Cab | All Rights Reserved</p>
</footer>

</body>
</html>
