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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Views/CSS/Admin.css">

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
                <a class="nav-link" href="#"><i class="fas fa-calendar-alt"></i> <span class="nav-text">View Bookings</span></a>
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
                <a class="nav-link text-danger" href="#"><i class="fas fa-sign-out-alt"></i> <span class="nav-text">Logout</span></a>
            </li>        
        </ul>
    </div>

    <!-- Main Content Area -->
   
   

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
