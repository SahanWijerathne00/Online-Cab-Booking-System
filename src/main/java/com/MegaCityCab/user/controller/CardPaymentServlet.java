package com.MegaCityCab.user.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/user/CardPaymentServlet")
public class CardPaymentServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String cardNumber = request.getParameter("cardNumber");
        String expiryDate = request.getParameter("expiryDate");
        String cvv = request.getParameter("cvv");

        HttpSession session = request.getSession();

        // Simulated card validation logic
        if (cardNumber.length() >= 12 && cvv.length() == 3) {
            session.setAttribute("paymentStatus", "Card Payment Successful!");
        } else {
            session.setAttribute("paymentStatus", "Invalid Card Details. Try again.");
        }

        response.sendRedirect("/Views/User/U_Checkout.jsp");
    }
}
