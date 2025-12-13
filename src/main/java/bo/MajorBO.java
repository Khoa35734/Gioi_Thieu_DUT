package bo;

import dao.MajorDAO;
import model.Admin;
import model.Major;

import java.util.List;

/**
 * Business Object for Major
 * Handles business logic for major operations
 */
public class MajorBO {
    private final MajorDAO majorDAO;

    public MajorBO() {
        this.majorDAO = new MajorDAO();
    }

    /**
     * Get all majors
     */
    public List<Major> getAllMajors() {
        return majorDAO.getAllMajors();
    }

    /**
     * Get major by ID
     */
    public Major getMajorById(int id) {
        return majorDAO.getMajorById(id);
    }

    /**
     * Get majors by faculty ID
     */
    public List<Major> getMajorsByFaculty(int facultyId) {
        return majorDAO.getMajorsByFaculty(facultyId);
    }

    /**
     * Create major with validation
     */
    public boolean createMajor(Major major, Admin admin) {
        // Validate admin permissions
        if (!admin.isFacultyAdmin() && !admin.isSuperAdmin()) {
            return false;
        }

        // Faculty admin can only create majors for their faculty
        if (admin.isFacultyAdmin()) {
            major.setFacultyId(admin.getFacultyId());
        }

        // Validate required fields
        if (major.getMajorCode() == null || major.getMajorCode().trim().isEmpty()) {
            return false;
        }
        if (major.getName() == null || major.getName().trim().isEmpty()) {
            return false;
        }

        // Check if major code already exists
        if (majorDAO.majorCodeExists(major.getMajorCode())) {
            return false;
        }

        return majorDAO.createMajor(major);
    }

    /**
     * Update major with validation
     */
    public boolean updateMajor(Major major, Admin admin) {
        // Validate admin permissions
        if (!admin.isFacultyAdmin() && !admin.isSuperAdmin()) {
            return false;
        }

        // Get existing major
        Major existingMajor = majorDAO.getMajorById(major.getId());
        if (existingMajor == null) {
            return false;
        }

        // Faculty admin can only update their own faculty's majors
        if (admin.isFacultyAdmin()) {
            if (existingMajor.getFacultyId() != admin.getFacultyId()) {
                return false;
            }
            // Ensure faculty ID doesn't change
            major.setFacultyId(admin.getFacultyId());
        }

        // Validate required fields
        if (major.getMajorCode() == null || major.getMajorCode().trim().isEmpty()) {
            return false;
        }
        if (major.getName() == null || major.getName().trim().isEmpty()) {
            return false;
        }

        // Check if major code exists for other majors
        if (!major.getMajorCode().equals(existingMajor.getMajorCode())) {
            if (majorDAO.majorCodeExists(major.getMajorCode())) {
                return false;
            }
        }

        return majorDAO.updateMajor(major);
    }

    /**
     * Delete major with validation
     */
    public boolean deleteMajor(int majorId, Admin admin) {
        // Validate admin permissions
        if (!admin.isFacultyAdmin() && !admin.isSuperAdmin()) {
            return false;
        }

        // Get existing major
        Major existingMajor = majorDAO.getMajorById(majorId);
        if (existingMajor == null) {
            return false;
        }

        // Faculty admin can only delete their own faculty's majors
        if (admin.isFacultyAdmin()) {
            if (existingMajor.getFacultyId() != admin.getFacultyId()) {
                return false;
            }
        }

        return majorDAO.deleteMajor(majorId);
    }

    /**
     * Check if major code exists (for validation in forms)
     */
    public boolean majorCodeExists(String majorCode) {
        return majorDAO.majorCodeExists(majorCode);
    }

    /**
     * Get total majors count for dashboard
     */
    public int getTotalMajorsCount(Admin admin) {
        if (admin.isSuperAdmin()) {
            return majorDAO.getAllMajors().size();
        } else if (admin.isFacultyAdmin()) {
            return majorDAO.getMajorsByFaculty(admin.getFacultyId()).size();
        }
        return 0;
    }

    /**
     * Get majors for display with faculty info
     */
    public List<Major> getMajorsForAdmin(Admin admin) {
        if (admin.isSuperAdmin()) {
            return majorDAO.getAllMajors();
        } else if (admin.isFacultyAdmin()) {
            return majorDAO.getMajorsByFaculty(admin.getFacultyId());
        }
        return List.of();
    }
}
