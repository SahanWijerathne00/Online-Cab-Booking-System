<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>

    <!-- Bootstrap 5 CDN -->
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500&display=swap" rel="stylesheet" />
    <link href = "../CSS/User.css" rel="stylesheet">

    <style>
        /* Full background image */
        .full-bg {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 145%;
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
        

        .cab-name {
            font-size: 2rem;
            font-weight: bold;
        }

        .nav-link.active {
	        background-color:#ddd;  /* Red color for active link */
	        color: #ebb521;  /* White text */
	        font-weight: bold;
	        border-radius: 5px;
	        padding: 5px 10px;
	    }
	
	    .nav-link {
	        text-decoration: none;
	        color: #333;  /* Normal link color */
	        padding: 10px 15px;
	        font-size: 1rem;
	    }


        /* Two-column form container */
        .form-container {
            background-color: #434544;
            border-radius: 12px;
            padding: 30px;
            margin-top: 120px;
            width: 100%;
            max-width: 900px;
            margin-left: auto;
            margin-right: auto;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
        }

        .form-container h2 {
            color: white;
            font-size: 2.2rem;
            text-align: center;
            margin-bottom: 30px;
        }

        .form-fields {
            margin-bottom: 20px;
        }

        .form-fields label {
            font-size: 1.1rem;
            margin-bottom: 8px;
            color: white;
        }

        .form-fields input,
        .form-fields select {
            border-radius: 6px;
            border: 1px solid #ddd;
            margin-bottom: 15px;
            padding: 12px;
            width: 100%;
            background-color: #f8f9fa;
            font-size: 1rem;
        }

        .form-fields select {
            background-color: #fff;
        }

        /* Button Styling */
        .choose-cab-btn button {
            width: 50%;
            border-radius: 8px;
            padding: 15px;
            font-size: 1.3rem;
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
            justify-content: center;
            margin-left: 200px;
        }

        .choose-cab-btn button:hover {
            background-color: #218838;
        }

        
        /* Two-column layout for the form */
        .row-cols-md-2 .form-fields {
            display: flex;
            flex-direction: column;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .form-container {
                margin-top: 50px;
            }

            .form-container h2 {
                font-size: 1.8rem;
            }


            .form-fields input,
            .form-fields select {
                padding: 10px;
            }
        }
    </style>
</head>

<body>
    <div class="full-bg"></div>

    <!-- Header Section -->
    <div class="header d-flex justify-content-between align-items-center">
        <div class="cab-name">MegaCity Cab</div>
        <div class="nav-links d-flex justify-content-center flex-grow-1">
            <a href="U_Homepage.jsp" class="nav-link">Home</a>
            <a href="ContactUs.jsp" class="nav-link">Contact Us</a>
		    <a href="<%= request.getContextPath() %>/User/MyBookingsServlet" class="nav-link">My Bookings</a>
            <a href="UpdateProfile.jsp" class="nav-link active">Profile</a>
            <a href="UserGuide.jsp" class="nav-link">Guidelines</a>
        </div>
        <div class="user-info d-flex align-items-center">
            <c:if test="${not empty sessionScope.userFirstName}">
                <div class="d-flex align-items-center">
                    <div class="user-icon me-2" onclick="toggleUserMenu()">
                        <i class="bi bi-person-circle"></i>
                    </div>
                    <span class="greeting-text me-2">Hi, ${sessionScope.userFirstName}</span>
                </div>
                <div class="user-menu">
                    <button class="logout-btn" onclick="confirmLogout()">Logout</button>
                </div>
            </c:if>
        </div>
    </div>

    <!-- Update Profile Form -->
   <div class="container mt-5">
	    <div class="form-container">
	        <h2>Update Your Profile</h2>
	        <form action="<%= request.getContextPath() %>/User/UpdateProfileServlet" method="POST">
	            <div class="row row-cols-1 row-cols-md-2">
	            
	               <input type="hidden" id="id" name="id" class="form-control" value="${sessionScope.userId}" readonly>
	            
	                <!-- First Name Field -->
	                <div class="form-fields">
	                    <label for="firstName">First Name</label>
	                    <input type="text" id="firstName" name="firstName" class="form-control" value="${sessionScope.userFirstName}" required>
	                </div>
	
	                <!-- Last Name Field -->
	                <div class="form-fields">
	                    <label for="lastName">Last Name</label>
	                    <input type="text" id="lastName" name="lastName" class="form-control" value="${sessionScope.userLastName}" required>
	                </div>
	
	                <!-- Email Field -->
	                <div class="form-fields">
	                    <label for="email">Email</label>
	                    <input type="email" id="email" name="email" class="form-control" value="${sessionScope.userEmail}" required>
	                </div>
	
	                <!-- Address Field -->
	                <div class="form-fields">
	                    <label for="address">Address</label>
	                    <input type="text" id="address" name="address" class="form-control" value="${sessionScope.userAddress}" required>
	                </div>
	
	                <!-- Phone Number Field -->
	                <div class="form-fields">
	                    <label for="phoneNumber">Phone Number</label>
	                    <input type="text" id="phoneNumber" name="phoneNumber" class="form-control" value="${sessionScope.userPhoneNumber}" required>
	                </div>
	
	                <!-- Gender Field -->
	                <div class="form-fields">
	                    <label for="gender">Gender</label>
	                    <input type="text" id="gender" name="gender" class="form-control" value="${sessionScope.userGender}" readonly>
	                </div>
	
	                <!-- NIC Field (Read Only) -->
	                <div class="form-fields">
	                    <label for="nic">NIC</label>
	                    <input type="text" id="nic" name="nic" class="form-control" value="${sessionScope.userNic}" readonly>
	                </div>
	
	                <!-- Username Field -->
	                <div class="form-fields">
	                    <label for="username">Username</label>
	                    <input type="text" id="username" name="username" class="form-control" value="${sessionScope.userUsername}" required>
	                </div>
	
	                <!-- Password Field -->
	                <div class="form-fields">
					    <label for="password">Password</label>
					    <div class="input-group">
					        <input type="password" id="password" name="password" class="form-control" value="${sessionScope.userPassword}" required>
					        <button type="button" class="btn btn-outline-secondary" id="togglePassword">
					            <i class="fas fa-eye"></i> <!-- Font Awesome eye icon -->
					        </button>
					    </div>
					</div>

	
	            </div>
	
	            <!-- Submit Button -->
	            <div class="choose-cab-btn">
	                <button type="submit" style="align-content: center;">Update Profile</button>
	            </div>
	        </form>
	    </div>
	</div>
	
	
	
	<div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="successModalLabel">Success</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <c:if test="${not empty sessionScope.message}">
                        <p>${sessionScope.message}</p>
                    </c:if>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
	
	<footer class="text-center" style="margin-top:10px; padding:20px 0 20px; background-color: black; height:50px; color:white; font-weight:bold;">
        <p>&copy; 2025 Mega City Cab | All Rights Reserved</p>
    </footer>



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
        // Show success modal if there's a message in the session
        <c:if test="${not empty sessionScope.message}">
            var myModal = new bootstrap.Modal(document.getElementById('successModal'));
            myModal.show();
            // Clear the session message after displaying the modal
            <c:remove var="message" scope="session"/>
        </c:if>
    </script>

<!-- Add Font Awesome 5 CDN (if not already included in your page) -->
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

<!-- JavaScript for toggling the password visibility -->
<script>
    document.getElementById('togglePassword').addEventListener('click', function() {
        const passwordField = document.getElementById('password');
        const icon = this.querySelector('i');

        // Toggle password visibility
        if (passwordField.type === 'password') {
            passwordField.type = 'text';  
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash'); 
        } else {
            passwordField.type = 'password';  
            icon.classList.remove('fa-eye-slash');
            icon.classList.add('fa-eye'); 
        }
    });
</script>
    

</body>

</html>
