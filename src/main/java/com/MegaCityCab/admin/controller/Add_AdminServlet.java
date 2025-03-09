package com.MegaCityCab.admin.controller;

import com.MegaCityCab.admin.model.Add_Admin;
import com.MegaCityCab.admin.dao.Add_AdminDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/Admin/Add_AdminServlet")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5)  // Max file size 5MB
public class Add_AdminServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        String avatar = request.getParameter("avatar");

        // Validate if name is null or empty
        if (name == null || name.trim().isEmpty()) {
            request.setAttribute("message", "Error: Name field cannot be empty!");
            request.getRequestDispatcher("/Admin/Error.jsp").forward(request, response);
            return;  // Stop execution if validation fails
        }
        
        
        int id = 0; // Assuming cabId is auto-generated by the database
        
        Add_Admin admin = new Add_Admin(id, name, username, password, role, avatar);

        // Use DAO to save the admin
        Add_AdminDAO adminDAO = new Add_AdminDAO();
        boolean isSuccess = adminDAO.saveAdmin(admin);

        // Set message attribute and forward back to Add_new_Admin.jsp
        if (isSuccess) {
            request.setAttribute("message", "Admin created successfully!");
            request.setAttribute("status", "success");
            
            request.getRequestDispatcher("/Admin/Add_new_Admin.jsp").forward(request, response);
            
        } else {
            request.setAttribute("message", "Error in creating admin!");
            request.setAttribute("status", "error");
        }

        
    }
}
