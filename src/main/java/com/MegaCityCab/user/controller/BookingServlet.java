package com.MegaCityCab.user.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/user/BookingServlet")
public class BookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve booking details from form submission
        String cabModel = request.getParameter("cabModel");
        String cabCategory = request.getParameter("cabCategory");
        String pickupLocation = request.getParameter("pickupLocation");
        String dropLocation = request.getParameter("dropLocation");
        String bookingTime = request.getParameter("bookingTime");
        String regid = request.getParameter("regid");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String distance = request.getParameter("distance");
        String fare = request.getParameter("fare");  
        String rate = request.getParameter("rate");
        String dname = request.getParameter("dname");
        String driverContact = request.getParameter("driverContact");
        String plate1 = request.getParameter("plate");
        String driverAddress = request.getParameter("driverAddress");
        
        System.out.println(regid);
        System.out.println(dname);
        System.out.println(driverContact);
        

        // Validate required fields
        if (cabModel == null || cabCategory == null || pickupLocation == null || dropLocation == null || bookingTime == null || name == null || phone == null || fare == null || rate == null || distance == null) {
            request.setAttribute("error", "All required fields must be filled.");
            request.getRequestDispatcher("/Views/User/U_view_cabs.jsp").forward(request, response);
            return;
        }

        // Format the booking time to add a space between date and time
        DateTimeFormatter inputFormatter = DateTimeFormatter.ISO_LOCAL_DATE_TIME;
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        
        LocalDateTime dateTime = LocalDateTime.parse(bookingTime, inputFormatter);
        String formattedBookingTime = dateTime.format(outputFormatter);
        
        // Print formatted booking time for debugging
        System.out.println("Formatted Booking Time: " + formattedBookingTime);

        // Remove non-numeric characters from distance (e.g., " km")
        distance = distance.replaceAll("[^0-9.]", "");

        // Calculate price: fare + rate * distance
        double fareValue = Double.parseDouble(fare);
        double rateValue = Double.parseDouble(rate);
        double distanceValue = Double.parseDouble(distance);
        double price = fareValue + (rateValue * distanceValue);

        // Store booking details in session
        HttpSession session = request.getSession();
        session.setAttribute("cabModel", cabModel);
        session.setAttribute("cabCategory", cabCategory);
        session.setAttribute("pickupLocation", pickupLocation);
        session.setAttribute("dropLocation", dropLocation);
        session.setAttribute("bookingTime", formattedBookingTime);  // Store formatted booking time
        session.setAttribute("regid", regid);
        session.setAttribute("name", name);
        session.setAttribute("phone", phone);
        session.setAttribute("email", email);
        session.setAttribute("distance", distance);
        session.setAttribute("price", price); 
        session.setAttribute("fare", fare); 
        session.setAttribute("rate", rate); 
        session.setAttribute("dname", dname);
        session.setAttribute("driverContact", driverContact);
        session.setAttribute("plate", plate1);
        session.setAttribute("driverAddress", driverAddress);
        
        // Redirect to checkout page
        response.sendRedirect(request.getContextPath() + "/Views/User/U_Checkout.jsp");
    }
}
