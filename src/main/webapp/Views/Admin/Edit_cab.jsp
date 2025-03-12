<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <!-- Custom CSS -->
    <link rel="stylesheet" href="../CSS/Admin.css">
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
            <span class="navbar-text">Cab Booking System - Admin</span>
        </nav>
    
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
                            <!-- Debugging: Output the cab.id value -->
<p>ID: ${cab.id}</p>
                            
                            <input type="hidden" name="id" value="${cab.id}" />
                            
                            <div class="col-md-6 mb-3">
                                <label for="category" class="form-label">Category</label>
                                <select class="form-select" id="category" name="category" required>
                                    <option value="5 Seater" <c:if test="${cab.category == 'expo'}">selected</c:if>>expo</option>
                                    <option value="14 Seater" <c:if test="${cab.category == 'city'}">selected</c:if>>city</option>
                                    <option value="9 Seater" <c:if test="${cab.category == 'car'}">selected</c:if>>car</option>
                                </select>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="regNumber" class="form-label">Registration Number</label>
                                <input type="text" class="form-control" id="regNumber" name="regNumber" value="${cab.regNumber}" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="model" class="form-label">Model</label>
                                <input type="text" class="form-control" id="model" name="model" value="${cab.model}" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="plateNumber" class="form-label">Plate Number</label>
                                <input type="text" class="form-control" id="plateNumber" name="plateNumber" value="${cab.plateNumber}" required>
                            </div>
 							<div class="col-md-6 mb-3">
		                        <label for="fare" class="form-label">Base Fare</label>
		                        <input type="text" class="form-control" id="fare" name="fare" value="${cab.fare}" required>
		                    </div>
                	
                        </div>

                        <!-- Image Section: Show Current Image and Upload New Image -->
                        <div class="row mt-3 mb-3">
                            <div class="col-md-6 mb-3">
                                <label for="cabImage" class="form-label">Change Cab Image</label>
                                <input type="file" class="form-control" id="cabImage" name="cabImage" accept="image/*" onchange="previewImage(event)">
                            </div>
                            <div class="col-md-6 mb-3">
                                <!-- Preview the existing image (if exists) or show placeholder -->
                                <img id="imagePreview" src="<c:if test='${not empty cab.image}'>${cab.image}</c:if>" alt="Cab Image Preview" class="img-fluid" style="display:block; max-width: 100%; max-height: 300px; border: 2px solid #007bff; padding: 10px; border-radius: 8px;">
                            </div>
                        </div>

                        <!-- Driver Details Section -->
                        <h4 class="mt-3"><b>Driver Details</b></h4>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="driverName" class="form-label">Driver Name</label>
                                <input type="text" class="form-control" id="driverName" name="driverName" value="${cab.driverName}" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="driverLicense" class="form-label">Driver License Number</label>
                                <input type="text" class="form-control" id="driverLicense" name="driverLicense" value="${cab.driverLicense}" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="driverContact" class="form-label">Driver Contact</label>
                                <input type="text" class="form-control" id="driverContact" name="driverContact" value="${cab.driverContact}" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="driverAddress" class="form-label">Driver Address</label>
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
