package com.riyad;

import com.riyad.User;
import com.riyad.DatabaseUtil;
import java.sql.*;

public class UserDAO {
    public User authenticateUser(String username, String password) {
        User user = null;
        String query = "SELECT * FROM users WHERE username = ? AND password = ?";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            
            stmt.setString(1, username);
            stmt.setString(2, password);
            
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
                user.setFullName(rs.getString("full_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return user;
    }
    
    public boolean registerUser(User user) {
        String checkQuery = "SELECT COUNT(*) FROM users WHERE username = ? OR email = ?";
        String insertQuery = "INSERT INTO users (username, password, full_name, email, role) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement checkStmt = conn.prepareStatement(checkQuery)) {
            
            // Check if username or email already exists
            checkStmt.setString(1, user.getUsername());
            checkStmt.setString(2, user.getEmail());
            ResultSet rs = checkStmt.executeQuery();
            
            if (rs.next() && rs.getInt(1) > 0) {
                return false; // User already exists
            }
            
            // For debugging: Print the values being inserted
            System.out.println("Inserting user: " + user.getUsername() + ", " + user.getEmail() + ", " + user.getRole());
            
            // Insert new user
            try (PreparedStatement insertStmt = conn.prepareStatement(insertQuery)) {
                insertStmt.setString(1, user.getUsername());
                
                // Hash the password before storing (if using BCrypt)
                // String hashedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
                // insertStmt.setString(2, hashedPassword);
                
                insertStmt.setString(2, user.getPassword()); // Store plain text for now
                insertStmt.setString(3, user.getFullName());
                insertStmt.setString(4, user.getEmail());
                insertStmt.setString(5, user.getRole()); // Store the selected role
                
                int rowsAffected = insertStmt.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            // Print the full error for debugging
            e.printStackTrace();
            return false;
        }
    }
}
