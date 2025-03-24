<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Cab Details</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
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
				<span class="navbar-text" style="font-size: 1.2rem; font-weight: 500;">Mega City Cab - Admin Panel</span>        </nav>

        <div class="container mt-4">
            <div class="d-flex justify-content-center align-items-center">
                <h3><b>UPDATE CAB DETAILS</b></h3>
            </div>
            <div class="card mt-3">
                <div class="card-body">
                    <!-- Form to Edit Cab and Driver Details -->
                    <form action="<%= request.getContextPath() %>/Admin/Update_CabServlet" method="POST" enctype="multipart/form-data">
                        <!-- Cab Details Section -->
                        <h4><b>Cab Details</b></h4>
                        <div class="row">
                            <!-- Hidden input for Cab ID -->
                            <input type="text" name="id" value="${cab.id}" />
                            <input type="hidden" name="oldImage" value="${cab.image}" /> <!-- Store old image path -->

                            <!-- Category Dropdown -->
                            <div class="col-md-6 mb-3">
                              <label for="cabCategory" class="form-label"><b>Registration Number</b></label>
                                <input type="text" class="form-control" id="category" name="category" readonly value="${cab.category}" required>
                            </div>

                            <!-- Other Cab Details -->
                            <div class="col-md-6 mb-3">
                                <label for="regNumber" class="form-label"><b>Category</b></label>
                                <input type="text" class="form-control" id="regNumber" name="regNumber" readonly value="${cab.regNumber}" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="model" class="form-label"><b>Model</b></label>
                                <input type="text" class="form-control" id="model" name="model" value="${cab.model}" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="plateNumber" class="form-label"><b>Plate Number</b></label>
                                <input type="text" class="form-control" id="plateNumber" name="plateNumber" value="${cab.plateNumber}" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="fare" class="form-label"><b>Base Fare</b></label>
                                <input type="text" class="form-control" id="fare" name="fare" value="${cab.fare}" required>
                            </div>
                        </div>

                        <!-- Image Section: Show Current Image and Upload New Image -->
                        <div class="row mt-3 mb-3">
                            <div class="col-md-6 mb-3">
                                <label for="cabImage" class="form-label"><b>Change Cab Image</b></label>
                                <input type="file" class="form-control" id="cabImage" name="cabImage" accept="image/*" onchange="previewImage(event)">
                            </div>
                            <div class="col-md-6 mb-3">
                                <img id="imagePreview" src="${pageContext.request.contextPath}/uploads/${cab.image}" alt="Cab Image Preview" class="img-fluid" style="display:block; max-width: 100%; max-height: 300px; border: 2px solid #007bff; padding: 10px; border-radius: 8px;">
                            </div>
                        </div>

                        <!-- Driver Details Section -->
                        <h4 class="mt-3"><b>Driver Details</b></h4>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="driverName" class="form-label"><b>Driver Name</b></label>
                                <input type="text" class="form-control" id="driverName" name="driverName" value="${cab.driverName}" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="driverLicense" class="form-label"><b>Driver License Number</b></label>
                                <input type="text" class="form-control" id="driverLicense" name="driverLicense" value="${cab.driverLicense}" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="driverContact" class="form-label"><b>Driver Contact</b></label>
                                <input type="text" class="form-control" id="driverContact" name="driverContact" value="${cab.driverContact}" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="driverAddress" class="form-label"><b>Driver Address</b></label>
                                <textarea class="form-control" id="driverAddress" name="driverAddress" rows="3" required>${cab.driverAddress}</textarea>
                            </div>
                        </div>

                        <!-- Buttons for Save, Cancel, Back -->
                        <div class="d-flex justify-content-between">
                            <div>
                                <a href="<%= request.getContextPath() %>/Admin/Manage_CabsServlet" class="btn btn-secondary">Back</a>
                            </div>
                            <button type="submit" class="btn btn-primary" style="width: 200px; height: 50px">Save Changes</button>
                            <div>
                                <button type="reset" class="btn btn-danger">Cancel</button>
                            </div>
                        </div>
                    </form>
                </div> 
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Custom JS for toggling sidebar -->
    <script>
        function toggleSidebar() {
            const sidebar = document.getElementById('sidebar');
            const mainContent = document.getElementById('main-content');

            sidebar.classList.toggle('collapsed');
            mainContent.classList.toggle('expanded');
        }

        // Preview Image before uploading
        function previewImage(event) {
            var reader = new FileReader();
            reader.onload = function() {
                var output = document.getElementById('imagePreview');
                output.src = reader.result;
            };
            reader.readAsDataURL(event.target.files[0]); // Convert the selected file to base64
        }
    </script>
</body>
</html>
