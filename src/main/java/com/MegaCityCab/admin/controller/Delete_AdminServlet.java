package com.MegaCityCab.admin.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.MegaCityCab.admin.dao.Add_AdminDAO;

@WebServlet("/Admin/Delete_AdminServlet")
public class Delete_AdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private Add_AdminDAO adminDAO = new Add_AdminDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the admin ID from the request parameter
        int id = Integer.parseInt(request.getParameter("id"));
        
        // Delete the admin using the DAO
        boolean isDeleted = adminDAO.deleteAdmin(id);
        
        if (isDeleted) {
        	 response.sendRedirect("Manage_AdminsServlet?message=Cab deleted successfully.");
        } else {
            response.sendRedirect("error.jsp"); // Redirect to error page if deletion fails
        }
    }
}

