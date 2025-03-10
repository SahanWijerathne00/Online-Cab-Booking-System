package com.MegaCityCab.admin.controller;

import jakarta.servlet.RequestDispatcher;
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
	        // Successful login, set success message and redirect to the next page with a message
	        request.setAttribute("loginSuccess", true);
        	response.sendRedirect(request.getContextPath() + "/Views/Admin/A_Homepage.jsp");
	        request.getRequestDispatcher("A_Login.jsp").forward(request, response);
	    } else {
	        // Invalid credentials, forward to the login page with an error message
	        request.setAttribute("errorMessage", "Invalid username or password!");
	        request.getRequestDispatcher("A_Login.jsp").forward(request, response);
	    }
	}

}

