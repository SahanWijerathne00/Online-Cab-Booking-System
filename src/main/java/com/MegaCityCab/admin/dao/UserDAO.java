package com.MegaCityCab.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserDAO {
    public boolean deleteUser(int userId) {
        Connection conn = null;
        PreparedStatement pst = null;
        boolean isDeleted = false;
        
        try {
            conn = DBConnection.getConnection(); 
            String sql = "DELETE FROM user WHERE register_id = ?";
            pst = conn.prepareStatement(sql);
            pst.setInt(1, userId);
            
            int rowsAffected = pst.executeUpdate();
            if (rowsAffected > 0) {
                isDeleted = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pst != null) pst.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return isDeleted;
    }
}
