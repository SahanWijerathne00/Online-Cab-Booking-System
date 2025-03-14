package com.MegaCityCab.user.controller;

import com.MegaCityCab.user.dao.UserLoginDAO;
import com.MegaCityCab.user.model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/User/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserLoginDAO userLoginDAO = new UserLoginDAO();
        User user = userLoginDAO.validateUser(username, password);

        HttpSession session = request.getSession();

        if (user != null) {
            // Successful login
        	session.setAttribute("message", "Login successful!");
            session.setAttribute("userFirstName", user.getFirstName());
            session.setAttribute("userLastName", user.getLastName());
            session.setAttribute("userEmail", user.getEmail());
            session.setAttribute("userAddress", user.getAddress());
            session.setAttribute("userPhoneNumber", user.getPhoneNumber());
            
            response.sendRedirect(request.getContextPath() + "/Views/User/U_Homepage.jsp");
        } else {
            // Failed login
            session.setAttribute("message", "Invalid username or password.");
            response.sendRedirect(request.getContextPath() + "/Views/User/U_Login.jsp"); // Stay on login page
        }
    }
}
