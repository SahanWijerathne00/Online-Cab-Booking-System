<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thank You for Booking</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f7f8fc;
        }
        .thank-you-page {
            background-color: #f8f9fa;
            padding: 50px 15px;
        }
        .thank-you-message {
            text-align: center;
            font-size: 2.5rem;
            font-weight: bold;
            color: #28a745;
            margin-bottom: 30px;
        }
        .feedback-form {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0px 6px 20px rgba(0, 0, 0, 0.1);
            border: 2px solid #e3e3e3;
        }
        .feedback-form h3 {
            font-size: 1.8rem;
            color: #343a40;
            text-align: center;
            margin-bottom: 25px;
        }
        .rating-stars input[type="radio"]:checked ~ label {
            color: #f39c12;
        }
        .rating-stars label {
            cursor: pointer;
            font-size: 1.5rem;
        }
        .rating-stars input[type="radio"] {
            display: none;
        }
        .rating-stars {
            text-align: center;
            margin-bottom: 20px;
        }
        .btn-submit {
            background-color: #6664b0;
            color: #ffffff;
            font-size: 1.1rem;
            padding: 10px 30px;
            border-radius: 25px;
            border: none;
            transition: background-color 0.3s ease;
        }
        .btn-submit:hover {
            background-color: #0056b3;
        }
        .thank-you-btn {
            background-color: #f0a91a;
            color: #fff;
            border-radius: 25px;
            padding: 10px 20px;
            border: none;
            transition: background-color 0.3s ease;
        }
        .thank-you-btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<div class="container thank-you-page">
    <div class="row">
        <!-- Thank You Message -->
        <div class="col-12">
            <div class="thank-you-message">
                🎉 Thank you for booking with MegaCity Cab! 🎉<br>
                We are excited to have you on board.
            </div>
        </div>

        <!-- Feedback Form -->
        <div class="col-12 col-md-8 offset-md-2 feedback-form">
            <h3>We'd Love to Hear Your Feedback</h3>
            <form action="<%= request.getContextPath() %>/user/FeedbackServlet" method="POST">
                <div class="mb-3">
                    <label for="rating" class="form-label">Rate your experience</label>
                    <div class="rating-stars">
                        <input type="radio" id="star5" name="rating" value="5">
                        <label for="star5">&#9733;</label>
                        <input type="radio" id="star4" name="rating" value="4">
                        <label for="star4">&#9733;</label>
                        <input type="radio" id="star3" name="rating" value="3">
                        <label for="star3">&#9733;</label>
                        <input type="radio" id="star2" name="rating" value="2">
                        <label for="star2">&#9733;</label>
                        <input type="radio" id="star1" name="rating" value="1">
                        <label for="star1">&#9733;</label>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="message" class="form-label">Your Message</label>
                    <textarea class="form-control" id="message" name="message" rows="4" placeholder="Share your experience..."></textarea>
                </div>

                <div class="d-grid">
                    <button type="submit" class="btn-submit">Submit Feedback</button>
                </div>
            </form>
        </div>

        <!-- Thank You Button -->
        <div class="col-12 text-center mt-5">
            <a href="index.jsp" class="thank-you-btn">Back to Home</a>
        </div>
    </div>
</div>

<!-- Bootstrap 5 JS and Popper -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

</body>
</html>
