package com.MegaCityCab.user.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

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
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String distance = request.getParameter("distance");

        // Validate required fields
        if (cabModel == null || cabCategory == null || pickupLocation == null || dropLocation == null || bookingTime == null || name == null || phone == null) {
            request.setAttribute("error", "All required fields must be filled.");
            request.getRequestDispatcher("/Views/User/U_view_cabs.jsp").forward(request, response);
            return;
        }

        // Store booking details in session
        HttpSession session = request.getSession();
        session.setAttribute("cabModel", cabModel);
        session.setAttribute("cabCategory", cabCategory);
        session.setAttribute("pickupLocation", pickupLocation);
        session.setAttribute("dropLocation", dropLocation);
        session.setAttribute("bookingTime", bookingTime);
        session.setAttribute("name", name);
        session.setAttribute("phone", phone);
        session.setAttribute("email", email);
        session.setAttribute("distance", distance);
        session.setAttribute("price", "price"); // Example price

        // Redirect to checkout page
        response.sendRedirect(request.getContextPath() + "/Views/User/U_Checkout.jsp");
    }
}
