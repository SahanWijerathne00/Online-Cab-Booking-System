package com.MegaCityCab.admin.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.MegaCityCab.user.dao.UserDAO;
import com.MegaCityCab.user.model.User;

@WebServlet("/Admin/Manage_UsersServlet")
public class Manage_UsersServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    UserDAO userDAO = new UserDAO();
	    List<User> users = userDAO.getAllUsers(); // Fetch users

	    request.setAttribute("users", users);
	    request.getRequestDispatcher("/Views/Admin/Manage_Users.jsp").forward(request, response);
	}

}
