<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Cabs</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Views/CSS/Admin.css">
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
            <div class="d-flex justify-content-between align-items-center">
    			<h4>List of Cabs</h4>
				    <a href="<%= request.getContextPath() %>/Views/Admin/Add_new_cab.jsp" class="btn btn-success">
				        <i class="fas fa-car"></i> Add New Cab
				    </a>
			</div>

            <!-- Search Bar -->
            <div class="mt-3 mb-3">
                <input type="text" class="form-control" id="searchInput" placeholder="Search by Category, Model, or Reg. Code" onkeyup="searchTable()">
            </div>

            <!-- Cab Table -->
            <div class="card mt-3">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="cabTable">
                            <thead class="table-dark">
                                <tr>
                                    <th>#</th>
                                    <th>Reg. Code</th>
                                    <th>Category</th>
                                    <th>Model</th>
                                    <th>Basic Fare (Rs)</th>
                                    <th>Details</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Loop through the cab data -->
                                <c:forEach var="cab" items="${cabs}">
								    <tr>
								        <td>${cab.id}</td>
								        <td>${cab.category}</td>
								         <td>${cab.regNumber}</td>
								        <td>
								        	${cab.model}<br>
								        	<strong>Plate:</strong> ${cab.plateNumber}
								        </td>
								         <td>${cab.fare}</td>
								        <td>
								        	
								            <strong>Driver:</strong> ${cab.driverName}<br>
								            <strong>License:</strong> ${cab.driverLicense}<br>
								            <strong>Contact:</strong> ${cab.driverContact}<br>
								            <strong>Address:</strong> ${cab.driverAddress}
								        </td>
								        <td>
										    <span class="badge bg-${cab.status == 'Active' ? 'success' : 'danger'}">
										        ${cab.status}
										    </span>
										</td>
								
								        <td>
								            <a href="Edit_CabsServlet?id=${cab.id}" class="btn btn-info">Edit</a>
                                            <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteConfirmationModal" onclick="setDeleteId(${cab.id})">Delete</button>
										</td>
								    </tr>
								</c:forEach>

                            </tbody>
                        </table>
                    </div>

                    <div class="d-flex justify-content-between mt-3">
                        <p>Showing 1 to ${cabs.size()} of ${cabs.size()} entries</p>
                        <nav>
                            <ul class="pagination">
                                <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <div class="modal fade" id="deleteConfirmationModal" tabindex="-1" aria-labelledby="deleteConfirmationModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="deleteConfirmationModalLabel">Confirm Deletion</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body">
	                <b>Are you sure you want to Delete this Cab?<br>
	                   This action cannot be undone.
	                </b>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
	                <form id="deleteCabForm" action="<%= request.getContextPath() %>/Admin/Delete_CabServlet" method="POST">
	                    <input type="hidden" id="deleteCabId" name="id" />
	                    <button type="submit" class="btn btn-danger">Delete</button>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>
	
	<div class="modal fade" id="successMessageModal" tabindex="-1" aria-labelledby="successMessageModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="successMessageModalLabel">Operation Status</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <b><span id="successMessageContent"> </span></b>  <!-- Success message content goes here -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Custom JS for toggling sidebar and search functionality -->
    <script>
        // Sidebar toggle function
        function toggleSidebar() {
            const sidebar = document.getElementById('sidebar');
            const mainContent = document.getElementById('main-content');

            sidebar.classList.toggle('collapsed');
            mainContent.classList.toggle('expanded');
        }

        // Search function for filtering table rows
        function searchTable() {
            const input = document.getElementById("searchInput");
            const filter = input.value.toLowerCase();
            const table = document.getElementById("cabTable");
            const rows = table.getElementsByTagName("tr");

            for (let i = 1; i < rows.length; i++) {
                const cells = rows[i].getElementsByTagName("td");
                let found = false;

                for (let j = 0; j < cells.length; j++) {
                    if (cells[j]) {
                        const text = cells[j].textContent || cells[j].innerText;
                        if (text.toLowerCase().indexOf(filter) > -1) {
                            found = true;
                            break;
                        }
                    }
                }

                if (found) {
                    rows[i].style.display = "";
                } else {
                    rows[i].style.display = "none";
                }
            }
        }
    </script>
    
    <script>
        <c:if test="${not empty param.message}">
            // Set the success message dynamically in the modal content
            document.getElementById('successMessageContent').innerText = '${param.message}';
            
            // Trigger the modal to display the success message
            var successModal = new bootstrap.Modal(document.getElementById('successMessageModal'));
            successModal.show();
        </c:if>
    </script>


    
    <script>
	    function setDeleteId(id) {
	        document.getElementById('deleteCabId').value = id;
	    }
	</script>
    
    
    


</body>
</html>
