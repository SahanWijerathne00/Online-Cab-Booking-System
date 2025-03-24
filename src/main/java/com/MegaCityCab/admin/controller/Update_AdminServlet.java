package com.MegaCityCab.admin.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import com.MegaCityCab.admin.dao.Add_AdminDAO;
import com.MegaCityCab.admin.model.Add_Admin;

@WebServlet("/Admin/Update_AdminServlet")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5)  // Max file size 5MB for avatar
public class Update_AdminServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private Add_AdminDAO adminDAO = new Add_AdminDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        Part avatarPart = request.getPart("avatar"); // Get the file part for the avatar
        if (idParam != null) {
            try {
                int id = Integer.parseInt(idParam);  // Parse the ID to an integer
                Add_Admin admin = new Add_Admin(id, name, username, password, role, null); // Create Add_Admin object without avatar

                // Handle avatar (profile picture) file upload
                if (avatarPart != null && avatarPart.getSize() > 0) {
                    // Save the file and store its path in the database
                    String fileName = Paths.get(avatarPart.getSubmittedFileName()).getFileName().toString();
                    String savePath = getServletContext().getRealPath("/") + "uploads" + File.separator + fileName;
                    File fileSaveDir = new File(savePath);
                    fileSaveDir.getParentFile().mkdirs(); // Create directories if they don't exist
                    avatarPart.write(savePath); // Write the file to disk

                    // Set avatar path in the admin object
                    admin.setAvatar("uploads" + File.separator + fileName);  // Save relative file path in database
                }

                // Update admin in the database
                boolean isUpdated = adminDAO.updateAdmin(admin, avatarPart);

                // Set success or error message in session and redirect
                if (isUpdated) {
                    request.getSession().setAttribute("message", "Admin updated successfully!");
                    request.getSession().setAttribute("status", "success");
                } else {
                    request.getSession().setAttribute("message", "Error updating admin!");
                    request.getSession().setAttribute("status", "error");
                }

                // Redirect back to the Edit Admin page with the success message
                response.sendRedirect(request.getContextPath() + "/Views/Admin/Edit_Admin.jsp?id=" + id);

            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/Admin/Manage_AdminsServlet");  // Redirect if ID format is invalid
            }
        }
    }
}
