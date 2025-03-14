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

    <footer class="text-center">
        <p>&copy; 2025 Mega City Cab | All Rights Reserved</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
