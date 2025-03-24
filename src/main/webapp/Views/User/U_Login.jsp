<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    
    <link rel="stylesheet" href="../CSS/User.css">
    
    <style>
    	body{
			background-color: #929494;    	
    	}
    	
    	.modal-content {
            border-radius: 10px;
        }

        .modal-header {
            background-color: #6b3cc9;
            color: white;
            border-bottom: 2px solid #6b3cc9;
        }

        .modal-footer .btn {
            background-color: #6b3cc9;
            color: white;
            border: none;
        }

        .modal-body {
            text-align: center;
        }

        .tick-icon {
            font-size: 50px;
            color: #28a745; 
        }

        .modal-dialog {
            max-width: 400px;
        }
    </style>
</head>
<body>

    <div class="container d-flex justify-content-center align-items-center min-vh-100">
        <div class="row shadow-lg rounded-4 overflow-hidden w-75">
            <!-- Left Section (Image) -->
            <div class="col-md-6 bg-image p-0">
                <img src="https://www.subtraction.com/wp-content/uploads/2018/10/2018-10-08-taxis.jpg" 
                    class="img-fluid h-100 w-100" alt="Login Image">
            </div>

            <!-- Right Section (Login Form) -->
            <div class="col-md-6 bg-white p-5">
                <h2 class="mb-3 text-center">LOGIN</h2>

                <!-- Login Form -->
                <form action="<%= request.getContextPath() %>/User/UserLoginServlet" method="post">
                    <div class="mb-3">
                        <input type="text" name="username" class="form-control" placeholder="Username" required>
                    </div>
                    <div class="mb-3">
                        <input type="password" name="password" class="form-control" placeholder="Password" required>
                    </div>
                   
                    <button type="submit" class="btn btn-primary w-100">Log In</button>
                </form>
                <p class="mt-3 text-center">Don't have an account? <a href="U_Register.jsp" class="text-primary">Signup</a></p>
            </div>
        </div>
    </div>

    <!-- Success/Failure Modal (Styled the same as before) -->
    <c:if test="${not empty sessionScope.message}">
        <div class="modal fade" id="messageModal" tabindex="-1" aria-labelledby="messageModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="messageModalLabel">Message</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <i class="bi bi-check-circle tick-icon"></i> <!-- Tick icon -->
                        <p class="mt-3">${sessionScope.message}</p> <!-- Success/Error message -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="okButton">OK</button>
                    </div>
                </div>
            </div>
        </div>
    </c:if>

    <!-- Bootstrap JS (Optional) -->
     <!-- Bootstrap JS and Popper -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    <script>
        var message = "<c:out value='${sessionScope.message}' />";

        if (message) {
            var successModal = new bootstrap.Modal(document.getElementById('messageModal'));
            successModal.show();
            <c:remove var="message" />
            
          	 document.getElementById("okButton").addEventListener("click", function() {
                   window.location.href = "<%= request.getContextPath() %>/Views/User/U_Homepage.jsp"; 
               });
        }
    </script>

</body>
</html> 
