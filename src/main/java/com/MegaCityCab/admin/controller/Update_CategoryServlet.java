package com.MegaCityCab.admin.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.MegaCityCab.admin.dao.Add_CategoryDAO;
import com.MegaCityCab.admin.model.Add_Category;


@WebServlet("/Admin/Update_CategoryServlet")
public class Update_CategoryServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private Add_CategoryDAO categoryDAO = new Add_CategoryDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get updated category data from the form
        int id = Integer.parseInt(request.getParameter("id"));
        String categoryName = request.getParameter("categoryName");
        String rate = request.getParameter("rate");
        String description = request.getParameter("description");
        String status = request.getParameter("status");

        // Create an Add_Category object with the updated data
        Add_Category category = new Add_Category(id, categoryName, rate, description, status);

        // Use the DAO to update the category in the database
        boolean isUpdated = categoryDAO.updateCategory(category);

        // Store the message in the session based on whether the update was successful
        if (isUpdated) {
            request.getSession().setAttribute("message", "Category updated successfully!");
            request.getSession().setAttribute("status", "success");
        } else {
            request.getSession().setAttribute("message", "Error updating category!");
            request.getSession().setAttribute("status", "error");
        }

        // Redirect to another servlet or JSP page after the update
        response.sendRedirect(request.getContextPath() + "/Admin/Add_CategoryServlet");
    }


}


