package com.MegaCityCab.user.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.MegaCityCab.user.dao.FeedbackDAO;
import com.MegaCityCab.user.model.Feedback;

@WebServlet("/user/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve feedback details from the form submission
        String rating = request.getParameter("rating");
        String message = request.getParameter("message");
        String regid = request.getParameter("regid");
        String name = request.getParameter("name");

        // Ensure rating and message are not empty
        if (rating == null || message == null || regid == null || name == null) {
            response.sendRedirect(request.getContextPath() + "/Views/User/ThankYou.jsp?status=error");
            return;
        }

        // Create Feedback object and save it to the database
        Feedback feedback = new Feedback(regid, name, Integer.parseInt(rating), message);
        FeedbackDAO feedbackDAO = new FeedbackDAO();

        boolean isSaved = feedbackDAO.saveFeedback(feedback);

        // Redirect to the thank you page with a status parameter
        if (isSaved) {
            response.sendRedirect(request.getContextPath() + "/Views/User/Feedback.jsp?status=success");
        } else {
            response.sendRedirect(request.getContextPath() + "/Views/User/Feedback.jsp?status=error");
        }
    }
}
