<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cab Service User Guide</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome Icons for Style -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

    <style>
        /* Custom Styling */
        body {
            font-family: 'Arial', sans-serif;
        }

        .hero-section {
            background-image: url('<c:url value="/Images/hero-bg.jpg" />');
            background-size: cover;
            background-position: center;
            color: white;
            height: 60vh;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 0 20px;
        }

        .hero-section h1 {
            font-size: 3rem;
            font-weight: bold;
        }

        .section-heading {
            font-size: 2rem;
            font-weight: bold;
            color: #343a40;
            margin-bottom: 20px;
        }

        .step-card {
            background-color: #f8f9fa;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease;
        }

        .step-card:hover {
            transform: translateY(-10px);
        }

        .step-card i {
            font-size: 3rem;
            color: #007bff;
        }

        .payment-methods {
            display: flex;
            justify-content: center;
            gap: 20px;
        }

        .payment-methods img {
            width: 80px;
            height: auto;
            transition: transform 0.2s ease;
        }

        .payment-methods img:hover {
            transform: scale(1.1);
        }

        .faq {
            margin-top: 50px;
        }

        .faq .accordion-item {
            border: 1px solid #ddd;
            border-radius: 10px;
        }

        .faq .accordion-header button {
            font-size: 1.1rem;
            font-weight: bold;
        }

        .faq .accordion-body {
            font-size: 1rem;
        }

        .contact-section {
            background-color: #f8f9fa;
            padding: 40px 20px;
        }

        .contact-section .form-control {
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .contact-section .btn {
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 1.1rem;
        }

        .contact-section .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>

    <!-- Hero Section -->
    <div class="hero-section">
        <div>
            <h1>Welcome to MegaCity Cab</h1>
            <p>Find out how our service works and explore all its features!</p>
        </div>
    </div>

    <!-- How It Works Section -->
    <div class="container my-5">
        <h2 class="section-heading text-center">How It Works</h2>
        <div class="row justify-content-center">
            <div class="col-md-3">
                <div class="step-card">
                    <i class="fas fa-search-location"></i>
                    <h5>Book a Ride</h5>
                    <p>Select your pick-up and drop-off locations through our easy-to-use app.</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="step-card">
                    <i class="fas fa-car"></i>
                    <h5>Get a Ride</h5>
                    <p>Your ride is confirmed instantly, and a nearby driver is on their way to pick you up.</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="step-card">
                    <i class="fas fa-credit-card"></i>
                    <h5>Pay Seamlessly</h5>
                    <p>Pay with your preferred method after your ride—quick and secure transactions.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Ride Features Section -->
    <div class="container my-5">
        <h2 class="section-heading text-center">Ride Features</h2>
        <p class="text-center">Our cab service offers top-notch features that ensure a comfortable and seamless experience.</p>
        <ul>
            <li><strong>Ride Tracking:</strong> Real-time GPS tracking of your ride.</li>
            <li><strong>Multiple Ride Options:</strong> Choose from economy, premium, or luxury rides.</li>
            <li><strong>24/7 Availability:</strong> We are available anytime, day or night.</li>
            <li><strong>Safe and Secure:</strong> All our drivers undergo thorough background checks.</li>
        </ul>
    </div>

    <!-- Payment Methods Section -->
    <div class="container my-5">
        <h2 class="section-heading text-center">Payment Methods</h2>
        <p class="text-center">We accept a wide range of payment options for your convenience.</p>
        <div class="payment-methods">
            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Visa_Logo_2014.svg/1280px-Visa_Logo_2014.svg.png" alt="Visa">
            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/MasterCard_Logo.svg/1280px-MasterCard_Logo.svg.png" alt="Mastercard">
            <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/American_Express_logo_%282013%29.svg/1280px-American_Express_logo_%282013%29.svg.png" alt="American Express">
            <img src="https://upload.wikimedia.org/wikipedia/commons/0/0d/PayPal_logo_2014.png" alt="PayPal">
        </div>
    </div>

    <!-- FAQ Section -->
    <div class="container faq my-5">
        <h2 class="section-heading text-center">Frequently Asked Questions (FAQ)</h2>
        <div class="accordion" id="faqAccordion">
            <div class="accordion-item">
                <h2 class="accordion-header" id="faqOne">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        How do I book a ride?
                    </button>
                </h2>
                <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="faqOne" data-bs-parent="#faqAccordion">
                    <div class="accordion-body">
                        To book a ride, simply enter your pick-up location, destination, and choose your ride preference. Our app will display available cars and estimated prices.
                    </div>
                </div>
            </div>
            <div class="accordion-item">
                <h2 class="accordion-header" id="faqTwo">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                        What payment methods are accepted?
                    </button>
                </h2>
                <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="faqTwo" data-bs-parent="#faqAccordion">
                    <div class="accordion-body">
                        We accept all major credit and debit cards, including Visa, MasterCard, American Express, and PayPal. Simply choose your preferred payment method at the end of the ride.
                    </div>
                </div>
            </div>
            <div class="accordion-item">
                <h2 class="accordion-header" id="faqThree">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                        Is there a cancellation fee?
                    </button>
                </h2>
                <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="faqThree" data-bs-parent="#faqAccordion">
                    <div class="accordion-body">
                        If you cancel your ride within 5 minutes of booking, there is no cancellation fee. After that, a small fee may apply depending on your location and timing.
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Contact Us Section -->
    <div class="container contact-section my-5">
        <h2 class="section-heading text-center">Contact Us</h2>
        <p class="text-center">If you have any further questions or need assistance, feel free to reach out to us!</p>
        <form>
            <div class="mb-3">
                <label for="name" class="form-label">Full Name</label>
                <input type="text" class="form-control" id="name" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email Address</label>
                <input type="email" class="form-control" id="email" required>
            </div>
            <div class="mb-3">
                <label for="message" class="form-label">Message</label>
                <textarea class="form-control" id="message" rows="4" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Send Message</button>
        </form>
    </div>

    <!-- Bootstrap JS (for Bootstrap's interactive elements like the accordion) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
