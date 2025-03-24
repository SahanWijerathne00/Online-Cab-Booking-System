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
        .vehicle-bar {
		    display: flex;
		    justify-content: center;
		    flex-wrap: wrap;
		    padding: 15px;
		    gap: 10px;
		}
		
		.vehicle-option {
		    cursor: pointer;
		    width: 100px;
		    padding: 10px 20px;
		    border: 2px solid #ddd;
		    border-radius: 8px;
		    transition: 0.3s;
		    font-size: 1rem;
		    text-align: center;
		    display: inline-flex; 
		    flex-direction: column;
		    align-items: center; 
		    box-sizing: border-box;
		}
		 
	
		.category-icon {
		    width: 60px;  
		    height: 50px; 
		    margin-bottom: 5px;
		}
		
		.vehicle-option:hover,
		.vehicle-option.active {
		    background-color: #007bff;
		    color: white;
		    border-color: #0056b3;
		}
		
		/* For the 9 Seater and 14 Seater buttons */
		.vehicle-option .category-icon {
		    width: 35px;  
		    height: 35px; 
		}
        
        .cab-card {
		    margin-bottom: 20px;
		    border: 2px solid #007bff; /* Solid border */
		    border-radius: 15px; /* Rounded corners */
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Slight shadow for depth */
		    overflow: hidden; /* To make sure the border-radius applies to images as well */
		    display: flex;
		    flex-direction: column;
		    justify-content: space-between;
		    height: 100%;
		}
		
		.cab-card img {
		    width: 100%;
		    height: 200px; /* Fixed image height */
		    object-fit: cover; /* Ensure the image covers the area without distortion */
		}
		
		.cab-card .card-body {
		    padding: 15px;
		    text-align: center;
		}
		
		.cab-title {
		    font-size: 1.2rem;
		    font-weight: bold;
		    color: #333;
		}
		
		.cab-category {
		    font-size: 1rem;
		    color: #666;
		    margin-bottom: 15px;
		}
		
		.btn-book-now {
		    background-color: #007bff;
		    color: white;
		    border: none;
		    border-radius: 8px;
		    padding: 10px 20px;
		    cursor: pointer;
		    transition: background-color 0.3s ease;
		}
		
		.btn-book-now:hover {
		    background-color: #0056b3;
		}
		
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
                <button type="submit" class="btn vehicle-option ${selectedCategory eq 'Expo' ? 'active' : ''}" onclick="setCategory('Expo')">
	            <img src="../Images/expo.png" alt="Expo" class="category-icon"> Expo
		        </button>
		        <button type="submit" class="btn vehicle-option ${selectedCategory eq 'Budget' ? 'active' : ''}" onclick="setCategory('Budget')">
		            <img src="../Images/budget.png" alt="Budget" class="category-icon"> Budget
		        </button>
		        <button type="submit" class="btn vehicle-option ${selectedCategory eq 'Semi' ? 'active' : ''}" onclick="setCategory('Semi')">
		            <img src="../Images/semi.png" alt="Semi" class="category-icon"> Semi
		        </button>
		        <button type="submit" class="btn vehicle-option ${selectedCategory eq 'Car' ? 'active' : ''}" onclick="setCategory('Car')">
		            <img src="../Images/car.png" alt="Car" class="category-icon"> Car
		        </button>
		        <button type="submit" class="btn vehicle-option ${selectedCategory eq '9 Seater' ? 'active' : ''}" onclick="setCategory('9 Seater')">
		            <img src="../Images/9 seater.png" alt="9 Seater" class="category-icon"> 9 Seater
		        </button>
		        <button type="submit" class="btn vehicle-option ${selectedCategory eq '14 Seater' ? 'active' : ''}" onclick="setCategory('14 Seater')">
		            <img src="../Images/14 seater.png" alt="14 Seater" class="category-icon"> 14 Seater
		        </button>
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
