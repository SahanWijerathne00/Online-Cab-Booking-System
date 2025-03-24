<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        /* Custom Styling */
        body {
            background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnMq5JIDFiNco63H2B2w1yrjchv-YiUcDCkA&s');
            background-repeat: no-repeat;
            background-size: cover; 
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        .login-card {
            background: rgba(255, 255, 255, 0.8);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        .login-card h2 {
            text-align: center;
            color: #4e4e4e;
            margin-bottom: 20px;
        }

        .login-card .form-control {
            border-radius: 20px;
            margin-bottom: 15px;
            padding: 15px;
            font-size: 14px;
        }

        .login-card .btn {
            border-radius: 20px;
            font-size: 18px;
            font-weight: bold;
            padding: 12px;
            width: 100%;
            background-color:#8582ab;
        }

        .login-card .form-check-label {
            font-size: 14px;
        }

        .login-card .footer-links {
            display: flex;
            justify-content: space-between;
            font-size: 14px;
        }

        .login-card .footer-links a {
            text-decoration: none;
            color: #2575fc;
        }

        .login-card .footer-links a:hover {
            text-decoration: underline;
        }

        /* Styling for the top image */
        .login-card .card-header {
            background-image: url('https://assets.serverwatch.com/uploads/2010/07/System-Administrator-Tasks-to-Automate.jpeg');
            background-size: cover;
            background-position: center;
            height: 180px;
            border-radius: 10px 10px 0 0;
        }
    </style>
</head>
<body>

    <!-- Login Form -->
    <div class="login-card">
        <div class="card-header"></div>
        <h2>Admin Panel Login</h2>
        <form action="<%= request.getContextPath() %>/Admin/AdminLoginServlet" method="post">
            <div class="mb-3">
                <input type="text" class="form-control" id="username" name="username" placeholder="Username" required>
            </div>
            <div class="mb-3">
                <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
            </div>
            <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" id="remember" name="remember">
                <label class="form-check-label" for="remember">Remember me</label>
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
        </form>
    </div>
    
    <!-- Modal -->
	<div class="modal fade" id="successMessageModal" tabindex="-1" aria-labelledby="successMessageModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content" style="border-radius: 15px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); background: #f9f9f9;">
	            <div class="modal-header" style="border-bottom: 2px solid #ddd; padding: 15px; background: #4e73df; color: white; border-top-left-radius: 15px; border-top-right-radius: 15px;">
	                <h5 class="modal-title" id="successMessageModalLabel" style="font-size: 1.25rem; font-weight: bold;">Operation Status</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" style="background-color: #f1f1f1; border: none;"></button>
	            </div>
	            <div class="modal-body" style="padding: 25px 20px; font-size: 1rem; color: #555; line-height: 1.6;">
	                <c:if test="${loginSuccess}">
	                    <b><span id="successMessageContent" style="color: black; font-weight: 600;">${message}</span></b>
	                </c:if>
	                <c:if test="${not loginSuccess}">
	                    <b><span id="errorMessageContent" style="color: black; font-weight: 600;">${message}</span></b>
	                </c:if>
	            </div>
	            <div class="modal-footer" style="border-top: 1px solid #ddd; padding: 15px; background: #f1f1f1; display: flex; justify-content: center;">
	                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" aria-label="Close" id="closeButton" style="background-color: #4e73df; color: white; border-radius: 5px; padding: 10px 20px; font-size: 1rem; border: none; cursor: pointer; transition: background-color 0.3s;">
	                    OK
	                </button>
	            </div>
	        </div>
	    </div>
	</div>




    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

	  <script>
	    <% if (request.getAttribute("loginSuccess") != null) { %>
	        var myModal = new bootstrap.Modal(document.getElementById('successMessageModal'));
	        myModal.show();
	
	        // Check if login was successful
	        var loginSuccess = <%= request.getAttribute("loginSuccess") %>;
	
	        if (loginSuccess) {
	            // Handle the redirect only if the login is successful
	            document.getElementById("closeButton").addEventListener("click", function () {
	                window.location.href = "<%= request.getContextPath() %>/Views/Admin/A_Homepage.jsp"; // Redirect to the Admin homepage/dashboard
	            });
	        } else {
	            // If login failed, stay on the same page, just close the modal
	            document.getElementById("closeButton").addEventListener("click", function () {
	                // Close the modal and stay on the login page
	                myModal.hide();
	            });
	        }
	    <% } %>
	</script>



</body>
</html>
