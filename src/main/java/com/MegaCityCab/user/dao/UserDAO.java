package com.MegaCityCab.user.dao;

import com.MegaCityCab.user.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    public boolean registerUser(User user) {
        boolean result = false;
        String query = "INSERT INTO user (first_name, last_name, address, gender, nic, phone_number, email, username, password) "
                     + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        // Using DBConnection class to get the connection
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            
            stmt.setString(1, user.getFirstName());
            stmt.setString(2, user.getLastName());
            stmt.setString(3, user.getAddress());
            stmt.setString(4, user.getGender());
            stmt.setString(5, user.getNic());
            stmt.setString(6, user.getPhoneNumber());
            stmt.setString(7, user.getEmail());
            stmt.setString(8, user.getUsername());
            stmt.setString(9, user.getPassword());

            int rowsInserted = stmt.executeUpdate();
            result = rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    
    
    
	private static final String SELECT_ALL_USERS_SQL = "SELECT * FROM user";

    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS_SQL);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                User user = new User();
                user.setRegisterId(resultSet.getInt("register_id"));
                user.setFirstName(resultSet.getString("first_name"));
                user.setLastName(resultSet.getString("last_name"));
                user.setAddress(resultSet.getString("address"));
                user.setEmail(resultSet.getString("email"));
                user.setPhoneNumber(resultSet.getString("phone_number"));
                user.setGender(resultSet.getString("gender"));
                user.setNic(resultSet.getString("nic"));

                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

}
