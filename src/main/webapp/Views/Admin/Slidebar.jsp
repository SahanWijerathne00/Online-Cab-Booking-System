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
    <link rel="stylesheet" href="../CSS/Admin.css">
    
    <!-- Custom CSS -->
    <style>
        /* Sidebar and Main Content Styles */
        .sidebar {
            width: 250px;
            height: 100vh;
            background-color: #343a40;
            position: fixed;
            left: 0;
            top: 0;
            transition: transform 0.3s ease-in-out;
            z-index: 1000;
        }
        .sidebar-header {
            padding: 20px;
            background-color: #212529;
            color: white;
        }
        .nav-link {
            color: #d1d1d1;
            font-weight:bold;
            padding: 15px;
            text-decoration: none;
            transition: all 0.3s ease;
        }
        .nav-link:hover {
            background-color: #495057;
            transform: scale(1.05); /* Slight zoom effect on hover */
        }
        .nav-link.active {
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            transition: all 0.3s ease;
        }
        .main-content {
            margin-left: 250px;
            transition: margin-left 0.3s ease-in-out;
            padding: 20px;
        }
        .sidebar.collapsed {
            transform: translateX(-250px);
        }
        .main-content.expanded {
            margin-left: 0;
        }

        /* Modal Custom Styles */
        .modal-content {
            border-radius: 10px;
        }

        .modal-header {
            background-color: #007bff;
            color: white;
        }

        .modal-footer {
            border-top: none;
        }

        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }

        .btn-danger:hover {
            background-color: #c82333;
            border-color: #bd2130;
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
                <a class="nav-link" href="<%= request.getContextPath() %>/Views/Admin/A_Homepage.jsp"><i class="fas fa-home"></i> <span class="nav-text">Dashboard</span></a>
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
                <a class="nav-link text-danger" href="#" data-bs-toggle="modal" data-bs-target="#logoutModal"><i class="fas fa-sign-out-alt"></i> <span class="nav-text">Logout</span></a>
            </li>        
        </ul>
    </div>

    <!-- Logout Confirmation Modal -->
    <div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="logoutModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="logoutModalLabel">Confirm Logout</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Are you sure you want to logout?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-danger" id="confirmLogout">Logout</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.querySelectorAll('.nav-link').forEach(link => {
            link.addEventListener('click', function() {
                document.querySelectorAll('.nav-link').forEach(l => l.classList.remove('active'));
                this.classList.add('active');
            });
        });

        const currentPage = window.location.pathname; 
        const links = document.querySelectorAll('.nav-link');
        
        links.forEach(link => {
            const linkHref = link.getAttribute('href');
            if (currentPage.includes(linkHref)) {
                link.classList.add('active');
            }
        });

        // Add event listener to the confirm logout button
        document.getElementById('confirmLogout').addEventListener('click', function() {
            // Redirect to login page after confirmation
            window.location.href = '<%= request.getContextPath() %>/Views/Admin/A_Login.jsp'; 
        });
    </script>
    
</body>
</html>
