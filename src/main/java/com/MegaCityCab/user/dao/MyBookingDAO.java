package com.MegaCityCab.user.dao;

import com.MegaCityCab.user.model.MyBooking;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MyBookingDAO {

    // Method to get bookings by userId
    public static List<MyBooking> getBookingsByUserId(int userId) {
        List<MyBooking> bookings = new ArrayList<>();
        String query = "SELECT * FROM booking WHERE customer_id = ?";  // Get bookings for the specific user
        
        System.out.println("User ID from session: " + userId);


        try (Connection conn = DBConnection.getConnection(); 
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, userId);  // Set userId in the query

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    MyBooking booking = new MyBooking();
                    booking.setId(rs.getInt("id"));
                    booking.setCustomerName(rs.getString("customer_name"));
                    booking.setPhoneNumber(rs.getString("phone_number"));
                    booking.setEmail(rs.getString("email"));
                    booking.setPickupLocation(rs.getString("pickup_location"));
                    booking.setDropLocation(rs.getString("drop_location"));
                    booking.setBookingDate(rs.getString("booking_time").split(" ")[0]);  // Date part
                    booking.setBookingTime(rs.getString("booking_time").split(" ")[1]);  // Time part
                    booking.setAmount(rs.getDouble("amount"));
                    booking.setStatus(rs.getString("status"));
                    bookings.add(booking);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }
}
