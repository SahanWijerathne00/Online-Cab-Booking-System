package com.MegaCityCab.admin.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.MegaCityCab.admin.dao.Add_CategoryDAO;

@WebServlet("/Admin/Delete_CategoryServlet")
public class Delete_CategoryServlet extends HttpServlet {
   
	private static final long serialVersionUID = 1L;
	private Add_CategoryDAO categoryDAO = new Add_CategoryDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");

        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect("error2.jsp"); // Redirect to an error page if the id is missing
            return;
        }

        try {
            int id = Integer.parseInt(idParam);
            boolean isDeleted = categoryDAO.deleteCategoryById(id); // Call DAO method to delete the category

            if (isDeleted) {
                // Pass the message correctly in the redirect
                response.sendRedirect(request.getContextPath() + "/Admin/Add_CategoryServlet?message=Category deleted successfully.");
            } else {
                response.sendRedirect("error.jsp"); // Redirect to error page if deletion fails
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("error1.jsp"); // Handle invalid ID format
        }
    }
}

   