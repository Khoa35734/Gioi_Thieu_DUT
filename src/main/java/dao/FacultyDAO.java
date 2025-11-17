package dao;

import java.util.List;
import java.util.ArrayList;

import model.Faculty;

public class FacultyDAO {

    // Mock data – dữ liệu demo thay vì kết nối DB
    private static List<Faculty> mockData = new ArrayList<>();
    private static int nextId = 4;

    // Khởi tạo dữ liệu demo
    static {
        mockData.add(new Faculty(1, "Khoa Công Nghệ Thông Tin", "Đào tạo chuyên ngành CNTT, phần mềm, mạng máy tính"));
        mockData.add(new Faculty(2, "Khoa Cơ Khí", "Đào tạo kỹ sư cơ khí, chế tạo máy, ô tô"));
        mockData.add(new Faculty(3, "Khoa Điện - Điện Tử", "Đào tạo kỹ sư điện, tự động hóa, điện tử viễn thông"));
    }

    // Lấy toàn bộ khoa
    public List<Faculty> getAllFaculties() {
        return new ArrayList<>(mockData);
    }

    // Lấy khoa theo ID
    public Faculty getFacultyById(int id) {
        for (Faculty faculty : mockData) {
            if (faculty.getId() == id) {
                return faculty;
            }
        }
        return null;
    }

    // Thêm khoa
    public void addFaculty(Faculty faculty) {
        faculty.setId(nextId++);
        mockData.add(faculty);
    }

    // Cập nhật khoa
    public void updateFaculty(Faculty faculty) {
        for (int i = 0; i < mockData.size(); i++) {
            if (mockData.get(i).getId() == faculty.getId()) {
                mockData.set(i, faculty);
                break;
            }
        }
    }

    // Xóa khoa
    public void deleteFaculty(int id) {
        mockData.removeIf(faculty -> faculty.getId() == id);
    }
}
