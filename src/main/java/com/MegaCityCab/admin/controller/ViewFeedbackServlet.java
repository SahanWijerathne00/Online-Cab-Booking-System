package com.MegaCityCab.admin.controller;

import com.MegaCityCab.admin.dao.FeedbackDAO;
import com.MegaCityCab.admin.model.Feedback;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/Admin/ViewFeedbackServlet")
public class ViewFeedbackServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FeedbackDAO feedbackDAO = null;
		try {
			feedbackDAO = new FeedbackDAO();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        List<Feedback> feedbacks = feedbackDAO.getAllFeedbacks();

        request.setAttribute("feedbacks", feedbacks);  // Set the feedback list as request attribute
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Views/Admin/ViewFeedbacks.jsp");
        dispatcher.forward(request, response);  // Forward the request to the JSP page
    }
}
