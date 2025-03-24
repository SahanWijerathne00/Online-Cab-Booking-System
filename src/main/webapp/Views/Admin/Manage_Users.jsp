<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="../Views/CSS/Admin.css">
</head>
<body>

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
                <h4>Manage Users</h4>
            </div>

            <!-- Search Bar -->
            <div class="mt-3 mb-3">
                <input type="text" class="form-control" id="searchInput" placeholder="Search by Name, Email, or Phone" onkeyup="searchTable()">
            </div>

            <!-- User Table -->
            <div class="card mt-3">
                <div class="card-body">
                    <div class="table-responsive">

                        <!-- Debug: Print users list size -->
                        <p><strong>Total Users : </strong>
                            <c:choose>
                                <c:when test="${not empty requestScope.users}">
                                    ${requestScope.users.size()}
                                </c:when>
                                <c:otherwise>
                                    <span style="color: red;">users is NULL</span>
                                </c:otherwise>
                            </c:choose>
                        </p>

                        <table class="table table-bordered" id="userTable">
                            <thead class="table-dark">
                                <tr>
                                    <th>#</th>
                                    <th>Name</th>
                                    <th>Gender</th>
                                    <th>Address</th>
                                    <th>NIC</th>
                                    <th>Email</th>
                                    <th>Phone</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Loop through the user data -->
                                <c:choose>
                                    <c:when test="${not empty requestScope.users}">
                                         <c:forEach var="user" items="${requestScope.users}">
                                            <tr>
                                                <td>${user.registerId}</td>
                                                <td>${user.firstName} ${user.lastName}</td>
                                                <td>${user.gender}</td>
                                                <td>${user.address}</td>
                                                <td>${user.nic}</td>
                                                <td>${user.email}</td>
                                                <td>${user.phoneNumber}</td>
                                                <td>
                                                    <!-- Add the 'Remove' button and pass the userId -->
                                                    <button class="btn btn-info" type="button" data-bs-toggle="modal" data-bs-target="#confirmationModal" 
                                                    onclick="setUserId(${user.registerId})" style="background-color:#f2463a; color:white;"
                                                    >Remove</button>
                                                </td>
                                            </tr>
                                        </c:forEach>

                                        <!-- The Form to Submit the User ID for Deletion -->
                                        <form id="deleteForm" method="post" action="<%= request.getContextPath() %>/Admin/Delete_UserServlet">
                                            <input type="hidden" name="userId" id="userIdToDelete">
                                        </form>

                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="6" class="text-center">No Users Found</td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Modal for Confirmation -->
	<div class="modal" tabindex="-1" id="confirmationModal" aria-labelledby="confirmationModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="confirmationModalLabel">Confirm Deletion</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body">
	                <p><b>Are you sure you want to delete this user?<br>
	                 This action cannot be undone.
	                 </b></p>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
	                <button type="button" class="btn btn-danger" id="confirmDeleteBtn">Delete</button>
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
                    <!-- Dynamic message from the session attribute -->
                    <c:if test="${not empty sessionScope.deleteMessage}">
                        <p><b>${sessionScope.deleteMessage}</b></p>
                    </c:if>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">OK</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>

    <!-- Custom JS for search functionality -->
    <script>
        function searchTable() {
            const input = document.getElementById("searchInput");
            const filter = input.value.toLowerCase();
            const table = document.getElementById("userTable");
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
        function toggleSidebar() {
            const sidebar = document.getElementById('sidebar');
            const mainContent = document.getElementById('main-content');

            // Toggle sidebar state
            sidebar.classList.toggle('collapsed');
            mainContent.classList.toggle('expanded');
        }

        function setUserId(userId) {
            // Set the userId to the hidden input field
            document.getElementById("userIdToDelete").value = userId;
        }

        // When clicking the delete button, submit the form to delete the user
        document.getElementById('confirmDeleteBtn').addEventListener('click', function() {
            document.getElementById('deleteForm').submit();
        });

        // Show the success modal if there's a message
        <c:if test="${not empty sessionScope.deleteMessage}">
            var myModal = new bootstrap.Modal(document.getElementById('successModal'));
            myModal.show();
            // Remove the session message after showing the popup
            <c:remove var="deleteMessage" scope="session"/>
        </c:if>
    </script>
    

</body>
</html>
