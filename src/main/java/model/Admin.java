package model;

import java.sql.Timestamp;

public class Admin {
    private int id;
    private String username;
    private String password;
    private String fullName;
    private String email;
    private String role; // 'super_admin' or 'faculty_admin'
    private Integer facultyId; // NULL for super_admin
    private String facultyName; // For display purposes
    private Timestamp createdAt;
    // Reverted: Removed avatar field

    public Admin() {
    }

    public Admin(int id, String username, String password, String fullName) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.facultyId = null;
        this.role = "super_admin";
    }

    public Admin(int id, String username, String password, String fullName, Integer facultyId, String role) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.facultyId = facultyId;
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public Integer getFacultyId() {
        return facultyId;
    }

    public void setFacultyId(Integer facultyId) {
        this.facultyId = facultyId;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFacultyName() {
        return facultyName;
    }

    public void setFacultyName(String facultyName) {
        this.facultyName = facultyName;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    // Reverted: Removed getAvatar() and setAvatar()

    // Utility methods
    public boolean isSuperAdmin() {
        return "super_admin".equals(role);
    }

    public boolean isFacultyAdmin() {
        return "faculty_admin".equals(role);
    }
}
