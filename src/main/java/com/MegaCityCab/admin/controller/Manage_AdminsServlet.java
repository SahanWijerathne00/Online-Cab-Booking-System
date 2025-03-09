package com.MegaCityCab.admin.controller;

import com.MegaCityCab.admin.dao.Add_AdminDAO;
import com.MegaCityCab.admin.model.Add_Admin;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/Admin/Manage_AdminsServlet")
public class Manage_AdminsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Create the DAO object
        Add_AdminDAO adminDAO = new Add_AdminDAO();

        // Fetch all admins from the database
        List<Add_Admin> admins = adminDAO.getAllAdmins();

        // Set the admins data in the request scope
        request.setAttribute("admins", admins);

        // Forward the request to the JSP page
        request.getRequestDispatcher("/Views/Admin/Manage_admins.jsp").forward(request, response);
    }
}
