<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="../CSS/Admin.css">
    <style>
    	       
        .main-content {
            background: #e9ecef; 
            padding: 30px;
            border-radius: 10px;
            margin-left: 260px; 
            transition: margin-left 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); 
        }

        .main-content h2 {
            color: #333;
            font-size: 2rem;
            font-weight: 600;
        }

        .main-content p {
            color: #555;
            font-size: 1.2rem;
            line-height: 1.6;
        }

        /* Styling for Cards */
        .card {
            border-radius: 10px;
            background-color: #f8f9fa; 
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px); 
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1); 
        }

        .card-body {
            background-color: #f1f7b7; 
        }

        .card-title {
            font-size: 1.5rem;
            color: #007bff; 
        }

        .card-text {
            color: #6c757d; 
        }

        .navbar-text {
            font-size: 1.2rem;
            font-weight: 500;
        }

        /* Welcome section styling */
        .main-content .welcome-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            
        }

        .main-content .welcome-section img {
            width: 300px;
            border-radius: 10px;
        }

        /* Sidebar Collapse Effect */
        .sidebar.collapsed {
            width: 60px;
        }

        .main-content.expanded {
            margin-left:  0px;
        }

        /* Responsive Design for Smaller Screens */
        @media (max-width: 768px) {
            .main-content h2 {
                font-size: 1.8rem;
            }

            .main-content p {
                font-size: 1rem;
            }

            .card-title {
                font-size: 1.3rem;
            }

            .card-body {
                padding: 15px;
            }
        }
    </style>
</head>
<body>

    <!-- Sidebar (Fixed) -->
    <div class="sidebar" id="sidebar">
        <div class="sidebar-header">
            <h4 class="sidebar-title"><i class="fas fa-tachometer-alt"></i> <span class="sidebar-text">Admin Panel</span></h4>
        </div>
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link active" href="<%= request.getContextPath() %>/Views/Admin/A_Homepage.jsp"><i class="fas fa-home"></i> <span class="nav-text">Dashboard</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%= request.getContextPath() %>/Admin/ViewBookingServlet"><i class="fas fa-calendar-alt"></i> <span class="nav-text">View Bookings</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%= request.getContextPath() %>/Admin/Add_CategoryServlet"><i class="fas fa-list"></i> <span class="nav-text">Manage Category</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%= request.getContextPath() %>/Admin/Manage_CabsServlet"><i class="fas fa-car"></i> <span class="nav-text">Cabs Management</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%= request.getContextPath() %>/Admin/Manage_UsersServlet"><i class="fas fa-users"></i> <span class="nav-text">Manage Registered Clients</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%= request.getContextPath() %>/Admin/Manage_AdminsServlet"><i class="fas fa-user-shield"></i> <span class="nav-text">System Admins</span></a>
            </li>
            <li class="nav-item">
			    <a class="nav-link" href="<%= request.getContextPath() %>/Admin/ViewFeedbackServlet"><i class="fas fa-clipboard-list"></i> <span class="nav-text">View Feedbacks</span></a>
			</li>
            <li class="nav-item">
                <a class="nav-link text-danger" href="#"><i class="fas fa-sign-out-alt"></i> <span class="nav-text">Logout</span></a>
            </li>        
        </ul>
    </div>

    <!-- Main Content Area -->
    <div class="main-content" id="main-content">
        <nav class="navbar navbar-light bg-light px-3">
            <button class="btn btn-dark" type="button" onclick="toggleSidebar()">
                <i class="fas fa-bars"></i>
            </button>
            <span class="navbar-text">Mega City Cab - Admin Panel</span>
        </nav>
        <div class="container mt-4">
            <div class="welcome-section">
                <div>
                    <h2>Welcome to the Admin Dashboard</h2>
                    <p>Manage All Things in Here. Explore the features from the sidebar to perform the necessary tasks.</p>
                </div>
                <img src="https://phoenixnap.com/glossary/wp-content/uploads/2024/05/what-is-a-firewall-1.jpg" alt="Dashboard Image"> <!-- Example Image -->
            </div>

            <!-- Example Cards - Removed and changed to content-focused layout -->
            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title">Manage System</h5>
                            <p class="card-text">Use the sidebar to navigate and manage various parts of the cab system. Edit categories, manage cabs, and more.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title">View Bookings</h5>
                            <p class="card-text">Check the status of customer bookings and ensure everything is running smoothly.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title">Manage Registered Clients</h5>
                            <p class="card-text">You can view and manage the details of all registered clients here. Ensure that client information is up-to-date.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function toggleSidebar() {
            const sidebar = document.getElementById('sidebar');
            const mainContent = document.getElementById('main-content');

            // Toggle sidebar state
            sidebar.classList.toggle('collapsed');
            mainContent.classList.toggle('expanded');
        }
    </script>
</body>
</html>
