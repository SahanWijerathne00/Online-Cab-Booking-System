<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.MegaCityCab.user.model.CabDetails" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Vehicles</title>
    <link href="../CSS/User.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        
    
    
    <style>
        .cab-card { margin-bottom: 20px; }
        .vehicle-bar { display: flex; justify-content: center; flex-wrap: wrap; background-color: #f4f4f4; padding: 15px; }
        .vehicle-option { cursor: pointer; margin: 5px; padding: 10px; border: 2px solid #ddd; border-radius: 8px; transition: 0.3s; }
        .vehicle-option:hover, .vehicle-option.active { background-color: #007bff; color: white; border-color: #0056b3; }
    </style>
</head>
<body>
	
	
	<%
	    String category = request.getParameter("category");
	    if (category == null) {
	        category = "Expo";  // Default to Expo if no category is selected
	    }
	    List<CabDetails> cabs = (List<CabDetails>) session.getAttribute("cabs");
	    if (cabs == null || cabs.isEmpty()) {
	        request.setAttribute("error", "No cabs found.");
	    }
	%>
    <!-- Category Selection Bar -->
    <div class="container">
        <div class="vehicle-bar">
            <form action="<%= request.getContextPath() %>/user/ViewCabsServlet" method="GET">
                <input type="hidden" name="category" id="selectedCategory">
                <button type="submit" class="btn vehicle-option ${selectedCategory eq 'Expo' ? 'active' : ''}" onclick="setCategory('Expo')">Expo</button>
                <button type="submit" class="btn vehicle-option ${selectedCategory eq 'Budget' ? 'active' : ''}" onclick="setCategory('Budget')">Budget</button>
                <button type="submit" class="btn vehicle-option ${selectedCategory eq 'Semi' ? 'active' : ''}" onclick="setCategory('Semi')">Semi</button>
                <button type="submit" class="btn vehicle-option ${selectedCategory eq 'Car' ? 'active' : ''}" onclick="setCategory('Car')">Car</button>
                <button type="submit" class="btn vehicle-option ${selectedCategory eq '9 Seater' ? 'active' : ''}" onclick="setCategory('9 Seater')">9 Seater</button>
                <button type="submit" class="btn vehicle-option ${selectedCategory eq '14 Seater' ? 'active' : ''}" onclick="setCategory('14 Seater')">14 Seater</button>
            </form>
        </div>
    </div>
    


    <!-- Cabs Display Section -->
   <div class="container mt-4">
    <div class="row">
        <c:forEach var="cab" items="${cabs}">
            <div class="col-md-4">
                <div class="card cab-card">
					<img src="<%= request.getContextPath() %>/${cab.image}" class="card-img-top" alt="Cab Image">
                    <div class="card-body">
                        <h5 class="card-title">${cab.model}</h5>
                        	               
                        <p class="card-text">${cab.category}</p>
						<a href="<%= request.getContextPath() %>/Views/User/U_Login.jsp"><button type="button" class="btn btn-primary"  >Book Now</button></a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>


	<c:if test="${not empty sessionScope.cabCategory}">
	    <script>
	        document.addEventListener("DOMContentLoaded", function() {
	            var modal = new bootstrap.Modal(document.getElementById('moreDetailsModal'));
	            modal.show();
	        });
	    </script>
	</c:if>
	
	
	<script>
	
	    
	    function submitBooking() {
	        // You can add AJAX or form submission logic here
	        alert("Booking details submitted!");
	    }
	
	    function setCategory(category) {
	        document.getElementById("selectedCategory").value = category;
	    }
	</script>
	




    <!-- Bootstrap JS (required for modals) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>

</body>
</html>
