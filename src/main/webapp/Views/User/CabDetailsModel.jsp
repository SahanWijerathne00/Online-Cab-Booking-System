<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Available Vehicles</title>
</head>
<body>
	<div class="modal fade" id="moreDetailsModal" tabindex="-1" aria-labelledby="moreDetailsLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="moreDetailsLabel">Cab Details</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body">
	                <p><strong>Category:</strong> ${sessionScope.cabCategory}</p>
	                <p><strong>Description:</strong> ${sessionScope.cabDescription}</p>
	                <p><strong>Model:</strong> ${sessionScope.cabModel}</p>
	                <p><strong>Rate:</strong> ${sessionScope.cabRate} LKR/km</p>
	                <p><strong>Basic Fare:</strong> ${sessionScope.cabFare} LKR</p>
	                <p><strong>Driver:</strong> ${sessionScope.driverName}</p>
	                <p><strong>Contact:</strong> ${sessionScope.driverContact}</p>
	            </div>
	        </div>
	    </div>
	</div>
	
</body>
</html>