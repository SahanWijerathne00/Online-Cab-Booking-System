package com.MegaCityCab.user.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.MegaCityCab.user.dao.BookingDAO;
import com.MegaCityCab.user.model.Booking;

@WebServlet("/user/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get data from the session
        String customerName = (String) request.getSession().getAttribute("name");
        String customerEmail = (String) request.getSession().getAttribute("email");
        String customerPhone = (String) request.getSession().getAttribute("phone");
        String pickupLocation = (String) request.getSession().getAttribute("pickupLocation");
        String dropLocation = (String) request.getSession().getAttribute("dropLocation");
        String cabCategory = (String) request.getSession().getAttribute("cabCategory");
        String cabModel = (String) request.getSession().getAttribute("cabModel");
        String bookingTime = (String) request.getSession().getAttribute("bookingTime");
        
        // Get payment method from request
        String paymentMethod = request.getParameter("paymentMethod");

        // Get fare and amount from session
        String customerId = (String) request.getSession().getAttribute("regid");
        String plateNumber = (String) request.getSession().getAttribute("plate");
        String driverName = (String) request.getSession().getAttribute("dname");
        String driverContact= (String) request.getSession().getAttribute("driverContact");
        String driverAddress = (String) request.getSession().getAttribute("driverAddress");

        // Initialize amount
        double amount = 0;

        // Get price from session and handle potential null value
        Object priceObj = request.getSession().getAttribute("price");
        if (priceObj != null) {
            try {
                amount = (Double) priceObj;  // Cast the object to Double
            } catch (ClassCastException e) {
                e.printStackTrace();
                request.setAttribute("error", "Invalid amount value.");
                request.getRequestDispatcher("/Views/User/U_Checkout1.jsp").forward(request, response);
                return;
            }
        } else {
            // If price is not set, handle the error by redirecting or setting an error message
            request.setAttribute("error", "Amount is missing from session. Please try again.");
            request.getRequestDispatcher("/Views/User/U_Checkout2.jsp").forward(request, response);
            return;
        }
        
        System.out.println(customerName);
        System.out.println(customerEmail);
        System.out.println(customerPhone);
        System.out.println(pickupLocation);
        System.out.println(dropLocation);
        System.out.println(cabCategory);
        System.out.println(cabModel);
        System.out.println(bookingTime);
        System.out.println(paymentMethod);
        
        System.out.println(customerId);
        System.out.println(plateNumber);
        System.out.println(amount);

        // Ensure payment method is selected
        if (paymentMethod == null || paymentMethod.isEmpty()) {
            request.setAttribute("error", "Please select a payment method.");
            request.getRequestDispatcher("/Views/User/U_Checkout3.jsp").forward(request, response);
            return;
        }

        // Create Booking object
        Booking booking = new Booking(customerId, customerName, customerEmail, customerPhone, pickupLocation, dropLocation,
                                      cabCategory, cabModel, plateNumber, bookingTime, paymentMethod, amount, driverName, driverContact, driverAddress);

        // Use DAO to save the booking
        BookingDAO bookingDAO = new BookingDAO();
        boolean isSaved = bookingDAO.saveBooking(booking);

        if (isSaved) {
            request.getRequestDispatcher("/Views/User/Feedback.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "An error occurred while saving your booking. Please try again.");
            request.getRequestDispatcher("/Views/User/U_Checkout4.jsp").forward(request, response);
        }
    }
}
