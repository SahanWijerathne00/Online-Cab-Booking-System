package com.MegaCityCab.admin.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.UUID;

import com.MegaCityCab.admin.dao.Add_CabDAO;
import com.MegaCityCab.admin.model.Add_Cab;

@WebServlet("/Admin/Update_CabServlet")
public class Update_CabServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private Add_CabDAO cabDAO = new Add_CabDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Get updated data from the form
           String idParam = request.getParameter("id");

           

            // Parse the ID safely
            int id = 0;
            try {
                id = Integer.parseInt(idParam);
            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp?message=Invalid ID Format");
                return;
            }

            // Retrieve other form data
            String regNumber = request.getParameter("regNumber");
            String category = request.getParameter("category");
            String plateNumber = request.getParameter("plateNumber");
            String fare = request.getParameter("fare");
            String driverName = request.getParameter("driverName");
            String driverLicense = request.getParameter("driverLicense");
            String driverContact = request.getParameter("driverContact");
            String driverAddress = request.getParameter("driverAddress");
            String status = request.getParameter("status");

            // Handle the image file upload
            String imagePath = handleFileUpload(request);

            // Create a new Add_Cab object with the updated data
            Add_Cab cab = new Add_Cab(id, regNumber, category, plateNumber, fare, driverName, driverLicense, driverContact, driverAddress, imagePath, status);

            // Use the DAO to update the cab in the database
            boolean isUpdated = cabDAO.updateCab(cab);

            // Redirect to the appropriate page based on success/failure
            if (isUpdated) {
                response.sendRedirect("success.jsp");  // Redirect to a success page if the update is successful
            } else {
                response.sendRedirect("error1.jsp");    // Redirect to an error page if the update fails
            }
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            response.sendRedirect("error2.jsp?message=Invalid ID");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error3.jsp");
        }
    }

    private String handleFileUpload(HttpServletRequest request) throws IOException, ServletException {
        // Get the image file from the request
        Part filePart = request.getPart("cabImage"); // Assuming "cabImage" is the name attribute of the input
        if (filePart != null && filePart.getSize() > 0) {
            // Generate a unique file name to avoid collisions
            String fileName = UUID.randomUUID().toString() + "_" + Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            
            // Define the path where the image will be stored
            String savePath = getServletContext().getRealPath("/") + "images/cabs/" + fileName;

            // Save the uploaded file to the server
            filePart.write(savePath);

            // Return the relative image path to store in the database
            return "resources/Images/cabs/" + fileName;
        } else {
            // If no image is uploaded, return the existing image path (you might want to keep the old image)
            return request.getParameter("existingImage"); // Ensure that the current image is available in the form if no new image is uploaded
        }
    }
}
