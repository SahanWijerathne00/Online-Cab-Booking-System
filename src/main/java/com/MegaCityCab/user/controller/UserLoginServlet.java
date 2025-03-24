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
            session.setAttribute("userRegisterId", user.getRegisterId());
            session.setAttribute("userUsername", user.getUsername());
            session.setAttribute("userPassword", user.getPassword());
            session.setAttribute("userGender", user.getGender());
            session.setAttribute("userNic", user.getNic());
            session.setAttribute("userId", user.getRegisterId());
            
            

            // Do not redirect immediately; forward to the login page so that the modal can show
            request.getRequestDispatcher("/Views/User/U_Login.jsp").forward(request, response);
        } else {
            // Failed login
            session.setAttribute("message", "Invalid username or password.");
            request.getRequestDispatcher("/Views/User/U_Login.jsp").forward(request, response); // Forward to the login page
        }
    }
}
