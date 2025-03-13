<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create New Admin</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>

    <!-- Sidebar (Include if needed) -->
    <%@ include file="Slidebar.jsp" %>

    <!-- Main Content Area -->
    <div class="main-content" id="main-content">
        <nav class="navbar navbar-light bg-light px-3">
            <button class="btn btn-dark" type="button" onclick="toggleSidebar()">
                <i class="fas fa-bars"></i>
            </button>
            <span class="navbar-text" style="font-size: 1.2rem; font-weight: 500;">Mega City Cab - Admin Panel</span>
        </nav>

        <div class="container mt-4">
            <h4 class="text-center">Create New Admin User</h4>
            <div class="card mt-3 mx-auto" style="max-width: 500px;">
                <div class="card-body">
                    <form action="<%= request.getContextPath() %>/Admin/Add_AdminServlet" method="POST" enctype="multipart/form-data">
                        <div class="mb-3">
                            <label for="name" class="form-label">Full Name</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>

                        <div class="mb-3">
                            <label for="username" class="form-label">Username</label>
                            <input type="text" class="form-control" id="username" name="username" required>
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <div class="input-group">
                                <input type="password" class="form-control" id="password" name="password" required minlength="6">
                                <button class="btn btn-outline-secondary" type="button" id="togglePassword"><i class="fas fa-eye"></i></button>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="role" class="form-label">Role</label>
                            <select class="form-select" id="role" name="role" required>
                                <option value="Super Admin">Super Admin</option>
                                <option value="Staff Admin">Staff Admin</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="avatar" class="form-label">Profile Picture</label>
                            <input type="file" class="form-control" id="avatar" name="avatar" accept="image/*">
                        </div>

                        <div class="d-flex justify-content-between">
                        	<div>
                                <a href="<%= request.getContextPath() %>/Admin/Manage_AdminsServlet" class="btn btn-secondary">Back</a>
                            </div>
                            <button type="submit" class="btn btn-primary">Create Admin</button>
                            <div>
                                <button type="reset" class="btn btn-danger">Cancel</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Get Message and Status from Servlet (Check for Null) -->
    <% 
        String message = (String) request.getAttribute("message");
        String status = (String) request.getAttribute("status");
    %>

    <!-- Modal for Success or Error Message -->
    <% if (message != null && status != null) { %>
        <div class="modal fade" id="statusModal" tabindex="-1" aria-labelledby="statusModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="statusModalLabel">Operation Status</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div id="modalMessage" class="d-flex justify-content-center">
                            <!-- Success or Error Icon -->
                            <i id="statusIcon" class="fas 
                            <% if ("success".equals(status)) { %> 
                                fa-check-circle text-success 
                            <% } else { %> 
                                fa-times-circle text-danger 
                            <% } %>" style="font-size: 3rem;"></i>
                            <!-- Message Text -->
                            <p id="messageText" class="ms-3" style="font-size: 1.2rem;"><%= message %></p>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Show Modal Script -->
        <script>
            document.addEventListener("DOMContentLoaded", function() {
                var myModal = new bootstrap.Modal(document.getElementById('statusModal'));
                myModal.show();
            });
        </script>
    <% } %>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Toggle Password Visibility -->
    <script>
        document.getElementById('togglePassword').addEventListener('click', function () {
            const passwordField = document.getElementById('password');
            const icon = this.querySelector('i');

            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                passwordField.type = 'password';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        });
    </script>

    <!-- Sidebar Toggle -->
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
