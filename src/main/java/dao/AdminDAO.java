package dao;

import model.Admin;
import utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO {

    // Reverted: Removed 'a.avatar' from the SELECT statement
    private static final String BASE_SELECT = "SELECT a.id, a.username, a.password, a.full_name, a.email, a.role, a.faculty_id, " +
                                              "f.name as faculty_name, a.created_at " +
                                              "FROM admin a " +
                                              "LEFT JOIN faculty f ON a.faculty_id = f.id ";

    /**
     * Login authentication with detailed debugging
     */
    public Admin login(String username, String password) {
        System.out.println("\n--- AdminDAO Login Debug ---");
        System.out.println("Attempting login for username: [" + username + "]");

        String sql = BASE_SELECT + "WHERE a.username = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, username.trim());
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    System.out.println("SUCCESS: User found in database: " + rs.getString("username"));
                    String storedPassword = rs.getString("password");
                    
                    System.out.println("  - Password from user (input):     [" + password + "]");
                    System.out.println("  - Password from database (stored):  [" + storedPassword + "]");

                    String trimmedInputPassword = (password != null) ? password.trim() : "";
                    String trimmedStoredPassword = (storedPassword != null) ? storedPassword.trim() : "";

                    if (trimmedStoredPassword.equals(trimmedInputPassword)) {
                        System.out.println("SUCCESS: Password comparison matched.");
                        System.out.println("--- End Debug ---\n");
                        return extractAdminFromResultSet(rs);
                    } else {
                        System.out.println("ERROR: Password comparison FAILED.");
                    }
                } else {
                    System.out.println("ERROR: User NOT found in database for username: [" + username.trim() + "]");
                }
            }
        } catch (SQLException e) {
            System.out.println("FATAL: SQL Exception during login: " + e.getMessage());
            e.printStackTrace();
        }
        
        System.out.println("Login failed, returning null.");
        System.out.println("--- End Debug ---\n");
        return null;
    }

    /**
     * Extract Admin object from ResultSet
     */
    private Admin extractAdminFromResultSet(ResultSet rs) throws SQLException {
        Admin admin = new Admin();
        admin.setId(rs.getInt("id"));
        admin.setUsername(rs.getString("username"));
        admin.setPassword(rs.getString("password"));
        admin.setFullName(rs.getString("full_name"));
        admin.setEmail(rs.getString("email"));
        admin.setRole(rs.getString("role"));
        
        Integer facultyId = rs.getObject("faculty_id", Integer.class);
        admin.setFacultyId(facultyId);
        
        admin.setFacultyName(rs.getString("faculty_name"));
        admin.setCreatedAt(rs.getTimestamp("created_at"));
        
        return admin;
    }
    
    public List<Admin> getAllAdmins() {
        List<Admin> admins = new ArrayList<>();
        String sql = BASE_SELECT + "ORDER BY a.created_at DESC";
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                admins.add(extractAdminFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admins;
    }

    public Admin getAdminById(int id) {
        String sql = BASE_SELECT + "WHERE a.id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return extractAdminFromResultSet(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean createAdmin(Admin admin) {
        String sql = "INSERT INTO admin (username, password, full_name, email, role, faculty_id) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, admin.getUsername());
            stmt.setString(2, admin.getPassword());
            stmt.setString(3, admin.getFullName());
            stmt.setString(4, admin.getEmail());
            stmt.setString(5, admin.getRole());
            if (admin.getFacultyId() != null) {
                stmt.setInt(6, admin.getFacultyId());
            } else {
                stmt.setNull(6, Types.INTEGER);
            }
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                try (ResultSet rs = stmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        admin.setId(rs.getInt(1));
                    }
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateAdmin(Admin admin) {
        String sql = "UPDATE admin SET username = ?, full_name = ?, email = ?, role = ?, faculty_id = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, admin.getUsername());
            stmt.setString(2, admin.getFullName());
            stmt.setString(3, admin.getEmail());
            stmt.setString(4, admin.getRole());
            if (admin.getFacultyId() != null) {
                stmt.setInt(5, admin.getFacultyId());
            } else {
                stmt.setNull(5, Types.INTEGER);
            }
            stmt.setInt(6, admin.getId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Delete admin (Super Admin only)
     */
    public boolean deleteAdmin(int id) {
        String sql = "DELETE FROM admin WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Update password
     */
    public boolean updatePassword(int adminId, String newPassword) {
        String sql = "UPDATE admin SET password = ? WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            // TODO: Hash password before storing
            stmt.setString(1, newPassword);
            stmt.setInt(2, adminId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
