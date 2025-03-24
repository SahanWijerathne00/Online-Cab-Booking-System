package com.MegaCityCab.admin.controller;

import com.MegaCityCab.admin.model.Add_Admin;
import com.MegaCityCab.admin.dao.Add_AdminDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/Admin/Edit_AdminServlet")
public class Edit_AdminServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private Add_AdminDAO adminDAO = new Add_AdminDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");

        if (idParam != null) {
            try {
                int id = Integer.parseInt(idParam);  // Parse the ID to an integer
                Add_Admin admin = adminDAO.getAdminById(id);  // Fetch admin by ID
                if (admin != null) {
                    request.setAttribute("admin", admin);  // Set the admin data for the form
                    request.getRequestDispatcher("/Views/Admin/Edit_Admin.jsp").forward(request, response);  // Forward to the edit page
                } else {
                    response.sendRedirect(request.getContextPath() + "/Admin/Manage_AdminsServlet");  // Redirect if admin not found
                }
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/Admin/Manage_AdminsServlet");  // Redirect if ID format is invalid
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/Admin/Manage_AdminsServlet");  // Redirect if no ID is provided
        }
    }
}
