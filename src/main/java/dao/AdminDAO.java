package dao;

import model.Admin;

public class AdminDAO {

    // Demo đơn giản: hard-coded account
    public Admin login(String username, String password) {
        // Tài khoản demo: admin/admin123
        if ("admin".equals(username) && "admin123".equals(password)) {
            return new Admin(1, "admin", "admin123", "Quản Trị Viên");
        }
        return null;
    }
}

