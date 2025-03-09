package com.MegaCityCab.admin.controller;

import com.MegaCityCab.admin.dao.Add_CabDAO;
import com.MegaCityCab.admin.model.Add_Cab;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/Admin/Manage_CabsServlet")
public class Manage_CabsServlet extends HttpServlet {

   
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    Add_CabDAO cabDAO = new Add_CabDAO();
	    List<Add_Cab> cabs = cabDAO.getAllCabs();
	    

	    request.setAttribute("cabs", cabs);

	    // Forward the request to the JSP page
	    request.getRequestDispatcher("/Views/Admin/Manage_Cabs.jsp").forward(request, response);
	}

}
