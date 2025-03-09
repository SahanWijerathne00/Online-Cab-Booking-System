package com.MegaCityCab.admin.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.MegaCityCab.admin.dao.Add_CategoryDAO;

@WebServlet("/Admin/Get_categoriesServlet")
public class Get_categoriesServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;
	
	private Add_CategoryDAO categoryDAO = new Add_CategoryDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch categories from database
        List<String> categories = categoryDAO.getCategories();

        // Set categories as a request attribute
        request.setAttribute("categories", categories);

        // Forward the request to the JSP (edit_cab.jsp)
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Views/Admin/Add_new_cab.jsp");
        dispatcher.forward(request, response);
    }
}

