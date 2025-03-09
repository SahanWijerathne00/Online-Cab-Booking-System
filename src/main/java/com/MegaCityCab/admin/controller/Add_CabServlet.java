package com.MegaCityCab.admin.controller;

import com.MegaCityCab.admin.model.Add_Cab;
import com.MegaCityCab.admin.dao.Add_CabDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.UUID;

@WebServlet("/Admin/Add_CabServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 50     // 50MB
)
public class Add_CabServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve form data
            String category = request.getParameter("category");
            String regNumber = request.getParameter("regNumber");
            String model = request.getParameter("model");
            String plateNumber = request.getParameter("plateNumber");
            String fare = request.getParameter("fare");

            // Retrieve uploaded file part
            Part filePart = request.getPart("cabImage");
            String imagePath = null;

            if (filePart != null && filePart.getSize() > 0) {
                // Validate image file type
                String contentType = filePart.getContentType();
                if (!contentType.startsWith("image/")) {
                    request.setAttribute("message", "Invalid file type. Only images are allowed.");
                    request.setAttribute("status", "error");
                    request.getRequestDispatcher("/Views/Admin/Add_new_cab.jsp").forward(request, response);
                    return;
                }

                // Define the upload directory inside the webapp
                String uploadDir = getServletContext().getRealPath("/") + "resources/Images/cabs/";

                File uploadPath = new File(uploadDir);
                if (!uploadPath.exists()) {
                    uploadPath.mkdirs(); // Creates the directory if missing
                }

                // Create a unique file name
                String fileName = UUID.randomUUID().toString() + "_" + Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                filePart.write(uploadDir + fileName);

                // Save the relative image path
                imagePath = "resources/Images/cabs/" + fileName;
            }

            // Driver details
            String driverName = request.getParameter("driverName");
            String driverLicense = request.getParameter("driverLicense");
            String driverContact = request.getParameter("driverContact");
            String driverAddress = request.getParameter("driverAddress");

            // Validate required fields
            if (category == null || category.isEmpty() || 
                regNumber == null || regNumber.isEmpty() || 
                driverName == null || driverName.isEmpty()) {
                
                request.setAttribute("message", "Required fields are missing.");
                request.setAttribute("status", "error");
                request.getRequestDispatcher("/Views/Admin/Add_new_cab.jsp").forward(request, response);
                return;
            }

            // Create Add_Cab object and map values
            Add_Cab cab = new Add_Cab(0, category, regNumber, model, plateNumber, fare, imagePath, driverName, driverLicense, driverContact, driverAddress);

            // Save cab in database
            Add_CabDAO cabDAO = new Add_CabDAO();
            boolean isSuccess = cabDAO.saveCab(cab);

            if (isSuccess) {
                request.setAttribute("message", "Cab added successfully!");
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("message", "Error in adding cab!");
                request.setAttribute("status", "error");
            }

            // Forward to JSP
            request.getRequestDispatcher("/Views/Admin/Add_new_cab.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "An error occurred while processing your request.");
            request.setAttribute("status", "error");
            request.getRequestDispatcher("/Views/Admin/Add_new_cab.jsp").forward(request, response);
        }
    }
}
