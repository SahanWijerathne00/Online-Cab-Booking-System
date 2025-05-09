package com.MegaCityCab.admin.controller;

import com.MegaCityCab.admin.model.Add_Admin;
import com.MegaCityCab.admin.dao.Add_AdminDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

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
        Part avatarPart = request.getPart("avatar"); // Get the file part for the avatar

        // Validate if name is null or empty
        if (name == null || name.trim().isEmpty()) {
            request.setAttribute("message", "Error: Name field cannot be empty!");
            request.getRequestDispatcher("/Admin/Error.jsp").forward(request, response);
            return;  // Stop execution if validation fails
        }

        // Handle avatar (profile picture) file upload
        String avatar = null;  // Default to null if no file is uploaded
        if (avatarPart != null && avatarPart.getSize() > 0) {
            // Get file name
            String fileName = Paths.get(avatarPart.getSubmittedFileName()).getFileName().toString();
            // Set the path to save the file (ensure the directory exists)
            String savePath = getServletContext().getRealPath("/") + "uploads" + File.separator + fileName;
            
            // Create a new file and save the avatar
            File fileSaveDir = new File(savePath);
            fileSaveDir.getParentFile().mkdirs(); // Create directories if they don't exist
            avatarPart.write(savePath); // Write the file to disk
            
            avatar = "uploads" + File.separator + fileName;  // Store the relative path to avatar in the database
        }

        // Assuming admin ID is auto-generated by the database
        int id = 0;

        // Create the admin object with the avatar file path
        Add_Admin admin = new Add_Admin(id, name, username, password, role, avatar);

        // Use DAO to save the admin
        Add_AdminDAO adminDAO = new Add_AdminDAO();
        boolean isSuccess = adminDAO.saveAdmin(admin);

        // Set success or failure message in session and forward accordingly
        if (isSuccess) {
            // Store success message in session
            request.getSession().setAttribute("message", "Admin created successfully!");
            request.getSession().setAttribute("status", "success");
        } else {
            // Store error message in session
            request.getSession().setAttribute("message", "Error in creating admin!");
            request.getSession().setAttribute("status", "error");
        }

        // Redirect to the Add_new_admin.jsp (or any page where you display the success message)
        response.sendRedirect(request.getContextPath() + "/Views/Admin/Add_new_admin.jsp");
    }
}
