package dao;

import model.Major;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class MajorDAO {

    // Dữ liệu mock - demo không kết nối DB thật
    private static List<Major> mockData = new ArrayList<>();
    private static int nextId = 7;

    static {
        // Khởi tạo dữ liệu demo
        Major m1 = new Major(1, 1, "Công Nghệ Phần Mềm");
        m1.setFacultyName("Khoa Công Nghệ Thông Tin");

        Major m2 = new Major(2, 1, "Hệ Thống Thông Tin");
        m2.setFacultyName("Khoa Công Nghệ Thông Tin");

        Major m3 = new Major(3, 1, "Khoa Học Máy Tính");
        m3.setFacultyName("Khoa Công Nghệ Thông Tin");

        Major m4 = new Major(4, 2, "Cơ Khí Chế Tạo Máy");
        m4.setFacultyName("Khoa Cơ Khí");

        Major m5 = new Major(5, 2, "Kỹ Thuật Ô Tô");
        m5.setFacultyName("Khoa Cơ Khí");

        Major m6 = new Major(6, 3, "Kỹ Thuật Điện");
        m6.setFacultyName("Khoa Điện - Điện Tử");

        mockData.add(m1);
        mockData.add(m2);
        mockData.add(m3);
        mockData.add(m4);
        mockData.add(m5);
        mockData.add(m6);
    }

    public List<Major> getAllMajors() {
        return new ArrayList<>(mockData);
    }

    public List<Major> getMajorsByFaculty(int facultyId) {
        return mockData.stream()
                .filter(major -> major.getFacultyId() == facultyId)
                .collect(Collectors.toList());
    }

    public Major getMajorById(int id) {
        for (Major major : mockData) {
            if (major.getId() == id) {
                return major;
            }
        }
        return null;
    }

    public void addMajor(Major major) {
        major.setId(nextId++);
        mockData.add(major);
    }

    public void updateMajor(Major major) {
        for (int i = 0; i < mockData.size(); i++) {
            if (mockData.get(i).getId() == major.getId()) {
                mockData.set(i, major);
                break;
            }
        }
    }

    public void deleteMajor(int id) {
        mockData.removeIf(major -> major.getId() == id);
    }
}

