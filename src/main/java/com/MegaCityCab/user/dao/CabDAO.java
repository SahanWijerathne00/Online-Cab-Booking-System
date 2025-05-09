   package com.MegaCityCab.user.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.MegaCityCab.user.model.Cab;
import com.MegaCityCab.user.model.CabDetails;


public class CabDAO {

    // Method to get cabs by category
	private static final String SELECT_CABS_BY_CATEGORY = "SELECT * FROM cab WHERE category = ?";


    public List<Cab> getCabsByCategory(String category) {
        List<Cab> cabs = new ArrayList<>();
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CABS_BY_CATEGORY)) {

            preparedStatement.setString(1, category);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                cabs.add(mapCab(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cabs;
    }
    
    
    private Cab mapCab(ResultSet rs) throws SQLException {
        return new Cab(
                rs.getInt("id"),
                rs.getString("category"),
                rs.getString("reg_number"),
                rs.getString("model"),
                rs.getString("plate_number"),
                rs.getString("fare"),
                rs.getString("image"),
                rs.getString("driver_name"),
                rs.getString("license_number")
        		);
    }
    
    
    
    private static final String SELECT_ALL_CABS = "SELECT * FROM cab";
    
    public List<Cab> getAllCabs() {
        List<Cab> cabs = new ArrayList<>();
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CABS);
             ResultSet rs = preparedStatement.executeQuery()) {

            while (rs.next()) {
                cabs.add(mapCab(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cabs;
    }
    

   
    
    public CabDetails getCabDetails(int cabId) {
        CabDetails cabDetails = null;
        String query = "SELECT cab.id, cab.category, cab.reg_number, cab.model, cab.plate_number, cab.fare, cab.image, cab.driver_name, cab.license_number, cab.contact, cab.address, cab.status, category.category_name, category.rate, category.description " +
                       "FROM cab " +
                       "JOIN category ON cab.category = category.category_name " +
                       "WHERE cab.id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, cabId);
            ResultSet rs = preparedStatement.executeQuery();
            
            if (rs.next()) {
                cabDetails = new CabDetails(
                    rs.getInt("id"),
                    rs.getString("category_name"),
                    rs.getString("description"),
                    rs.getString("model"),
                    rs.getDouble("rate"),
                    rs.getDouble("fare"),
                    rs.getString("driver_name"),
                    rs.getString("contact"),
                    rs.getString("image"),
                    rs.getString("license_number"),          
                    rs.getString("plate_number"),
                    rs.getString("address"),
                    rs.getString("status")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cabDetails;
    }


}
