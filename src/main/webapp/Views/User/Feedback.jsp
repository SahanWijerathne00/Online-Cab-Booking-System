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
            background-color: #ebe68d;
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
            background-color: #ff4805;
        }
        /* Move the Back to Home button to the top-right corner */
        .thank-you-btn-right {
            position: absolute;
            top: 20px;
            right: 20px;
            color: #fff;
            border-radius: 25px;
            padding: 10px 20px;
            border: none;
            transition: background-color 0.3s ease;
        }
        .thank-you-btn-right:hover {
            background-color: #ff4805;
        }
    </style>
</head>
<body>

<div class="container thank-you-page" style="background-color: #ebe68d;">
    <div class="row">
        <!-- Thank You Message -->
        <div class="col-12">
            <div class="thank-you-message">
                🎉 Thank you for booking with MegaCity Cab! 🎉<br>
                We are excited to have you on board.
            </div>
        </div>

        <!-- Print Bill Button Below the Thank You Message -->
        <div class="col-12 text-center mb-5">
            <a href="<%= request.getContextPath() %>/Views/User/Bill.jsp" class="btn-submit" style="text-decoration: none;"><b>View Bill</b></a>
        </div>

      <!-- Feedback Form -->
		<div class="col-12 col-md-8 offset-md-2 feedback-form">
		    <h3>We'd Love to Hear Your Feedback</h3>
		    <form action="<%= request.getContextPath() %>/user/FeedbackServlet" method="POST">
		        <div class="mb-3">
		            <label for="rating" class="form-label"><b>Rate your experience</b></label>
		            <div class="rating-stars">
		                <input type="radio" id="star5" name="rating" value="5" required>
		                <label for="star5">&#9733;</label>
		                <input type="radio" id="star4" name="rating" value="4" required>
		                <label for="star4">&#9733;</label>
		                <input type="radio" id="star3" name="rating" value="3" required>
		                <label for="star3">&#9733;</label>
		                <input type="radio" id="star2" name="rating" value="2" required>
		                <label for="star2">&#9733;</label>
		                <input type="radio" id="star1" name="rating" value="1" required>
		                <label for="star1">&#9733;</label>
		            </div>
		        </div>
		        
		        <input type="hidden" id="regid" name="regid" value="${sessionScope.regid}">
		        <input type="hidden" id="name" name="name" value="${sessionScope.name}">
		        
		        <div class="mb-3">
		            <label for="message" class="form-label"><b>Your Message</b></label>
		            <textarea class="form-control" id="message" name="message" rows="4" placeholder="Share your experience..." required></textarea>
		        </div>
		
		        <div class="d-grid">
		            <button type="submit" class="btn-submit">Submit Feedback</button>
		        </div>
		    </form>
		</div>

    </div>
</div>

<c:if test="${param.status == 'success'}">
    <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="border-radius: 12px; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">
                <div class="modal-header" style="background-color: #28a745; color: white; border-top-left-radius: 12px; border-top-right-radius: 12px;">
                    <h5 class="modal-title" id="successModalLabel">Operation Status</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="color: white;"></button>
                </div>
                <div class="modal-body" style="background-color: #f8f9fa; color: #343a40; text-align: center; padding: 20px;">
                    <i class="bi bi-check-circle" style="font-size: 50px; color: #28a745;"></i> <!-- Green Check icon -->
                    <p class="mt-3" style="font-size: 1.3rem; color: #28a745; font-weight:bold;">Feedback Submitted Successfully!<br>Thank You For Give Kindly Feedback for Us....</p>
                </div>
                <div class="modal-footer" style="border-top: 1px solid #e3e3e3; text-align: center;">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="background-color: #28a745; color: white; border-radius: 25px; padding: 10px 20px; transition: background-color 0.3s;">
                        OK
                    </button>
                </div>
            </div>
        </div>
    </div>
</c:if>


<!-- Back to Home Button -->
<a href="U_Homepage.jsp" class="thank-you-btn-right" style="text-decoration: none; background-color: #ba5c3a;"><b>Back to Home</b></a>

<!-- Bootstrap 5 JS and Popper -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>


<script>
    // Show the modal on success
    <c:if test="${param.status == 'success'}">
        var myModal = new bootstrap.Modal(document.getElementById('successModal'));
        myModal.show();
    </c:if>
</script>

</body>
</html>
