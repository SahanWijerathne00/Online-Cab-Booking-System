package com.MegaCityCab.admin.dao;

import com.MegaCityCab.admin.model.Add_Cab;
import com.MegaCityCab.user.dao.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Add_CabDAO {

    // SQL Query to insert a new cab and driver details into the database
    private static final String INSERT_CAB_SQL = "INSERT INTO cab (category, reg_number, model, plate_number, fare, image, driver_name, license_number, contact, address) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    // Method to save the cab details into the database
    public boolean saveCab(Add_Cab cab) {
        boolean isSaved = false;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CAB_SQL)) {

            // Correct parameter alignment
            preparedStatement.setString(1, cab.getCategory());         // category
            preparedStatement.setString(2, cab.getRegNumber());        // reg_number
            preparedStatement.setString(3, cab.getModel());            // model
            preparedStatement.setString(4, cab.getPlateNumber());
            preparedStatement.setString(5, cab.getFare());// plate_number
            preparedStatement.setString(6, cab.getImage());            // image path
            preparedStatement.setString(7, cab.getDriverName());       // driver_name
            preparedStatement.setString(8, cab.getDriverLicense());    // license_number
            preparedStatement.setString(9, cab.getDriverContact());    // contact
            preparedStatement.setString(10, cab.getDriverAddress());    // address

            // Execute update
            int rowsAffected = preparedStatement.executeUpdate();
            isSaved = rowsAffected > 0;  // If rows are affected, return true

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isSaved;
    }

    
    // Query to fetch all cab data
    private static final String SELECT_ALL_CABS_SQL = "SELECT * FROM cab";

    public List<Add_Cab> getAllCabs() {
        List<Add_Cab> cabList = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CABS_SQL);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                Add_Cab cab = new Add_Cab(
                    resultSet.getInt("id"),
                    resultSet.getString("category"),
                    resultSet.getString("reg_number"),
                    resultSet.getString("model"),
                    resultSet.getString("plate_number"),
                    resultSet.getString("fare"),
                    resultSet.getString("image"),
                    resultSet.getString("driver_name"),
                    resultSet.getString("license_number"),
                    resultSet.getString("contact"),
                    resultSet.getString("address")
                );

                // Dynamically assign the status
                String status = (cab.getRegNumber() != null && cab.getDriverName() != null) ? "Active" : "Inactive";
                cab.setStatus(status);

                cabList.add(cab);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return cabList;
    }

    
    
    
    public Add_Cab getCabId(int id) {
        Add_Cab cab = null;
        String query = "SELECT * FROM cab WHERE id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, id);  
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    cab = new Add_Cab(
                        rs.getInt("id"),
                        rs.getString("category"),
                        rs.getString("reg_number"),
                        rs.getString("model"),
                        rs.getString("plate_number"),
                        rs.getString("fare"),
                        rs.getString("image"),
                        rs.getString("driver_name"),
                        rs.getString("license_number"),
                        rs.getString("contact"),
                        rs.getString("address")
                    );
                    // Dynamically set the status
                    String status = (cab.getRegNumber() != null && cab.getDriverName() != null) ? "Active" : "Inactive";
                    cab.setStatus(status);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cab;
    }

    
    

    // SQL Query to update an existing cab
    private static final String UPDATE_CAB_SQL = "UPDATE cab SET category = ?, reg_number = ?, model = ?, plate_number = ?, fare = ?,  driver_name = ?, license_number = ?, contact = ?, address = ? WHERE id = ?";

    // Method to update the cab details in the database
    public boolean updateCab(Add_Cab cab) {
        boolean isUpdated = false;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_CAB_SQL)) {

            statement.setString(1, cab.getCategory());
            statement.setString(2, cab.getRegNumber());
            statement.setString(3, cab.getModel());
            statement.setString(4, cab.getPlateNumber());
            statement.setString(5,  cab.getFare());
            statement.setString(6, cab.getDriverName());
            statement.setString(7, cab.getDriverLicense());
            statement.setString(8, cab.getDriverContact());
            statement.setString(9, cab.getDriverAddress());
            statement.setInt(10, cab.getid());  

            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                isUpdated = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Log error for debugging
        }
        return isUpdated;
    }
    
    
    
    public boolean deleteCabById(int id) {
        String query = "DELETE FROM cab WHERE id = ?";
        boolean isDeleted = false;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
                 
            statement.setInt(1, id);  // Set the category ID in the query

            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                isDeleted = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Log error for debugging
        }
        
        return isDeleted;
    }


}
