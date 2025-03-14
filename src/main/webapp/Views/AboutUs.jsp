<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Mega City Cab Service</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Roboto', sans-serif;
            line-height: 1.6;
            color: #333;
            height: 100vh;
        }
        .header {   
            background:#aba6a6;
            color: #fff;
            padding: 0px 20px; /* Reduced padding */
            text-align: center;
            font-size: 2.5rem; /* Slightly smaller font */
            position: relative;
            z-index: 2;
        }
        .header h1 {
            font-size: 3rem;
        }
        .header p {
            font-size: 1.2rem;
            margin-top: 10px;
        }
        .container {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
            margin: 40px 0;
            height: calc(100vh - 160px); /* Adjust for header height */
            padding: 0 20px;
            flex-wrap: wrap;
        }
        .text-content {
            flex: 1;
            max-width: 600px;
            background-color: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            text-align: left;
            margin-right: 20px;
        }
        .text-content h2 {
            font-size: 2.5rem;
            color: #333;
            margin-bottom: 20px;
        }
        .text-content p {
            font-size: 1.1rem;
            color: #555;
            margin-bottom: 20px;
            line-height: 1.8;
        }
        .text-content ul {
            list-style-type: none;
            padding-left: 0;
        }
        .text-content ul li {
            font-size: 1rem;
            color: #555;
            margin: 10px 0;
            display: flex;
            align-items: center;
        }
        .text-content ul li::before {
            content: "✔️";
            margin-right: 10px;
            color: #28a745;
        }
        .images-container {
        margin-top:-200px;
            display: flex;
            flex: 1;
            justify-content: space-between;
            gap: 10px;
            flex-wrap: wrap;
        }
        .images-container img {
            width: 32%;
            height: 450px;
            object-fit: cover;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        footer {
            background: #333;
            color: #fff;
            padding: 20px;
            margin-top:300px;
            text-align: center;
        }
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                align-items: center;
                height: auto;
            }
            .images-container {
                flex-direction: column;
                align-items: center;
                gap: 15px;
            }
            .images-container img {
                width: 80%;
            }
        }
    </style>
</head>
<body>

    <div class="header">
        <h1>About Us</h1>
        <p>Your trusted partner for reliable and safe transportation in the city</p>
    </div>

    <div class="container">
        <div class="text-content">
            <h2>A New Way For Working For Many Of Professionals.</h2>
            <p>At Mega City Cab, we are dedicated to providing efficient and reliable transportation services across the city. With over a decade of experience, we’ve built a reputation for punctuality, safety, and comfort.</p>
            <p>Whether you're heading to the airport, traveling for business, or just need a quick ride, we are here to ensure you reach your destination safely and on time. Our fleet of well-maintained vehicles and professional drivers are committed to making your ride as pleasant as possible.</p>
            <h3>Our Key Features:</h3>
            <ul>
                <li>24/7 Availability</li>
                <li>Fast and Safe Rides</li>
                <li>Easy Online Booking</li>
                <li>Professional and Friendly Drivers</li>
                <li>Affordable Rates</li>
            </ul>
        </div>
        <div class="images-container">
            <img src="../Images/about_image1.jpeg" alt="Modern Cab Interior">
                <img src="../Images/about_image2.jpg" alt="Happy Drivers">
                <img src="../Images/about_image3.jpg" alt="Our Fleet of Cars">
        </div>
    </div>

    <footer>
        <p>&copy; 2025 Mega City Cab Service. All rights reserved.</p>
    </footer>

</body>
</html>
