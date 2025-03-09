<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Mega City Cab</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"rel="stylesheet"/>
    
    <link href="../Views/CSS/Index.css" rel="stylesheet">
    <style>
    	/* Hero Section */
        .hero {
            height: 100vh;
            background-image: url('../Images/index_home.jpg'); /* Path to the uploaded full image */
            background-size: cover;
            background-position: center;
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
        }
        
       
    </style>
</head>
<body>

    <!-- Header using Bootstrap Navbar -->
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark">
            <div class="container-fluid">
                <a class="navbar-brand logo" href="#">Mega City Cab</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto"> 
                        <li class="nav-item">
                            <a class="nav-link active" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Services</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">About Us</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Contact Us</a>
                        </li>
                    </ul>
                    <a href="<%= request.getContextPath() %>/Views/User/U_Login.jsp" class="nav-link btn btn-danger text-white ms-5">Login</a>
                </div>
            </div>
        </nav>
    </header>

    <!-- Hero Section -->
    <div class="hero">
	    <div class="hero-text">
	        <div class="text1">Welcome to Mega City Cab</div><br>
	        Reliable and Fast Taxi Service in Colombo
	        <p>Book your ride with us easily and securely, and enjoy the best & comfortable cab experience in Colombo.</p>
	
	        <!-- View Cabs Button with Icon -->
	        <div class="d-flex justify-content-center">
	            <a href="#viewCabs" class="btn btn-primary d-flex align-items-center">
	                <i class="bi bi-car-front me-2"></i> <!-- Cab Icon -->
	                View Cabs
	                <i class="bi bi-arrow-right ms-2"></i> <!-- Right Arrow Icon -->
	            </a>
	        </div>
	    </div>
	</div>


    <!-- Services Section -->
    <div class="services-section">
        <div class="container">
            <h2>Our Professional Services</h2>
            <div class="row">
                <!-- Service Card 1 -->
                <div class="col-md-4 mb-4">
                    <div class="service-card">
                        <i class="bi bi-car-front"></i> <!-- Bootstrap Icons: Car Icon -->
                        <h5>City Rides</h5>
                        <p>Travel within the city with convenience and speed. Our cabs are equipped with GPS, ensuring you reach your destination safely and quickly.</p>
                    </div>
                </div>
                <!-- Service Card 2 -->
                <div class="col-md-4 mb-4">
                    <div class="service-card">
                        <i class="bi bi-geo-alt"></i> <!-- Bootstrap Icons: Map Pin Icon -->
                        <h5>Airport Transfers</h5>
                        <p>Our reliable airport transfer services ensure a smooth ride to and from the airport, providing a comfortable and timely experience.</p>
                    </div>
                </div>
                <!-- Service Card 3 -->
                <div class="col-md-4 mb-4">
                    <div class="service-card">
                        <i class="bi bi-clock"></i> <!-- Bootstrap Icons: Clock Icon -->
                        <h5>24/7 Service</h5>
                        <p>Our services are available around the clock. No matter the time of day, we ensure that a reliable vehicle is always available for your ride.</p>
                    </div>
                </div>
                <!-- Service Card 4 (Tours) -->
                <div class="col-md-4 mb-4">
                    <div class="service-card">
                        <i class="bi bi-globe"></i> <!-- Bootstrap Icons: Globe Icon -->
                        <h5>Country Tours</h5>
                        <p>Explore Country's significant culture, heritage, and vibrant attractions with our guided local country tours. Make the most of your trip with a knowledgeable local guide.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- What Customers Say Section -->
    <div class="testimonials-section">
        <div class="container">
            <h2>What Our Customers Say</h2>
            <div class="row">
                <!-- Testimonial 1 -->
                <div class="col-md-4 mb-4">
                    <div class="testimonial-item">
                        <img src="https://cdn-icons-png.freepik.com/512/219/219988.png" alt="Customer 1" class="customer-image">
                        <div>
                            <p>"Mega City Cab made my trip stress-free and convenient. The driver was friendly, and the ride was smooth and quick."</p>
                            <div class="customer-name">- Kusal Mendis</div>
                        </div>
                    </div>
                </div>
                <!-- Testimonial 2 -->
                <div class="col-md-4 mb-4">
                    <div class="testimonial-item">
                        <img src="https://i.pinimg.com/1200x/30/6f/d0/306fd0fb64f67ff40f81d8e37f8bf674.jpg" alt="Customer 2" class="customer-image">
                        <div>
                            <p>"I used Mega City Cab for airport transfers, and it was the best decision. On time, comfortable, and affordable!"</p>
                            <div class="customer-name">- Niroshan Dickwella</div>
                        </div>
                    </div>
                </div>
                <!-- Testimonial 3 -->
                <div class="col-md-4 mb-4">
                    <div class="testimonial-item">
                        <img src="https://cdn-icons-png.flaticon.com/512/219/219969.png" alt="Customer 3" class="customer-image">
                        <div>
                            <p>"I am a frequent traveler, and Mega City Cab is my go-to for city rides. Always reliable, always excellent service!"</p>
                            <div class="customer-name">- Chamika Karunarathne</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <!-- Footer Section -->
	<footer class="footer bg-dark text-light pt-5">
  <div class="container">
    <div class="row">
      <!-- Logo & About -->
      <div class="col-lg-4 col-md-6">
        <h2 class="fw-bold brand-logo">Mega City Cab</h2>
        <p class="footer-text">
          Your trusted ride partner, ensuring safe and reliable city-wide
          transportation 24/7.
        </p>
      </div>

      <!-- Quick Links -->
      <div class="col-lg-2 col-md-3 col-sm-6">
        <h5 class="fw-bold">Quick Links</h5>
        <ul class="list-unstyled">
          <li><a href="#" class="footer-link">Home</a></li>
          <li><a href="#" class="footer-link">Services</a></li>
          <li><a href="#" class="footer-link">About Us</a></li>
          <li><a href="#" class="footer-link">Contact Us</a></li>
        </ul>
      </div>

      <!-- Contact Info -->
      <div class="col-lg-3 col-md-3 col-sm-6">
        <h5 class="fw-bold">Contact</h5>
        <p>
          <i class="fas fa-map-marker-alt footer-icon"></i> No.123/A,Old Street ,<br>
         													Colombo 5.
        </p>
        <p><i class="fas fa-phone footer-icon"></i> +94 0112 256542 <br> +94 712365564</p>
        <p>
          <i class="fas fa-envelope footer-icon"></i> support@megacitycab.com
        </p>
      </div>

      <!-- Social Media Links -->
      <div class="col-lg-3 col-md-12 text-lg-end text-md-start">
        <h5 class="fw-bold">Follow Us</h5>
        <div class="social-icons">
          <a href="#"><i class="fab fa-facebook fa-2x"></i></a>
          <a href="#"><i class="fab fa-twitter fa-2x"></i></a>
          <a href="#"><i class="fab fa-instagram fa-2x"></i></a>
          <a href="#"><i class="fab fa-linkedin fa-2x"></i></a>
        </div>
      </div>
    </div>

    <!-- Horizontal Line -->
    <hr class="footer-line" />

    <!-- Copyright Section -->
    <div class="text-center pb-3">
      <p>&copy; 2025 Mega City Cab | All Rights Reserved</p>
    </div>
  </div>
</footer>



    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.js"></script>
    

</body>
</html>
