package com.MegaCityCab.admin.dao;

import java.sql.*;

import com.MegaCityCab.admin.model.Admin;
import com.MegaCityCab.user.dao.DBConnection;

public class AdminDAO {

    public Admin validateAdmin(String username, String password) {
        Admin admin = null;
        String sql = "SELECT * FROM admin WHERE username = ? AND password = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                admin = new Admin(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("role"),
                        rs.getString("avatar")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }
}
