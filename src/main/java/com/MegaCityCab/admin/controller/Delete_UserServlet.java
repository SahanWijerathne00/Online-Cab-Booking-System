package com.MegaCityCab.admin.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.MegaCityCab.admin.dao.UserDAO;

@WebServlet("/Admin/Delete_UserServlet")
public class Delete_UserServlet extends HttpServlet {
   
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userIdParam = request.getParameter("userId");
        
        if (userIdParam != null) {
            int userId = Integer.parseInt(userIdParam);
            UserDAO userDAO = new UserDAO();
            
            boolean success = userDAO.deleteUser(userId);
            if (success) {
                // Set success message in the session
                request.getSession().setAttribute("deleteMessage", "User deleted successfully!");
            } else {
                // Set failure message in the session
                request.getSession().setAttribute("deleteMessage", "Failed to delete user.");
            }
        } else {
            // Set error message in the session if no userId is found
            request.getSession().setAttribute("deleteMessage", "Invalid user ID.");
        }

        // Redirect to the user management page to show the message
        response.sendRedirect(request.getContextPath() + "/Admin/Manage_UsersServlet");
    }
}
