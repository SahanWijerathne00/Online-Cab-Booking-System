package com.MegaCityCab.admin.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.MegaCityCab.admin.dao.AdminDAO;
import com.MegaCityCab.admin.model.Admin;

@WebServlet("/Admin/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        AdminDAO adminDAO = new AdminDAO();
        Admin admin = adminDAO.validateAdmin(username, password);

        if (admin != null) {
            // Successful login, set success message and forward back to the login page with a success message
            request.setAttribute("loginSuccess", true);
            request.setAttribute("message", "Login Successfull.......! ");
            request.setAttribute("status", "success");

            // Forward to the same login page (admin dashboard page)
            request.getRequestDispatcher("/Views/Admin/A_Login.jsp").forward(request, response);
        } else {
            // Invalid credentials, forward to the login page with an error message
            request.setAttribute("loginSuccess", false);
            request.setAttribute("message", "Invalid username or password.......!");
            request.setAttribute("status", "error");

            request.getRequestDispatcher("/Views/Admin/A_Login.jsp").forward(request, response);
        }
    }
}



