package dao;

import model.News;
import java.util.ArrayList;
import java.util.List;

public class NewsDAO {

    // Dữ liệu mock - demo không kết nối DB thật
    private static List<News> mockData = new ArrayList<>();
    private static int nextId = 4;

    static {
        // Khởi tạo dữ liệu demo
        News n1 = new News(1, "Trường ĐH Duy Tân khai giảng năm học 2024-2025",
            "<h2>Lễ khai giảng năm học mới</h2><p>Sáng ngày 15/9/2024, Trường Đại học Duy Tân đã long trọng tổ chức lễ khai giảng năm học 2024-2025...</p>",
            "assets/img/khai-giang.jpg");
        n1.setCreatedDate("2024-09-15");

        News n2 = new News(2, "Sinh viên DTU đạt giải Nhất cuộc thi Lập trình",
            "<h2>Thành tích xuất sắc</h2><p>Đội tuyển sinh viên Khoa CNTT Trường ĐH Duy Tân đã xuất sắc giành giải Nhất cuộc thi Lập trình toàn quốc...</p>",
            "assets/img/giai-thuong.jpg");
        n2.setCreatedDate("2024-10-20");

        News n3 = new News(3, "Hội thảo khoa học quốc tế về AI và Machine Learning",
            "<h2>Hội thảo khoa học</h2><p>Trường ĐH Duy Tân tổ chức hội thảo khoa học quốc tế về trí tuệ nhân tạo và học máy với sự tham gia của nhiều chuyên gia...</p>",
            "assets/img/hoi-thao.jpg");
        n3.setCreatedDate("2024-11-10");

        mockData.add(n1);
        mockData.add(n2);
        mockData.add(n3);
    }

    public List<News> getAllNews() {
        return new ArrayList<>(mockData);
    }

    public News getNewsById(int id) {
        for (News news : mockData) {
            if (news.getId() == id) {
                return news;
            }
        }
        return null;
    }

    public void addNews(News news) {
        news.setId(nextId++);
        mockData.add(news);
    }

    public void updateNews(News news) {
        for (int i = 0; i < mockData.size(); i++) {
            if (mockData.get(i).getId() == news.getId()) {
                mockData.set(i, news);
                break;
            }
        }
    }

    public void deleteNews(int id) {
        mockData.removeIf(news -> news.getId() == id);
    }
}

