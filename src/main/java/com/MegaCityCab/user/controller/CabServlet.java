package com.MegaCityCab.user.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.MegaCityCab.user.dao.CabDAO;
import com.MegaCityCab.user.model.Cab;

import java.io.IOException;
import java.util.List;

@WebServlet("/user/CabServlet")
public class CabServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Process the request for showing available cabs and handle category-based filtering
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String category = request.getParameter("category"); // Get selected category from URL
        CabDAO cabDAO = new CabDAO();

        List<Cab> cabs;
        if (category != null && !category.isEmpty()) {
            cabs = cabDAO.getCabsByCategory(category); // Fetch cabs for the selected category
        } else {
            cabs = cabDAO.getAllCabs(); // Fetch all cabs if no category is selected
        }

        // Set available cabs and selected category as request attributes for the view
        request.setAttribute("cabs", cabs);
        request.setAttribute("selectedCategory", category); 
        request.getRequestDispatcher("/Views/User/U_view_cabs.jsp").forward(request, response);
    }
    
    
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pickupLocation = request.getParameter("pickupLocation");
        String dropoffLocation = request.getParameter("dropLocation");
        String distance = request.getParameter("distance");  // Ensure this retrieves value


        if (pickupLocation == null || pickupLocation.trim().isEmpty() ||
            dropoffLocation == null || dropoffLocation.trim().isEmpty()) {
            
            request.setAttribute("error", "Both Pickup and Dropoff locations are required.");
            request.getRequestDispatcher("/Views/User/U_Homepage.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession();
        session.setAttribute("pickupLocation", pickupLocation);
        session.setAttribute("dropLocation", dropoffLocation);
        session.setAttribute("distance", distance);

        response.sendRedirect(request.getContextPath() + "/Views/User/U_view_cabs.jsp");
    }

    }

