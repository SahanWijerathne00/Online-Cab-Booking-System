<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Categories</title>
    <!-- Bootstrap CSS -->
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
            <span class="navbar-text">Cab Booking System - Admin</span>
        </nav>

        <div class="container mt-4">
            <div class="d-flex justify-content-between align-items-center">
                <h4>List of Cab Categories</h4>
                <!-- Add New Cab Button -->
                <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addCabModal"><i class="fas fa-car"></i> Add New Category</button>
            </div>

            <div class="card mt-3">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead class="table-dark">
                                <tr>
                                    <th>#</th>
                                    <th>Category Name</th>
                                    <th>Rate</th>
                                    <th>Description</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Display categories -->
                                <c:forEach var="category" items="${categories}">
                                    <tr>
                                        <td>${category.id}</td>
                                        <td>${category.categoryName}</td>
                                        <td>${category.rate }</td>
                                        <td>${category.description}</td>
                                        <td>${category.status}</td>
                                        <td>
                                            <!-- Edit Button with category ID passed as URL parameter -->
                                            <a href="Edit_CategoryServlet?id=${category.id}" class="btn btn-info">Edit</a>
                                            <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteConfirmationModal" onclick="setDeleteId(${category.id})">Delete</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Add New Cab Modal -->
    <div class="modal fade" id="addCabModal" tabindex="-1" aria-labelledby="addCabModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addCabModalLabel">Add New Category</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- Form to Add Cab -->
                    <form action="<%= request.getContextPath() %>/Admin/Add_CategoryServlet" method="POST">
                        <div class="mb-3">
                            <label for="cabName" class="form-label">Category Name</label>
                            <input type="text" class="form-control" id="cabName" name="CategoryName" required>
                        </div>
						
						<div class="mb-3">
                            <label for="rate" class="form-label">Rate(Per Kilometer)</label>
                            <input type="text" class="form-control" id="rate" name="rate" required>
                        </div>
                        <div class="mb-3">
                            <label for="description" class="form-label">Description</label>
                            <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
                        </div>

                        <div class="mb-3">
                            <label for="status" class="form-label">Status</label>
                            <select class="form-select" id="status" name="status" required>
                                <option value="Active">Active</option>
                                <option value="Inactive">Inactive</option>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary">Save</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Edit Category Modal (Populated from servlet) -->
    <div class="modal fade" id="editCategoryModal" tabindex="-1" aria-labelledby="editCategoryModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editCategoryModalLabel">Edit Category</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- Form to Edit Category -->
                    <form action="<%= request.getContextPath() %>/Admin/Update_CategoryServlet" method="POST">
                        <input type="hidden" name="id" value="${category.id}" /> <!-- Hidden field for category ID -->
                        
                        <div class="mb-3">
                            <label for="categoryName" class="form-label">Category Name</label>
                            <input type="text" class="form-control" id="categoryName" name="categoryName" value="${category.categoryName}" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="rate" class="form-label">Rate(Per Kilometer)</label>
                            <input type="text" class="form-control" id="rate" name="rate" value="${category.rate}" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="description" class="form-label">Description</label>
                            <textarea class="form-control" id="description" name="description" rows="3" required>${category.description}</textarea>
                        </div>
                        
                        <div class="mb-3">
                            <label for="status" class="form-label">Status</label>
                            <select class="form-select" id="status" name="status" required>
                                <option value="Active" ${category.status == 'Active' ? 'selected' : ''}>Active</option>
                                <option value="Inactive" ${category.status == 'Inactive' ? 'selected' : ''}>Inactive</option>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary">Save Changes</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
    
    <!-- Delete Confirmation Modal -->
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
	                <form id="deleteCategoryForm" action="<%= request.getContextPath() %>/Admin/Delete_CategoryServlet" method="POST">
	                    <input type="hidden" id="deleteCategoryId" name="id" />
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
                    <h5 class="modal-title" id="successMessageModalLabel">Success</h5>
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
    
    
    <!-- Bootstrap JS and Popper.js (required for modal functionality) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- JavaScript to trigger modal -->
    <script>
        <c:if test="${not empty param.message}">
            // Set the success message dynamically in the modal content
            document.getElementById('successMessageContent').innerText = '${param.message}';
            
            // Trigger the modal to display the success message
            var successModal = new bootstrap.Modal(document.getElementById('successMessageModal'));
            successModal.show();
        </c:if>
    </script>

    <!-- Custom JS to open the modal programmatically when needed -->
    <script>
        // Check if the modal should be displayed (showModal attribute)
        <c:if test="${not empty category}">
            // Trigger the modal open
            var myModal = new bootstrap.Modal(document.getElementById('editCategoryModal'));
            myModal.show();
        </c:if>
    </script>
    
    <script>
	    function setDeleteId(id) {
	        document.getElementById('deleteCategoryId').value = id;
	    }
	</script>
    
</body>
</html>
