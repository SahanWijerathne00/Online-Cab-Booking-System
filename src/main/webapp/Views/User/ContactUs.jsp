<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Contact Us - Mega City Cab</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500&display=swap" rel="stylesheet" />
    <link href = "../CSS/User.css" rel="stylesheet">
    

    <style>
        /* Background Image */
        body {
            background: url('https://images.pexels.com/photos/1955134/pexels-photo-1955134.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260') no-repeat center center/cover;
            color: white;
            position: relative;
        }

        /* Overlay for better text visibility */
        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
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
        
        .section-title {
            font-size: 2.5rem;
            font-weight: 600;
            color: white;
            margin-bottom: 40px;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
        }

        .contact-container {
            background: #636262;
            padding: 40px;
            border-radius: 10px;
        }

        .contact-info i {
            font-size: 24px;
            color: #00d4ff;
            margin-right: 10px;
        }

        .contact-info p {
            font-size: 1.2rem;
            color: white;
        }

        .form-control,
        .btn {
            height: 50px;
            font-size: 1.1rem;
            border-radius: 8px;
        }

        .btn-primary {
            background-color: #ed777b;
            border: none;
        }

        .btn-primary:hover {
            background-color: #525050;
        }

        .map-container {
            width: 100%;
            height: 350px;
            border-radius: 10px;
            overflow: hidden;
        }

        .social-icons i {
            font-size: 30px;
            margin: 10px;
            color: #00d4ff;
            transition: transform 0.3s, color 0.3s;
        }

        .social-icons i:hover {
            transform: scale(1.2);
            color: #ed777b;
        }

        footer {
            background-color: #000000;
            color: white;
            padding: 10px;
        }
        
        .nav-link.active {
	        background-color: #ddd;  /* Red color for active link */
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
	
	    

        @media (max-width: 768px) {
            .section-title {
                font-size: 2rem;
            }

            .contact-info p {
                font-size: 1rem;
            }

            .social-icons i {
                font-size: 25px;
            }

            .map-container {
                height: 250px;
            }
            
		    }
    </style>
</head>

<body>
    <!-- Navbar -->
    <div class="header d-flex justify-content-between align-items-center">
        <div class="cab-name">MegaCity Cab</div>
	        <div class="nav-links d-flex justify-content-center flex-grow-1">
		        <a href="U_Homepage.jsp" class="nav-link">Home</a>
		        <a href="ContactUs.jsp" class="nav-link">Contact Us</a>
		        <a href="<%= request.getContextPath() %>/User/MyBookingsServlet" class="nav-link">My Bookings</a>
		        <a href="UpdateProfile.jsp" class="nav-link">Profile</a>
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

    <!-- Contact Section -->
    <div class="container py-5">
        <h2 class="section-title text-center">Contact Us</h2>

        <div class="row justify-content-center">
            <div class="col-lg-8 contact-container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="contact-info">
                            <p><i class="fas fa-map-marker-alt"></i> 123 Main Street, Mega City, Country</p>
                            <p><i class="fas fa-phone"></i> +1 (234) 567-890</p>
                            <p><i class="fas fa-envelope"></i> support@megacitycab.com</p>
                            <p><i class="fas fa-clock"></i> Mon - Sun: 24/7 Service</p>
                        </div>

                        <!-- Social Media Links -->
                        <div class="social-icons mt-4">
                            <a href="#" class="text-decoration-none"><i class="fab fa-facebook"></i></a>
                            <a href="#" class="text-decoration-none"><i class="fab fa-twitter"></i></a>
                            <a href="#" class="text-decoration-none"><i class="fab fa-instagram"></i></a>
                            <a href="#" class="text-decoration-none"><i class="fab fa-linkedin"></i></a>
                        </div>
                    </div>

                    <!-- Contact Form -->
                    <div class="col-md-6">
                        <form id="contactForm">
                            <div class="mb-3">
                                <input type="text" class="form-control" name="name" placeholder="Your Name" required />
                            </div>
                            <div class="mb-3">
                                <input type="email" class="form-control" name="email" placeholder="Your Email" required />
                            </div>
                            <div class="mb-3">
                                <textarea class="form-control" name="message" rows="4" placeholder="Your Message" required></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Send Message</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Google Map -->
        <div class="map-container mt-5">
            <iframe src="https://maps.google.com/maps?q=Mega%20City%20Cab&t=&z=13&ie=UTF8&iwloc=&output=embed"
                width="100%" height="100%" frameborder="0" allowfullscreen></iframe>
        </div>
    </div>

   <footer class="text-center" style="margin-top:10px; padding:20px 0 20px; background-color: black; height:50px; color:white; font-weight:bold;">
        <p>&copy; 2025 Mega City Cab | All Rights Reserved</p>
    </footer>

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
	        // Select all nav links
	        const navLinks = document.querySelectorAll('.nav-link');
	        
	        // Check if the current URL contains the link's href and add 'active' class to the corresponding link
	        navLinks.forEach(link => {
	            // Remove active class from all links initially
	            link.classList.remove('active');
	            
	            // If the current link's href matches the current URL, make it active
	            if (window.location.pathname.includes(link.getAttribute('href'))) {
	                link.classList.add('active');
	            }
	        });
	
	        // Add event listener for clicks on nav links to maintain the active state
	        navLinks.forEach(link => {
	            link.addEventListener('click', function () {
	                // Remove 'active' class from all nav links
	                navLinks.forEach(link => link.classList.remove('active'));
	                
	                // Add 'active' class to the clicked link
	                this.classList.add('active');
	            });
	        });
	    });
	</script>
	
</body>

</html>
