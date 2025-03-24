package com.MegaCityCab.admin.dao;

import com.MegaCityCab.admin.model.Feedback;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FeedbackDAO {
    private Connection connection;

    public FeedbackDAO() throws SQLException {
        connection = DBConnection.getConnection();  // Assuming DBConnection is already implemented
    }

    // Method to retrieve all feedbacks from the database
    public List<Feedback> getAllFeedbacks() {
        List<Feedback> feedbacks = new ArrayList<>();
        String query = "SELECT * FROM feedback";  // Assuming the table is called 'feedback'

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setId(rs.getInt("id"));
                feedback.setCustomerId(rs.getInt("customer_id"));
                feedback.setCustomerName(rs.getString("customer_name"));
                feedback.setRating(rs.getInt("rating"));
                feedback.setMessage(rs.getString("message"));
                feedbacks.add(feedback);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return feedbacks;
    }
}
