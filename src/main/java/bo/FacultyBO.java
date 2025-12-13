package bo;

import dao.FacultyDAO;
import model.Faculty;

import java.util.List;

/**
 * Business Object for Faculty
 * Handles business logic for faculty operations
 */
public class FacultyBO {
    private final FacultyDAO facultyDAO;

    public FacultyBO() {
        this.facultyDAO = new FacultyDAO();
    }

    /**
     * Get all faculties
     */
    public List<Faculty> getAllFaculties() {
        return facultyDAO.getAllFaculties();
    }

    /**
     * Get faculty by ID
     */
    public Faculty getFacultyById(int id) {
        return facultyDAO.getFacultyById(id);
    }

    /**
     * Create faculty with validation
     */
    public boolean createFaculty(Faculty faculty) {
        // Validate required fields
        if (faculty.getName() == null || faculty.getName().trim().isEmpty()) {
            return false;
        }

        return facultyDAO.createFaculty(faculty);
    }

    /**
     * Update faculty with validation
     */
    public boolean updateFaculty(Faculty faculty) {
        // Validate faculty exists
        Faculty existingFaculty = facultyDAO.getFacultyById(faculty.getId());
        if (existingFaculty == null) {
            return false;
        }

        // Validate required fields
        if (faculty.getName() == null || faculty.getName().trim().isEmpty()) {
            return false;
        }

        return facultyDAO.updateFaculty(faculty);
    }

    /**
     * Delete faculty
     */
    public boolean deleteFaculty(int id) {
        // Validate faculty exists
        Faculty existingFaculty = facultyDAO.getFacultyById(id);
        if (existingFaculty == null) {
            return false;
        }

        return facultyDAO.deleteFaculty(id);
    }
}
