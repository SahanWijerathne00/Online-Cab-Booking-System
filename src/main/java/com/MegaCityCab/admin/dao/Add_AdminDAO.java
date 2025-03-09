package com.MegaCityCab.admin.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.io.IOException;
import java.io.InputStream;
import com.MegaCityCab.admin.model.Add_Admin;
import com.MegaCityCab.user.dao.DBConnection;

public class Add_AdminDAO {

    private static final String INSERT_ADMIN_SQL = "INSERT INTO admin (name, username, password, role, avatar) VALUES (?, ?, ?, ?, ?)";

    public boolean saveAdmin(Add_Admin admin) {
        boolean isSaved = false;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ADMIN_SQL)) {

            preparedStatement.setString(1, admin.getName());
            preparedStatement.setString(2, admin.getUsername());
            preparedStatement.setString(3, admin.getPassword());
            preparedStatement.setString(4, admin.getRole());
            preparedStatement.setString(5, admin.getAvatar());
            

            // Execute the SQL query
            int rowsAffected = preparedStatement.executeUpdate();
            if (rowsAffected > 0) {
                isSaved = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isSaved;
    }
    
    
    private static final String SELECT_ALL_ADMINS_SQL = "SELECT * FROM admin";

    // Method to get all admins
    public List<Add_Admin> getAllAdmins() {
        List<Add_Admin> admins = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ADMINS_SQL);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                // Retrieve the avatar as a Blob and process it accordingly
                Blob avatarBlob = resultSet.getBlob("avatar");
                String avatarBase64 = null;
                if (avatarBlob != null) {
                    // Optionally, you can convert the Blob to a Base64 string for easier handling in the UI
                    InputStream avatarInputStream = avatarBlob.getBinaryStream();
                    byte[] avatarBytes = avatarInputStream.readAllBytes();
                    avatarBase64 = java.util.Base64.getEncoder().encodeToString(avatarBytes);
                }

                // Create a new Add_Admin object for each row and set the avatar as a Base64 string
                Add_Admin admin = new Add_Admin(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("username"),
                        resultSet.getString("password"),
                        resultSet.getString("role"),
                        avatarBase64 // Set the Base64-encoded avatar here
                );
                admins.add(admin);
            }

        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }
        return admins;
    }
    
    
    
    
    private static final String GET_ADMIN_BY_ID_SQL = "SELECT * FROM admin WHERE id = ?";
    private static final String UPDATE_ADMIN_SQL = "UPDATE admin SET name = ?, username = ?, role = ? WHERE id = ?";

    public Add_Admin getAdminById(int id) {
        Add_Admin admin = null;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(GET_ADMIN_BY_ID_SQL)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                admin = new Add_Admin(
                    resultSet.getInt("id"),
                    resultSet.getString("name"),
                    resultSet.getString("username"),
                    resultSet.getString("role"), null, null
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }

    public boolean updateAdmin(Add_Admin admin) {
        boolean isUpdated = false;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_ADMIN_SQL)) {

            statement.setString(1, admin.getName());
            statement.setString(2, admin.getUsername());
            statement.setString(3, admin.getRole());
            statement.setInt(4, admin.getid());

            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                isUpdated = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isUpdated;
    }
    
    
    
    private static final String DELETE_ADMIN_SQL = "DELETE FROM admin WHERE id = ?";

    public boolean deleteAdmin(int id) {
        boolean isDeleted = false;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_ADMIN_SQL)) {

            statement.setInt(1, id);  // Set the ID parameter for the DELETE query
            int rowsAffected = statement.executeUpdate();
            
            if (rowsAffected > 0) {
                isDeleted = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isDeleted;
    }
}  