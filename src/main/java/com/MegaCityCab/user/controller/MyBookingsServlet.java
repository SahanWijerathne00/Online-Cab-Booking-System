package com.MegaCityCab.user.controller;

import com.MegaCityCab.user.dao.MyBookingDAO;
import com.MegaCityCab.user.model.MyBooking;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/User/MyBookingsServlet")
public class MyBookingsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    public void init() {
       new MyBookingDAO();
    }

    // Handle GET request to fetch bookings for a specific user
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Get userId from session (assumed to be set during login)
            int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
            

            // Fetch bookings for this user
            List<MyBooking> bookings = MyBookingDAO.getBookingsByUserId(userId);

            // Set the bookings as a request attribute
            request.setAttribute("bookings", bookings);

            // Forward the request to the JSP to display the data
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Views/User/Mybooking.jsp");
            dispatcher.forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect("error.jsp");  // Redirect to an error page if something goes wrong
        }
    }
}
