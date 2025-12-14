package dao;

import model.Faculty;
import utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FacultyDAO {

    /**
     * Get all faculties
     */
    public List<Faculty> getAllFaculties() {
        List<Faculty> faculties = new ArrayList<>();
        String sql = "SELECT id, name, description, created_at, updated_at FROM faculty ORDER BY name";
        
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                faculties.add(extractFacultyFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return faculties;
    }

    /**
     * Get faculty by ID
     */
    public Faculty getFacultyById(int id) {
        String sql = "SELECT id, name, description, created_at, updated_at FROM faculty WHERE id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                return extractFacultyFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Create faculty (Super Admin only)
     */
    public boolean createFaculty(Faculty faculty) {
        String sql = "INSERT INTO faculty (name, description) VALUES (?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            stmt.setString(1, faculty.getName());
            stmt.setString(2, faculty.getDescription());
            
            int rowsAffected = stmt.executeUpdate();
            
            if (rowsAffected > 0) {
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    faculty.setId(rs.getInt(1));
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Update faculty
     */
    public boolean updateFaculty(Faculty faculty) {
        String sql = "UPDATE faculty SET name = ?, description = ? WHERE id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, faculty.getName());
            stmt.setString(2, faculty.getDescription());
            stmt.setInt(3, faculty.getId());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Delete faculty (Super Admin only)
     * Note: This will also delete all related admins and majors due to CASCADE
     */
    public boolean deleteFaculty(int id) {
        String sql = "DELETE FROM faculty WHERE id = ?";
        
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
     * Get faculty statistics
     */
    public int getMajorCountByFaculty(int facultyId) {
        String sql = "SELECT COUNT(*) FROM major WHERE faculty_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, facultyId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * Get news count by faculty
     */
    public int getNewsCountByFaculty(int facultyId) {
        String sql = "SELECT COUNT(*) FROM news WHERE faculty_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, facultyId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * Extract Faculty object from ResultSet
     */
    private Faculty extractFacultyFromResultSet(ResultSet rs) throws SQLException {
        Faculty faculty = new Faculty();
        faculty.setId(rs.getInt("id"));
        faculty.setName(rs.getString("name"));
        faculty.setDescription(rs.getString("description"));
        faculty.setCreatedAt(rs.getTimestamp("created_at"));
        faculty.setUpdatedAt(rs.getTimestamp("updated_at"));
        
        return faculty;
    }

    public void addFaculty(Faculty faculty) {

    }
}
