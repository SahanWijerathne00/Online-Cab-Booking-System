package com.MegaCityCab.admin.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.MegaCityCab.admin.dao.Add_AdminDAO;
import com.MegaCityCab.admin.model.Add_Admin;

@WebServlet("/Admin/Edit_AdminServlet")
public class Edit_AdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private Add_AdminDAO adminDAO = new Add_AdminDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");

        // Check if id is provided and valid
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect("error1.jsp?message=Invalid Admin ID");
            return;
        }

        try {
            int id = Integer.parseInt(idParam);  // Parse ID to integer

            // Get the admin by id
            Add_Admin admin = adminDAO.getAdminById(id);

            if (admin != null) {
                // Set the admin details as request attributes
                request.setAttribute("admin", admin);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/Views/Admin/Edit_Admin.jsp");
                dispatcher.forward(request, response);
            } else {
                response.sendRedirect("error2.jsp?message=Admin not found");
            }
        } catch (NumberFormatException e) {
            // Catch invalid number format (non-integer ID)
            response.sendRedirect("error3.jsp?message=Invalid Admin ID Format");
        }
    }
}

