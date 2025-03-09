package com.MegaCityCab.user.controller;

import com.MegaCityCab.user.dao.UserDAO;
import com.MegaCityCab.user.model.User;
import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/User/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Get form data
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String address = request.getParameter("address");
        String gender = request.getParameter("gender");
        String nic = request.getParameter("nic");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Create User object
        User user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setAddress(address);
        user.setGender(gender);
        user.setNic(nic);
        user.setPhoneNumber(phoneNumber);
        user.setEmail(email);
        user.setUsername(username);
        user.setPassword(password);
        
        HttpSession session = request.getSession();

        // Validate password length
        if (password.length() > 6) {
            session.setAttribute("message", "Password must not exceed 6 characters.");
            response.sendRedirect(request.getContextPath() + "/Views/User/U_Register.jsp");
            return;
        }

        // Call DAO to register user
        UserDAO userDAO = new UserDAO();
        boolean isUserRegistered = userDAO.registerUser(user);

        // Set success or failure message
        String message = isUserRegistered ? "Registration successful!" : "Registration failed! Please try again.";
        request.setAttribute("message", message);

        // Forward back to U_Register.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Views/User/U_Register.jsp");
        dispatcher.forward(request, response);
        
        // Clear the message after forwarding to prevent showing it on refresh
        request.removeAttribute("message");
    }
}
