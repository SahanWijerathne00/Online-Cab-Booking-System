package com.MegaCityCab.admin.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import com.MegaCityCab.admin.dao.ViewBookingDAO;  // Corrected import for ViewBookingDAO
import com.MegaCityCab.admin.model.View_Booking;  // Corrected import for Booking model

@WebServlet("/Admin/ViewBookingServlet")
public class ViewBookingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ViewBookingDAO viewBookingDAO;

    public void init() {
        viewBookingDAO = new ViewBookingDAO(); 
    }

    // Handle GET request to display all bookings
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch all bookings for display in the table
        List<View_Booking> bookings = viewBookingDAO.getAllBookings();
        request.setAttribute("bookings", bookings);  // Set the list of bookings for the table

        // Forward to the JSP page for display
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Views/Admin/ViewBooking.jsp");
        dispatcher.forward(request, response);
    }
}
