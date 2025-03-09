package com.MegaCityCab.admin.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.MegaCityCab.admin.dao.Add_CabDAO;
import com.MegaCityCab.admin.model.Add_Cab;


@WebServlet("/Admin/Edit_CabsServlet")
public class Edit_CabsServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
	
	private Add_CabDAO CabDAO = new Add_CabDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");

        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect("error.jsp"); // Redirect to an error page if the id is missing
            return;
        }

        try {
            int id = Integer.parseInt(idParam);
            Add_Cab Cab = CabDAO.getCabId(id); // Fetch the category by ID
            


            if (Cab != null) {
                // Set the category object as a request attribute
                request.setAttribute("cab", Cab);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/Views/Admin/Edit_cab.jsp");
                dispatcher.forward(request, response); // Forward to the JSP to render the modal
                
            }else {
                response.sendRedirect("error.jsp"); // Redirect to an error page if the category is not found
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("error14.jsp"); // Handle invalid ID format
        }
    }
}
