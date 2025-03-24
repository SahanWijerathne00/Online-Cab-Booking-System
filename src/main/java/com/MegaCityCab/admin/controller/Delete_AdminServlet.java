package com.MegaCityCab.admin.controller;

import com.MegaCityCab.admin.dao.Add_AdminDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/Admin/Delete_AdminServlet")
public class Delete_AdminServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String adminIdParam = request.getParameter("id");
        
        if (adminIdParam != null) {
            int adminId = Integer.parseInt(adminIdParam);
            Add_AdminDAO adminDAO = new Add_AdminDAO();

            boolean success = adminDAO.deleteAdmin(adminId); // Assume deleteAdmin handles the deletion logic

            if (success) {
                // Set success message in the session
                request.getSession().setAttribute("deleteMessage", "Admin deleted successfully!");
            } else {
                // Set failure message in the session
                request.getSession().setAttribute("deleteMessage", "Failed to delete admin.");
            }
        }

        // Redirect back to Manage_AdminsServlet to display the message
        response.sendRedirect(request.getContextPath() + "/Admin/Manage_AdminsServlet");
    }
}
