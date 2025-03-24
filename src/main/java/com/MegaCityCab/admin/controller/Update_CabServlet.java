package com.MegaCityCab.admin.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
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
            // Retrieve the cab ID and other form data
            String idParam = request.getParameter("id"); // This gets the "id" parameter as a String
            int id = 0;

            if (idParam != null && !idParam.trim().isEmpty()) {
                try {
                    id = Integer.parseInt(idParam); // This converts the String to an int
                } catch (NumberFormatException e) {
                    // Handle the exception if parsing fails
                    e.printStackTrace();
                    response.sendRedirect("error3.jsp");  // Redirect to an error page if parsing fails
                    return;
                }
            } else {
                // Handle the case where the parameter is missing or empty
                response.sendRedirect("error4.jsp");  // Redirect to an error page if "id" is missing or empty
                return;
            }

            // Retrieving other parameters from the form
            String regNumber = request.getParameter("regNumber");
            String category = request.getParameter("category");
            String model = request.getParameter("model");
            String plateNumber = request.getParameter("plateNumber");
            String fare = request.getParameter("fare");
            String driverName = request.getParameter("driverName");
            String driverLicense = request.getParameter("driverLicense");
            String driverContact = request.getParameter("driverContact");
            String driverAddress = request.getParameter("driverAddress");

            // Handle the image file upload
            Part imagePart = request.getPart("cabImage");
            String imagePath = null;

            if (imagePart != null && imagePart.getSize() > 0) {
                // Generate a unique file name
                String fileName = UUID.randomUUID().toString() + Paths.get(imagePart.getSubmittedFileName()).getFileName();
                String uploadDir = getServletContext().getRealPath("/") + "uploads";
                File uploadDirFile = new File(uploadDir);

                if (!uploadDirFile.exists()) {
                    uploadDirFile.mkdirs(); // Create directory if it doesn't exist
                }

                imagePath = uploadDir + "/" + fileName;
                imagePart.write(imagePath); // Save the file to the server
            } else {
                // If no new image, retain the old image
                imagePath = request.getParameter("oldImage");  // Pass the old image path if no new image is uploaded
            }

            // Create a new Add_Cab object with the updated data
            Add_Cab cab = new Add_Cab(
                id,
                category,
                regNumber,
                model,
                plateNumber,
                fare,
                driverName,
                driverLicense,
                driverContact,
                driverAddress,
                imagePath
            );

            // Use the DAO to update the cab in the database
            boolean isUpdated = cabDAO.updateCab(cab);

            // Redirect based on success or failure
            if (isUpdated) {
                response.sendRedirect(request.getContextPath() + "/Admin/Manage_CabsServlet");  // Redirect to manage cabs page
            } else {
                response.sendRedirect("error1.jsp");  // Handle error case
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error2.jsp");  // Handle any exceptions
        }
    }
}
