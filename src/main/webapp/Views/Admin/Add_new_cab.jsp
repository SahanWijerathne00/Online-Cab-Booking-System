<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Cab</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <link rel="stylesheet" href="../CSS/Admin.css">
   
</head>
<body>

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
                <h3><b>ADD NEW CAB</b></h3>
            </div>
            <div class="card mt-3">
                <div class="card-body">
            <form action="<%= request.getContextPath() %>/Admin/Add_CabServlet" method="POST" enctype="multipart/form-data">
                <h4><b>Cab Details</b></h4>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="category" class="form-label">Category:</label>
                        <select class="form-control" id="category" name="category" required>
                            <option value="5 Seater">expo</option>
                            <option value="6 Seater">city</option>
                            <option value="Van">car</option>
                        </select>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="regNumber" class="form-label">Registration Number:</label>
                        <input type="text" class="form-control" id="regNumber" name="regNumber" required>
                    </div>
                </div>
                
                <div class="row mt-3 mb-3">
                    <div class="col-md-6">
                        <label for="model" class="form-label">Model:</label>
                        <input type="text" class="form-control" id="model" name="model" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="plateNumber" class="form-label">Plate Number:</label>
                        <input type="text" class="form-control" id="plateNumber" name="plateNumber" required>
                    </div>
                </div>
                
                <div class="row mt-3 mb-3">
                    <div class="col-md-6">
                        <label for="fare" class="form-label">Base Fare:</label>
                        <input type="text" class="form-control" id="fare" name="fare" required>
                    </div>
                </div>
                
                <div class="row mt-3">
                    <div class="col-md-6 mb-3">
                        <label for="cabImage" class="form-label">Cab Image:</label>
                        <input type="file" class="form-control" id="cabImage" name="cabImage" accept="image/*" onchange="previewImage(event)">
                    </div>
                    <div class="col-md-6 d-flex align-items-center">
						<img id="imagePreview" alt="" style="max-width: 200px; max-height: 200px; display: none;">
                    </div>
                </div>
                
                <h4 class="mt-4"><b>Driver Details</b></h4>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="driverName" class="form-label">Driver Name:</label>
                        <input type="text" class="form-control" id="driverName" name="driverName" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="driverLicense" class="form-label">Driver License Number:</label>
                        <input type="text" class="form-control" id="driverLicense" name="driverLicense" required>
                    </div>
                </div>
                
                <div class="row mt-3">
                    <div class="col-md-6 mb-3">
                        <label for="driverContact" class="form-label">Driver Contact:</label>
                        <input type="text" class="form-control" id="driverContact" name="driverContact" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="driverAddress" class="form-label">Driver Address:</label>
                       <textarea class="form-control" id="driverAddress" name="driverAddress" rows="3" required></textarea>
                    </div>
                </div>
                
                <!-- Buttons -->
			    <div class="d-flex justify-content-between mt-3">
			        <a href="<%= request.getContextPath() %>/Admin/Manage_CabsServlet" class="btn btn-secondary">Back</a>
			        <button type="submit" class="btn btn-primary" style="width: 200px; height: 50px">Add Cab</button>
			        <button type="reset" class="btn btn-danger">Cancel</button>
			    </div>

			</form>

                </div>
            </div>
        </div>
    </div>
    
    
    <!-- Success/Error Modal -->
    <% 
        String message = (String) request.getAttribute("message");
        String status = (String) request.getAttribute("status");
        if (message != null && status != null) { 
    %>
        <div class="modal fade" id="statusModal" tabindex="-1" aria-labelledby="statusModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="statusModalLabel">Operation Status</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <div class="d-flex justify-content-center">
                            <i class="fas <%= "success".equals(status) ? "fa-check-circle text-success" : "fa-times-circle text-danger" %>" style="font-size: 3rem;"></i>
                            <p class="ms-3" style="font-size: 1.2rem;"><%= message %></p>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">OK</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
            document.addEventListener("DOMContentLoaded", function() {
                var myModal = new bootstrap.Modal(document.getElementById('statusModal'));
                myModal.show();
            });
        </script>
    <% } %>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
	    // Preview the selected image before submitting the form
	    function previewImage(event) {
	        var reader = new FileReader();
	        reader.onload = function() {
	            var output = document.getElementById('imagePreview');
	            output.src = reader.result;
	            output.style.display = 'block'; // Make the image visible once loaded
	        };
	        reader.readAsDataURL(event.target.files[0]); // Read the selected image as data URL
	    }
	</script>
	
    <!-- Custom JS for toggling sidebar -->
    <script>
        function toggleSidebar() {
            const sidebar = document.getElementById('sidebar');
            const mainContent = document.getElementById('main-content');

            sidebar.classList.toggle('collapsed');
            mainContent.classList.toggle('expanded');
        }
    </script>
</body>
</html>
