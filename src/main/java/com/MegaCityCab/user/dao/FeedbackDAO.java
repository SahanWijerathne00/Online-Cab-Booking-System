package com.MegaCityCab.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.MegaCityCab.user.model.Feedback;

public class FeedbackDAO {
    public boolean saveFeedback(Feedback feedback) {
        String query = "INSERT INTO feedback (customer_id, customer_name, rating, message) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            // Set values for the prepared statement
            stmt.setString(1, feedback.getCustomerId());
            stmt.setString(2, feedback.getCustomerName());
            stmt.setInt(3, feedback.getRating());
            stmt.setString(4, feedback.getMessage());

            // Execute the query
            int result = stmt.executeUpdate();
            return result > 0;  // Return true if feedback was saved successfully
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
