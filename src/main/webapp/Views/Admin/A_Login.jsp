<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnMq5JIDFiNco63H2B2w1yrjchv-YiUcDCkA&s'); /* Replace with your image path */
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
            background-image: url('https://assets.serverwatch.com/uploads/2010/07/System-Administrator-Tasks-to-Automate.jpeg'); /* Replace with your image path */
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
        <div class="card-header"></div> <!-- Image section -->
        <h2>Login</h2>
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
            <div class="footer-links mt-3">
                <a href="#">Forgot password?</a>
                <a href="#">Create Account</a>
            </div>
        </form>
    </div>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

    <!-- JavaScript to handle the popup -->
    <script>
        <% 
            Boolean loginSuccess = (Boolean) request.getAttribute("loginSuccess");
            if (loginSuccess != null && loginSuccess) { 
        %>
            // Display success message in a popup
            alert("Login Successful! Redirecting to Admin Dashboard.");
            window.location.href = "<%= request.getAttribute("nextPage") %>";
        <% } %>
    </script>

</body>
</html>
