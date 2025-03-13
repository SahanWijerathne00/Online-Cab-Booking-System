package com.MegaCityCab.user.controller;

import com.MegaCityCab.user.dao.CabDAO;
import com.MegaCityCab.user.model.CabDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/user/CabDetailsServlet")
public class CabDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CabDAO cabDAO;

    @Override
    public void init() {
        cabDAO = new CabDAO(); // Initialize the DAO
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cabIdStr = request.getParameter("cabId");
        if (cabIdStr == null || cabIdStr.trim().isEmpty()) {
            request.setAttribute("error", "Invalid Cab ID.");
            request.getRequestDispatcher("/Views/User/U_view_cabs1.jsp").forward(request, response);
            return;
        }

        int cabId = Integer.parseInt(cabIdStr);
        CabDetails cabDetails = cabDAO.getCabDetails(cabId);


        if (cabDetails == null) {
        	
            request.setAttribute("error", "Cab details not found.");
            request.getRequestDispatcher("/Views/User/U_view_cabs2.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession();
        session.setAttribute("cabCategory", cabDetails.getCategory());
        session.setAttribute("cabDescription", cabDetails.getDescription());
        session.setAttribute("cabModel", cabDetails.getModel());
        session.setAttribute("cabRate", cabDetails.getRate());
        session.setAttribute("cabFare", cabDetails.getFare());
        session.setAttribute("driverName", cabDetails.getDriverName());
        session.setAttribute("driverContact", cabDetails.getContact());

        response.sendRedirect(request.getContextPath() + "/Views/User/U_view_cabs.jsp");
    }
}
