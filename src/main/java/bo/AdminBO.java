package bo;

import dao.AdminDAO;
import model.Admin;

import java.util.List;

/**
 * Business Object for Admin
 * Handles business logic for admin operations
 */
public class AdminBO {
    private final AdminDAO adminDAO;

    public AdminBO() {
        this.adminDAO = new AdminDAO();
    }

    /**
     * Authenticate admin login
     */
    public Admin login(String username, String password) {
        if (username == null || username.trim().isEmpty() || 
            password == null || password.trim().isEmpty()) {
            return null;
        }

        return adminDAO.login(username, password);
    }

    /**
     * Get all admins (super admin only)
     */
    public List<Admin> getAllAdmins() {
        return adminDAO.getAllAdmins();
    }

    /**
     * Get admin by ID
     */
    public Admin getAdminById(int id) {
        return adminDAO.getAdminById(id);
    }

    /**
     * Create admin with validation
     */
    public boolean createAdmin(Admin admin, Admin currentAdmin) {
        // Only super admin can create new admins
        if (!currentAdmin.isSuperAdmin()) {
            return false;
        }

        // Validate required fields
        if (admin.getUsername() == null || admin.getUsername().trim().isEmpty()) {
            return false;
        }
        if (admin.getPassword() == null || admin.getPassword().trim().isEmpty()) {
            return false;
        }
        if (admin.getFullName() == null || admin.getFullName().trim().isEmpty()) {
            return false;
        }
        if (admin.getRole() == null || admin.getRole().trim().isEmpty()) {
            return false;
        }

        // Validate role
        if (!admin.getRole().equals("super_admin") && !admin.getRole().equals("faculty_admin")) {
            return false;
        }

        // Faculty admin must have facultyId
        if (admin.getRole().equals("faculty_admin") && admin.getFacultyId() == null) {
            return false;
        }

        return adminDAO.createAdmin(admin);
    }

    /**
     * Update admin with validation
     */
    public boolean updateAdmin(Admin admin, Admin currentAdmin) {
        // Only super admin can update admins
        if (!currentAdmin.isSuperAdmin()) {
            return false;
        }

        // Validate admin exists
        Admin existingAdmin = adminDAO.getAdminById(admin.getId());
        if (existingAdmin == null) {
            return false;
        }

        // Validate required fields
        if (admin.getUsername() == null || admin.getUsername().trim().isEmpty()) {
            return false;
        }
        if (admin.getFullName() == null || admin.getFullName().trim().isEmpty()) {
            return false;
        }
        if (admin.getRole() == null || admin.getRole().trim().isEmpty()) {
            return false;
        }

        // Validate role
        if (!admin.getRole().equals("super_admin") && !admin.getRole().equals("faculty_admin")) {
            return false;
        }

        // Faculty admin must have facultyId
        if (admin.getRole().equals("faculty_admin") && admin.getFacultyId() == null) {
            return false;
        }

        return adminDAO.updateAdmin(admin);
    }

    /**
     * Delete admin
     */
    public boolean deleteAdmin(int adminId, Admin currentAdmin) {
        // Only super admin can delete admins
        if (!currentAdmin.isSuperAdmin()) {
            return false;
        }

        // Cannot delete yourself
        if (adminId == currentAdmin.getId()) {
            return false;
        }

        // Validate admin exists
        Admin existingAdmin = adminDAO.getAdminById(adminId);
        if (existingAdmin == null) {
            return false;
        }

        return adminDAO.deleteAdmin(adminId);
    }

    /**
     * Get admins by faculty (if method exists in DAO)
     */
    public List<Admin> getAdminsByFaculty(int facultyId) {
        // Filter manually since DAO method doesn't exist yet
        return adminDAO.getAllAdmins().stream()
            .filter(admin -> admin.getFacultyId() != null && admin.getFacultyId() == facultyId)
            .toList();
    }

    /**
     * Change password with validation
     */
    public boolean changePassword(int adminId, String oldPassword, String newPassword) {
        // Validate passwords
        if (oldPassword == null || oldPassword.trim().isEmpty() ||
            newPassword == null || newPassword.trim().isEmpty()) {
            return false;
        }

        // Validate new password strength (minimum 6 characters)
        if (newPassword.length() < 6) {
            return false;
        }

        // Get admin
        Admin admin = adminDAO.getAdminById(adminId);
        if (admin == null) {
            return false;
        }

        // Verify old password
        if (!admin.getPassword().equals(oldPassword)) {
            return false;
        }

        // Update password
        admin.setPassword(newPassword);
        return adminDAO.updateAdmin(admin);
    }
}
