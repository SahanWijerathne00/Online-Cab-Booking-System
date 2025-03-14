<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    
        <link href="../CSS/User.css" rel="stylesheet">
    

    <style>
        /* Full background image */
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

        .form-container {
            background-color: rgba(0, 0, 0, 0.6);
            border-radius: 8px;
            padding: 25px;
            margin-top: 100px;
            width: 100%;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
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
        

        .form-container h2 {
            color: #ffffff;
            font-size: 2rem;
            text-align: center;
            margin-bottom: 30px;
        }

        .form-fields label {
            font-size: 1rem;
            margin-bottom: 5px;
            color: #ffffff;
        }

        .form-fields input,
        .form-fields select {
            border-radius: 5px;
            border: 1px solid #ffffff;
            margin-bottom: 15px;
            padding: 10px;
            width: 100%;
            background-color: #f8f9fa;
        }

        .form-fields select {
            background-color: #fff;
        }

        .choose-cab-btn button {
            width: 100%;
            border-radius: 5px;
            padding: 12px;
            font-size: 1.1rem;
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
        }

        .choose-cab-btn button:hover {
            background-color: #218838;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .form-container {
                margin-top: 50px;
            }

            .form-container h2 {
                font-size: 1.8rem;
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

    <div class="container mt-5">
        <div class="form-container">
            <h2>Update Your Profile</h2>
            <form action="UpdateProfileServlet" method="POST">
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
                    <select id="gender" name="gender" class="form-control" required>
                        <option value="Male" ${sessionScope.userGender == 'Male' ? 'selected' : ''}>Male</option>
                        <option value="Female" ${sessionScope.userGender == 'Female' ? 'selected' : ''}>Female</option>
                        <option value="Other" ${sessionScope.userGender == 'Other' ? 'selected' : ''}>Other</option>
                    </select>
                </div>

                <!-- Submit Button -->
                <div class="choose-cab-btn">
                    <button type="submit">Update Profile</button>
                </div>
            </form>
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
