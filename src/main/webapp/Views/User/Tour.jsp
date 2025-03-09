<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script defer src="script.js"></script>
</head>
<body class="bg-light">
    <div class="container mt-4 p-3 bg-white shadow rounded" style="max-width: 600px;">
        <h3 class="text-center">Kangaroo Cabs</h3>
        <p class="text-center small">Sri Lanka’s Premier Cab Service</p>
        
        <div class="mb-2">
            <label class="form-label">Pick Location</label>
            <input type="text" class="form-control form-control-sm" id="pick-location" placeholder="Enter Pickup Location">
        </div>
        
        <div class="mb-2">
            <label class="form-label">Drop Location</label>
            <input type="text" class="form-control form-control-sm" id="drop-location" placeholder="Enter Drop Location">
        </div>
        
        <div class="row mb-2">
            <div class="col-6">
                <label class="form-label">Date</label>
                <input type="date" class="form-control form-control-sm" id="travel-date">
            </div>
            <div class="col-6">
                <label class="form-label">Days</label>
                <select class="form-select form-select-sm" id="travel-days">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                </select>
            </div>
        </div>
        
        <div class="row mb-2 text-center">
            <div class="col">
                <label class="form-label small">Adults</label>
                <div class="d-flex justify-content-center">
                    <button class="btn btn-outline-secondary btn-sm" onclick="changeCount('adults', -1)">-</button>
                    <span class="mx-2" id="adults">1</span>
                    <button class="btn btn-outline-secondary btn-sm" onclick="changeCount('adults', 1)">+</button>
                </div>
            </div>
            <div class="col">
                <label class="form-label small">Children</label>
                <div class="d-flex justify-content-center">
                    <button class="btn btn-outline-secondary btn-sm" onclick="changeCount('children', -1)">-</button>
                    <span class="mx-2" id="children">0</span>
                    <button class="btn btn-outline-secondary btn-sm" onclick="changeCount('children', 1)">+</button>
                </div>
            </div>
        </div>
        
        <div class="mb-2 p-2 border rounded">
            <label class="form-label small">Add Destinations</label>
            <div class="input-group input-group-sm">
                <input type="text" class="form-control" id="additional-destination" placeholder="Enter Destination">
                <button class="btn btn-warning btn-sm" onclick="addDestination()">Add</button>
            </div>
            <ul class="list-group mt-1" id="destination-list"></ul>
        </div>
        
        <div class="d-flex justify-content-between">
            <button class="btn btn-secondary btn-sm" onclick="goHome()">Home</button>
            <button class="btn btn-warning btn-sm" onclick="goNext()">Next</button>
        </div>
    </div>
</body>
</html>
