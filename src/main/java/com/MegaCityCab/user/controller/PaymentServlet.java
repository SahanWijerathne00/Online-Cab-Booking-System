package com.MegaCityCab.user.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/user/PaymentServlet")
public class PaymentServlet extends HttpServlet {
    
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String paymentMethod = request.getParameter("paymentMethod");
        HttpSession session = request.getSession();
        session.setAttribute("paymentMethod", paymentMethod);

        if ("card".equals(paymentMethod)) {
            // Show card modal (handled in JSP via JavaScript)
            session.setAttribute("showCardModal", "true");
        } else {
            
        }

        response.sendRedirect("U_Checkout.jsp");
    }
}
