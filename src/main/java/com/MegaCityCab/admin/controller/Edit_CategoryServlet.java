package com.MegaCityCab.admin.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.MegaCityCab.admin.dao.Add_CategoryDAO;
import com.MegaCityCab.admin.model.*;


@WebServlet("/Admin/Edit_CategoryServlet")
public class Edit_CategoryServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;
	private Add_CategoryDAO categoryDAO = new Add_CategoryDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");

        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect("error.jsp"); // Redirect to an error page if the id is missing
            return;
        }

        try {
            int id = Integer.parseInt(idParam);
            Add_Category category = categoryDAO.getCategoryById(id); // Fetch the category by ID
            


            if (category != null) {
                // Set the category object as a request attribute
                request.setAttribute("category", category);
                RequestDispatcher dispatcher = request.getRequestDispatcher("Add_CategoryServlet");
                dispatcher.forward(request, response); // Forward to the JSP to render the modal
                
            }else {
                response.sendRedirect("error.jsp"); // Redirect to an error page if the category is not found
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("error14.jsp"); // Handle invalid ID format
        }
    }
}
