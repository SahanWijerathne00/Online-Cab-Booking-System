package com.MegaCityCab.user.controller;

import com.MegaCityCab.user.dao.UserDAO;
import com.MegaCityCab.user.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/User/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve user details from the form
        String registerId = request.getParameter("id");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");
        String gender = request.getParameter("gender");
        String nic = request.getParameter("nic");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Create a User object with the updated details
        User user = new User();
        user.setRegisterId(registerId);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setAddress(address);
        user.setPhoneNumber(phoneNumber);
        user.setGender(gender);
        user.setNic(nic);
        user.setUsername(username);
        user.setPassword(password);

        // Update the user profile in the database
        UserDAO userDAO = new UserDAO();
        boolean isUpdated = userDAO.updateUser(user);

        // Set success or error message based on the result
        if (isUpdated) {
            request.getSession().setAttribute("message", "Profile updated successfully!");
            request.getSession().setAttribute("status", "success");
        } else {
            request.getSession().setAttribute("message", "Error updating profile. Please try again.");
            request.getSession().setAttribute("status", "error");
        }

        // Forward the request to the UpdateProfile.jsp page (not redirecting)
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Views/User/UpdateProfile.jsp");
        dispatcher.forward(request, response);
    }
}
