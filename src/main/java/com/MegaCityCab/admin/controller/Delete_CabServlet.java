 package com.MegaCityCab.admin.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.MegaCityCab.admin.dao.Add_CabDAO;

@WebServlet("/Admin/Delete_CabServlet")
public class Delete_CabServlet extends HttpServlet {
   
	private static final long serialVersionUID = 1L;
	
	private Add_CabDAO cabDAO = new Add_CabDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");

        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect("error2.jsp"); // Redirect to an error page if the id is missing
            return;
        }

        try {
            int id = Integer.parseInt(idParam);
            boolean isDeleted = cabDAO.deleteCabById(id); // Call DAO method to delete the category

            if (isDeleted) {
                // Redirect to the Manage Categories page with a success message
                response.sendRedirect("Manage_CabsServlet?message=Cab deleted successfully.");
            } else {
                response.sendRedirect("error.jsp"); // Redirect to error page if deletion fails
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("error1.jsp"); // Handle invalid ID format
        }
    }
}

