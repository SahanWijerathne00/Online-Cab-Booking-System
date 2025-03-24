package com.MegaCityCab.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.MegaCityCab.user.model.Booking;

public class BookingDAO {

    public boolean saveBooking(Booking booking) {
    	String query = "INSERT INTO booking (customer_id, customer_name, phone_number, email, pickup_location, drop_location, "
                + "cab_category, cab_model, Plate_number, booking_time, amount, payment_method, driver_name, driver_contact, driver_address ) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            // Set values for the prepared statement
            stmt.setString(1, booking.getCustomerId());  // Assuming you have a customer ID
            stmt.setString(2, booking.getCustomerName());
            stmt.setString(3, booking.getPhoneNumber());
            stmt.setString(4, booking.getEmail());
            stmt.setString(5, booking.getPickup());
            stmt.setString(6, booking.getDrop());
            stmt.setString(7, booking.getCabCategory());
            stmt.setString(8, booking.getCabModel());
            stmt.setString(9, booking.getPlateNumber());
            stmt.setString(10, booking.getBookingTime());
            stmt.setDouble(11, booking.getAmount());  // Use setDouble to store amount as numeric
            stmt.setString(12, booking.getPaymentMethod());
            stmt.setString(13, booking.getDriverName());
            stmt.setString(14, booking.getDriverContact());
            stmt.setString(15, booking.getDriverAddress());
            
            System.out.println("Executing query: " + query);
            System.out.println("customer_id: " + booking.getCustomerId());
            System.out.println("customer_name: " + booking.getCustomerName());
            System.out.println("driver_name: " + booking.getDriverName());
            System.out.println("driver_contact: " + booking.getDriverContact());
            System.out.println("driver_address: " + booking.getDriverAddress());

            // Execute the query
            int result = stmt.executeUpdate();
            if (result > 0) {
                System.out.println("Booking saved successfully.");
                return true;
            } else {
                System.out.println("Booking not saved.");
                return false;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    
    
 
   
}
