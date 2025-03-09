package com.MegaCityCab.admin.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.MegaCityCab.admin.model.Add_Category;
import com.MegaCityCab.user.dao.DBConnection;

public class Add_CategoryDAO {

    // SQL Query to insert a new category
    private static final String INSERT_CATEGORY_SQL = "INSERT INTO category (category_name, rate, description, status) VALUES (?, ?, ?)";

    // Method to save a new category to the database
    public boolean saveCategory(Add_Category category) {
        boolean isSaved = false;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CATEGORY_SQL)) {

            preparedStatement.setString(1, category.getCategoryName());
            preparedStatement.setString(2, category.getRate());
            preparedStatement.setString(3, category.getDescription());
            preparedStatement.setString(4, category.getStatus());

            int rowsAffected = preparedStatement.executeUpdate();
            if (rowsAffected > 0) {
                isSaved = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Log error for debugging
        }
        return isSaved;
    }

    // SQL Query to fetch all categories
    private static final String SELECT_ALL_CATEGORIES_SQL = "SELECT * FROM category";

    // Method to fetch all categories from the database
    public List<Add_Category> getAllCategories() {
        List<Add_Category> categories = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CATEGORIES_SQL);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                Add_Category category = new Add_Category(
                    resultSet.getInt("id"),
                    resultSet.getString("category_name"),
                    resultSet.getString("rate"),
                    resultSet.getString("description"),
                    resultSet.getString("status")
                );
                categories.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Log error for debugging
        }
        return categories;
    }

    // Method to fetch a specific category by its ID
    public Add_Category getCategoryById(int id) {
        Add_Category category = null;
        String query = "SELECT * FROM category WHERE id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, id);  // Set the category ID in the query
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    // Create a new Add_Category object with the data from the database
                    category = new Add_Category(
                        rs.getInt("id"),
                        rs.getString("category_name"),
                        rs.getString("rate"),
                        rs.getString("description"),
                        rs.getString("status")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Log error for debugging
        }
        return category;
    }

    // SQL Query to update an existing category
    private static final String UPDATE_CATEGORY_SQL = "UPDATE category SET category_name = ?, rate = ?, description = ?, status = ? WHERE id = ?";

    // Method to update the category details in the database
    public boolean updateCategory(Add_Category category) {
        boolean isUpdated = false;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_CATEGORY_SQL)) {

            statement.setString(1, category.getCategoryName());
            statement.setString(2,  category.getRate());
            statement.setString(2, category.getDescription());
            statement.setString(3, category.getStatus());
            statement.setInt(4, category.getId());  // Set the ID of the category to update

            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                isUpdated = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Log error for debugging
        }
        return isUpdated;
    }
    
    
    public boolean deleteCategoryById(int id) {
        String query = "DELETE FROM category WHERE id = ?";
        boolean isDeleted = false;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
                 
            statement.setInt(1, id);  // Set the category ID in the query

            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                isDeleted = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Log error for debugging
        }
        
        return isDeleted;
    }
    
    
    
    public List<String> getCategories() {
        List<String> categories = new ArrayList<>();
        String query = "SELECT name FROM category"; // Assuming the column is named 'name' in the 'category' table

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                String categoryName = resultSet.getString("name");
                categories.add(categoryName); // Add category name to list
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categories;
    }

}
