<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .checkout-container {
            max-width: 900px;
            margin: auto;
            padding: 30px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .section-header {
            font-size: 1.5rem;
            font-weight: bold;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
        }
        .section-header i {
            margin-right: 10px;
            color: #007bff;
        }
        .card {
            border: none;
            box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.1);
        }
        .btn-confirm {
            background-color: #007bff;
            color: white;
            font-size: 18px;
            padding: 12px 20px;
            width: 50%;
            border-radius: 8px;
            transition: 0.3s;
        }
        .btn-confirm:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <div class="checkout-container">
        <h2 class="text-center mb-4"><i class="bi bi-check-circle-fill"></i> Checkout</h2>
        <p class="text-center text-muted">Almost there! Please review your booking details before confirming.</p>

        <div class="row">
            <!-- User Details -->
            <div class="col-md-6">
                <div class="section-header"><i class="bi bi-person-fill"></i> User Details</div>
               <div class="card p-3" style="background-color: #c9c9c7;">
				    <p><strong>Name:</strong> ${sessionScope.name}</p>
				    <p><strong>Email:</strong> ${sessionScope.email}</p>
				    <p><strong>Mobile:</strong> ${sessionScope.phone}</p>
			</div>

            </div>

            <!-- Booking Details -->
            <div class="col-md-6">
                <div class="section-header"><i class="bi bi-car-front-fill"></i> Booking Details</div>
                <div class="card p-3" style="background-color: #c9c9c7;">
                    <p><strong>Cab:</strong> ${sessionScope.cabCategory} - ${sessionScope.cabModel}</p>
                    <p><i class="bi bi-calendar-check-fill"></i> <strong>Booking Time:</strong> ${sessionScope.bookingTime}</p>
                    <p><i class="bi bi-geo-alt-fill text-primary"></i> <strong>Pickup:</strong> ${sessionScope.pickupLocation}</p>
                    <p><i class="bi bi-geo-alt-fill text-danger"></i> <strong>Drop-off:</strong> ${sessionScope.dropLocation}</p>
                    <p><i class="bi bi-rulers"></i> <strong>Distance:</strong> ${sessionScope.distance}</p>
                </div>
            </div>
        </div>

        <!-- Payment Details -->
        <div class="section-header mt-4"><i class="bi bi-wallet-fill"></i> Payment Details</div>
        <div class="card p-3" style="background-color: #c9c9c7;">
            <p class="fw-bold"><i class="bi bi-cash-coin"></i> Estimated Fare: 
                <span class="text-primary">LKR <%= session.getAttribute("price") != null ? session.getAttribute("price") : "0.00" %></span>
            </p>

            <!-- Payment Method Selection -->
            <form action="<%= request.getContextPath() %>/user/PaymentServlet" method="post" id="paymentForm">
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="paymentMethod" value="cash" checked>
                    <label class="form-check-label"><i class="bi bi-cash"></i> Cash Payment</label>
                </div>

                <div class="form-check">
                    <input class="form-check-input" type="radio" name="paymentMethod" id="cardPayment" value="card">
                    <label class="form-check-label"><i class="bi bi-credit-card-2-front"></i> Card Payment</label>
                </div>

                <div class="form-check">
                        <input class="form-check-input" type="radio" name="paymentMethod" id="walletPayment" value="wallet">
                        <label class="form-check-label"><i class="bi bi-wallet"></i> Digital Wallet</label>
                </div>

            </form>
        </div>
        
        
        <div class="mt-4 d-flex justify-content-between">
            <a href="U_view_cabs.jsp" class="btn btn-secondary"><i class="bi bi-arrow-left"></i> Back</a>
            <button class="btn btn-confirm"><i class="bi bi-check-circle"></i> Confirm Ride</button>
        </div>

        <!-- Card Payment Modal -->
        <div class="modal fade" id="cardModal" tabindex="-1" aria-labelledby="cardModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="cardModalLabel">Enter Card Details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="<%= request.getContextPath() %>/user/CardPaymentServlet" method="post">
                            <div class="mb-3">
                                <label for="cardNumber" class="form-label">Card Number</label>
                                <input type="text" name="cardNumber" class="form-control" required>
                            </div>

                            <div class="mb-3">
                                <label for="expiryDate" class="form-label">Expiry Date</label>
                                <input type="month" name="expiryDate" class="form-control" required>
                            </div>

                            <div class="mb-3">
                                <label for="cvv" class="form-label">CVV</label>
                                <input type="text" name="cvv" class="form-control" required>
                            </div>

                            <button type="submit" class="btn btn-success">Confirm Card Payment</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Digital Wallet Payment Modal -->
        <div class="modal fade" id="walletModal" tabindex="-1" aria-labelledby="walletModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="walletModalLabel">Enter Digital Wallet Details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="WalletPaymentServlet" method="post">
                            <div class="mb-3">
                                <label for="walletId" class="form-label">Wallet ID</label>
                                <input type="text" name="walletId" class="form-control" required>
                            </div>

                            <div class="mb-3">
                                <label for="walletPassword" class="form-label">Wallet Password</label>
                                <input type="password" name="walletPassword" class="form-control" required>
                            </div>

                            <button type="submit" class="btn btn-success">Confirm Wallet Payment</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

	    <% 
	    String paymentStatus = (String) session.getAttribute("paymentStatus");
	    if (paymentStatus != null) { 
		%>
		    <div class="alert alert-success mt-3"><%= paymentStatus %></div>
		<% 
		    } 
		%>


        <!-- Buttons -->
        
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const cardPaymentOption = document.getElementById("cardPayment");
        const cardModal = new bootstrap.Modal(document.getElementById('cardModal'));

        cardPaymentOption.addEventListener("change", function () {
            if (this.checked) {
                cardModal.show();
            }
        });
    });
</script>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const walletPaymentOption = document.getElementById("walletPayment");
        const walletModal = new bootstrap.Modal(document.getElementById('walletModal'));

        walletPaymentOption.addEventListener("change", function () {
            if (this.checked) {
                walletModal.show();
            }
        });

    });
</script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
