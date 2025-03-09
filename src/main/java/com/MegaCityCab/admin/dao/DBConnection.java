package com.MegaCityCab.admin.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    // Database credentials
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/mega"; 
    private static final String JDBC_USERNAME = "root"; 
    private static final String JDBC_PASSWORD = "s1234"; 
    
    // Method to get a database connection
    public static Connection getConnection() throws SQLException {
        try {
            // Load the MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Return a connection
            return DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error connecting to the database", e);
        }
    }
}
