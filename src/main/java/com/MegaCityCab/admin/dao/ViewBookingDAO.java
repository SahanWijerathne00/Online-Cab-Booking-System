package com.MegaCityCab.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.MegaCityCab.admin.model.View_Booking;

public class ViewBookingDAO {

    // Method to retrieve all bookings
    public List<View_Booking> getAllBookings() {
        List<View_Booking> bookings = new ArrayList<>();
        
        // Fetch all necessary data from the booking table
        String query = "SELECT * FROM booking";

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                View_Booking booking = new View_Booking();
                booking.setId(rs.getInt("id"));
                booking.setCustomerName(rs.getString("customer_name"));
                booking.setCustomerEmail(rs.getString("email")); // Ensure column exists in the table
                booking.setCustomerPhoneNumber(rs.getString("phone_number")); // Ensure column exists
                booking.setPickupLocation(rs.getString("pickup_location"));
                booking.setDropLocation(rs.getString("drop_location"));
                booking.setCabCategory(rs.getString("cab_category"));
                booking.setCabModel(rs.getString("cab_model"));
                booking.setCabPlateNumber(rs.getString("Plate_number"));
                booking.setDriverName(rs.getString("driver_name"));
                booking.setDriverContact(rs.getString("driver_contact"));
                booking.setDriverAddress(rs.getString("driver_address"));
                booking.setBookingTime(rs.getString("booking_time"));
                booking.setAmount(rs.getDouble("amount"));  // Set the amount here
                booking.setMethod(rs.getString("payment_method"));
                booking.setStatus(rs.getString("status"));
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }

    // Method to update the booking status
    public boolean updateBookingStatus(int bookingId, String newStatus) {
        String query = "UPDATE booking SET status = ? WHERE id = ?";
        
        try (Connection conn = DBConnection.getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, newStatus);
            stmt.setInt(2, bookingId);
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
