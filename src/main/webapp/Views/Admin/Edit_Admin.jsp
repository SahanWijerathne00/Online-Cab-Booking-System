<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Admin</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>

    <!-- Sidebar (Include if needed) -->
    <%@ include file="Slidebar.jsp" %>
    
    <div class="main-content" id="main-content">
        <nav class="navbar navbar-light bg-light px-3">
            <button class="btn btn-dark" type="button" onclick="toggleSidebar()">
                <i class="fas fa-bars"></i>
            </button>
            <span class="navbar-text" style="font-size: 1.2rem; font-weight: 500;">Mega City Cab - Admin Panel</span>
        </nav>

    <!-- Main Content Area -->
    <div class="container mt-4">
        <h4 class="text-center"><b>Edit Admin User</b></h4>
        <div class="card mt-3 mx-auto" style="max-width: 500px;">
            <div class="card-body">
                <!-- Form to Edit Admin -->
                <form action="<%= request.getContextPath() %>/Admin/Update_AdminServlet" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="${admin.id}"> <!-- Hidden field for admin ID -->

                    <div class="mb-3">
                        <label for="name" class="form-label"><b>Full Name</b></label>
                        <input type="text" class="form-control" id="name" name="name" value="${admin.name}" required>
                    </div>

                    <div class="mb-3">
                        <label for="username" class="form-label"><b>Username</b></label>
                        <input type="text" class="form-control" id="username" name="username" value="${admin.username}" required>
                    </div>

                    <div class="mb-3">
                        <label for="password" class="form-label"><b>Password</b></label>
                        <div class="input-group">
                            <input type="password" class="form-control" id="password" name="password" value="${admin.password}" required minlength="6">
                            <button class="btn btn-outline-secondary" type="button" id="togglePassword"><i class="fas fa-eye"></i></button>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="role" class="form-label"><b>Role</b></label>
                        <select class="form-select" id="role" name="role" required>
                            <option value="Super Admin" <c:if test="${admin.role == 'Super Admin'}">selected</c:if>>Super Admin</option>
                            <option value="Staff Admin" <c:if test="${admin.role == 'Staff Admin'}">selected</c:if>>Staff Admin</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="avatar" class="form-label"><b>Profile Picture (Optional)</b></label>
                        <input type="file" class="form-control" id="avatar" name="avatar" accept="image/*">
                        <img src="${pageContext.request.contextPath}/uploads/${admin.avatar}" alt="Admin Avatar" class="mt-2" width="50" height="50">
                    </div>

                    <div class="d-flex justify-content-between">
                        <div>
                            <a href="<%= request.getContextPath() %>/Admin/Manage_AdminsServlet" class="btn btn-secondary">Back</a>
                        </div>
                        <button type="submit" class="btn btn-primary">Save Changes</button>
                        <div>
                            <button type="reset" class="btn btn-danger">Cancel</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    </div>

    <!-- Success Modal -->
   <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="successModalLabel">Operation Status</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- Display success or error message -->
                    <c:if test="${not empty sessionScope.message}">
                        <p><b>${sessionScope.message}</b></p>
                    </c:if>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Show success modal if message exists in session -->
    <script>
        <c:if test="${not empty sessionScope.message}">
            var myModal = new bootstrap.Modal(document.getElementById('successModal'));
            myModal.show();
            // Remove the session message after showing the popup
            <c:remove var="message" scope="session"/>
        </c:if>
    </script>

</body>
</html>
