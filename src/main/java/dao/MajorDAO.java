package dao;

import model.Major;
import utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MajorDAO {

    /**
     * Get all majors (Super Admin only)
     */
    public List<Major> getAllMajors() {
        List<Major> majors = new ArrayList<>();
        String sql = "SELECT m.id, m.faculty_id, m.major_code, m.name, m.description, m.created_by, " +
                     "m.created_at, m.updated_at, " +
                     "f.name as faculty_name, a.full_name as creator_name " +
                     "FROM major m " +
                     "LEFT JOIN faculty f ON m.faculty_id = f.id " +
                     "LEFT JOIN admin a ON m.created_by = a.id " +
                     "ORDER BY f.name, m.name";
        
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                majors.add(extractMajorFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return majors;
    }

    /**
     * Get majors by faculty (for Faculty Admin)
     */
    public List<Major> getMajorsByFaculty(int facultyId) {
        List<Major> majors = new ArrayList<>();
        String sql = "SELECT m.id, m.faculty_id, m.major_code, m.name, m.description, m.created_by, " +
                     "m.created_at, m.updated_at, " +
                     "f.name as faculty_name, a.full_name as creator_name " +
                     "FROM major m " +
                     "LEFT JOIN faculty f ON m.faculty_id = f.id " +
                     "LEFT JOIN admin a ON m.created_by = a.id " +
                     "WHERE m.faculty_id = ? " +
                     "ORDER BY m.name";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, facultyId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    majors.add(extractMajorFromResultSet(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return majors;
    }

    /**
     * Get major by ID
     */
    public Major getMajorById(int id) {
        String sql = "SELECT m.id, m.faculty_id, m.major_code, m.name, m.description, m.created_by, " +
                     "m.created_at, m.updated_at, " +
                     "f.name as faculty_name, a.full_name as creator_name " +
                     "FROM major m " +
                     "LEFT JOIN faculty f ON m.faculty_id = f.id " +
                     "LEFT JOIN admin a ON m.created_by = a.id " +
                     "WHERE m.id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return extractMajorFromResultSet(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Get major by code
     */
    public Major getMajorByCode(String majorCode) {
        String sql = "SELECT m.id, m.faculty_id, m.major_code, m.name, m.description, m.created_by, " +
                     "m.created_at, m.updated_at, " +
                     "f.name as faculty_name, a.full_name as creator_name " +
                     "FROM major m " +
                     "LEFT JOIN faculty f ON m.faculty_id = f.id " +
                     "LEFT JOIN admin a ON m.created_by = a.id " +
                     "WHERE m.major_code = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, majorCode);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return extractMajorFromResultSet(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Create major (Faculty Admin can create for their faculty)
     */
    public boolean createMajor(Major major) {
        String sql = "INSERT INTO major (faculty_id, major_code, name, description, created_by) " +
                     "VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            stmt.setInt(1, major.getFacultyId());
            stmt.setString(2, major.getMajorCode());
            stmt.setString(3, major.getName());
            stmt.setString(4, major.getDescription());
            
            if (major.getCreatedBy() != null) {
                stmt.setInt(5, major.getCreatedBy());
            } else {
                stmt.setNull(5, Types.INTEGER);
            }
            
            int rowsAffected = stmt.executeUpdate();
            
            if (rowsAffected > 0) {
                try (ResultSet rs = stmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        major.setId(rs.getInt(1));
                    }
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Update major
     */
    public boolean updateMajor(Major major) {
        String sql = "UPDATE major SET faculty_id = ?, major_code = ?, name = ?, description = ? " +
                     "WHERE id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, major.getFacultyId());
            stmt.setString(2, major.getMajorCode());
            stmt.setString(3, major.getName());
            stmt.setString(4, major.getDescription());
            stmt.setInt(5, major.getId());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Delete major
     */
    public boolean deleteMajor(int id) {
        String sql = "DELETE FROM major WHERE id = ?";
        
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
     * Check if major code exists
     */
    public boolean majorCodeExists(String majorCode) {
        String sql = "SELECT COUNT(*) FROM major WHERE major_code = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, majorCode);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Check if admin can manage major (permission check)
     * - Super Admin: can manage all majors
     * - Faculty Admin: can only manage majors of their faculty
     */
    public boolean canManageMajor(int majorId, String adminRole, Integer adminFacultyId) {
        // Super admin can manage all majors
        if ("super_admin".equals(adminRole)) {
            return true;
        }
        
        // Faculty admin can only manage majors of their faculty
        if ("faculty_admin".equals(adminRole) && adminFacultyId != null) {
            Major major = getMajorById(majorId);
            if (major != null) {
                return major.getFacultyId() == adminFacultyId;
            }
        }
        
        return false;
    }

    /**
     * Extract Major object from ResultSet
     */
    private Major extractMajorFromResultSet(ResultSet rs) throws SQLException {
        Major major = new Major();
        major.setId(rs.getInt("id"));
        major.setFacultyId(rs.getInt("faculty_id"));
        major.setMajorCode(rs.getString("major_code"));
        major.setName(rs.getString("name"));
        major.setDescription(rs.getString("description"));
        
        Integer createdBy = rs.getObject("created_by", Integer.class);
        major.setCreatedBy(createdBy);
        
        major.setCreatedAt(rs.getTimestamp("created_at"));
        major.setUpdatedAt(rs.getTimestamp("updated_at"));
        major.setFacultyName(rs.getString("faculty_name"));
        major.setCreatorName(rs.getString("creator_name"));
        
        return major;
    }

    public void addMajor(Major major) {
        String sql = "INSERT INTO major (faculty_id, major_code, name, description, created_by) " +
                     "VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            stmt.setInt(1, major.getFacultyId());
            stmt.setString(2, major.getMajorCode());
            stmt.setString(3, major.getName());
            stmt.setString(4, major.getDescription());
            
            if (major.getCreatedBy() != null) {
                stmt.setInt(5, major.getCreatedBy());
            } else {
                stmt.setNull(5, Types.INTEGER);
            }
            
            int rowsAffected = stmt.executeUpdate();
            
            if (rowsAffected > 0) {
                try (ResultSet rs = stmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        major.setId(rs.getInt(1));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
