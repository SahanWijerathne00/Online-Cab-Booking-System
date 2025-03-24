package com.MegaCityCab.admin.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.MegaCityCab.admin.dao.ViewBookingDAO;  

@WebServlet("/Admin/UpdateBookingStatusServlet")
public class UpdateBookingStatusServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ViewBookingDAO viewBookingDAO;

    public void init() {
        viewBookingDAO = new ViewBookingDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int bookingId = Integer.parseInt(request.getParameter("bookingId"));
            String newStatus = request.getParameter("newStatus");

            // Update the status of the booking in the database
            boolean isUpdated = viewBookingDAO.updateBookingStatus(bookingId, newStatus);

            if (isUpdated) {
                // Redirect to the ViewBookings page to see the updated status
                response.sendRedirect(request.getContextPath() + "/Admin/ViewBookingServlet");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error updating status");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing request");
        }
    }
}
