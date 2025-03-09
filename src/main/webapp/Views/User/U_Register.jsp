<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: url('') no-repeat center center/cover;
        }
        
        #left-side {
            background: #6b3cc9; 
            color: white;
            text-align: center;
        }

        .btn-primary {
            background: #6b3cc9;
            border: none;
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

    <div class="container-fluid vh-100 d-flex align-items-center justify-content-center">
        <div class="row shadow-lg rounded-4 overflow-hidden w-75">
            
            <!-- Left Side: Image + Description -->
            <div class="col-md-6 d-flex flex-column justify-content-center bg-color-red text-white p-4" id="left-side">
                <h2>Welcome to Our Platform</h2>
                <p>Create an account to enjoy our services.</p>
                <img src="https://img.freepik.com/premium-photo/yellow-taxi-cab-middle-city-street-photographed-black-white-with-taxi-color_36682-398751.jpg" class="img-fluid mt-3 rounded" alt="Signup Image">
            </div>

          
            <div class="col-md-6 bg-white p-4">
                <h3 class="text-center mb-4">Create an Account</h3>
            
                <!-- Display success/failure message using Bootstrap Modal -->
                <c:if test="${not empty message}">
                    <div class="modal fade" id="messageModal" tabindex="-1" aria-labelledby="messageModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="messageModalLabel">Registration Status</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <i class="bi bi-check-circle tick-icon"></i> <!-- Tick icon -->
                                    <p class="mt-3">${message}</p>
                                </div>
                                <div class="modal-footer">
                                    <!-- Redirect to U_Login.jsp when OK is clicked -->
                                    <button type="button" class="btn btn-secondary" id="okButton">OK</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
                
                <form action="<%= request.getContextPath() %>/User/UserRegisterServlet" method="post">
                    <div class="row mb-3">
                        <div class="col-6">
                            <input type="text" name="firstName" class="form-control mb-2" placeholder="First Name" required>
                        </div>
                        <div class="col-6">
                            <input type="text" name="lastName" class="form-control mb-2" placeholder="Last Name" required>
                        </div>
                    </div>

                    <input type="text" name="address" class="form-control mb-3" placeholder="Address" required>

                    <div class="d-flex align-items-center mb-3">
                        <span class="me-3">Gender:</span>
                        <div class="form-check me-2">
                            <input class="form-check-input" type="radio" name="gender" value="male" required>
                            <label class="form-check-label">Male</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="gender" value="female" required>
                            <label class="form-check-label">Female</label>
                        </div>
                    </div>

                    <input type="text" name="nic" class="form-control mb-3" placeholder="NIC" required>
                    <input type="tel" name="phoneNumber" class="form-control mb-3" placeholder="Phone Number" required>
                    <input type="email" name="email" class="form-control mb-3" placeholder="Email" required>
                    <input type="text" name="username" class="form-control mb-3" placeholder="Username" required>

                    <div class="row mb-3">
					    <div class="col-6">
					        <input type="password" name="password" class="form-control mb-2" placeholder="Password" maxlength="6" required>
					    </div>
					    <div class="col-6">
					        <input type="password" name="confirmPassword" class="form-control mb-2" placeholder="Confirm Password" maxlength="6" required>
					    </div>
					</div>


                    <div class="form-check mb-3">
                        <input type="checkbox" class="form-check-input" required>
                        <label class="form-check-label">I agree to the <a href="#">Terms & Conditions</a></label>
                    </div>

                    <button type="submit" class="btn btn-primary w-100">Register</button>
                    
                    
                </form>
            </div>

        </div>
    </div>

    <!-- Bootstrap JS and Popper -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

    <!-- Trigger the modal -->
    <c:if test="${not empty message}">
        <script>
            var myModal = new bootstrap.Modal(document.getElementById('messageModal'));
            myModal.show();

            // Add event listener to "OK" button to redirect to U_Login.jsp
            document.getElementById("okButton").addEventListener("click", function() {
                window.location.href = "<%= request.getContextPath() %>/Views/User/U_Login.jsp"; 
            });
            
        </script>
        <script>
document.addEventListener("DOMContentLoaded", function() {
    const password = document.querySelector("input[name='password']");
    const confirmPassword = document.querySelector("input[name='confirmPassword']");
    
    function validatePasswordLength() {
        if (password.value.length > 6) {
            alert("Password must be a maximum of 6 characters.");
            password.value = password.value.substring(0, 6); // Trim excess characters
        }
    }

    function checkMatchingPasswords() {
        if (password.value !== confirmPassword.value) {
            confirmPassword.setCustomValidity("Passwords do not match!");
        } else {
            confirmPassword.setCustomValidity("");
        }
    }

    password.addEventListener("input", validatePasswordLength);
    confirmPassword.addEventListener("input", checkMatchingPasswords);
});
</script>
        
    </c:if>
    
    <script>
document.addEventListener("DOMContentLoaded", function() {
    const password = document.querySelector("input[name='password']");
    const confirmPassword = document.querySelector("input[name='confirmPassword']");
    
    function validatePasswordLength() {
        if (password.value.length > 6) {
            alert("Password must be a maximum of 6 characters.");
            password.value = password.value.substring(0, 6); // Trim excess characters
        }
    }

    function checkMatchingPasswords() {
        if (password.value !== confirmPassword.value) {
            confirmPassword.setCustomValidity("Passwords do not match!");
        } else {
            confirmPassword.setCustomValidity("");
        }
    }

    password.addEventListener("input", validatePasswordLength);
    confirmPassword.addEventListener("input", checkMatchingPasswords);
});
</script>

    

</body>
</html>
