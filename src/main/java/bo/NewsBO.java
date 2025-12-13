package bo;

import dao.NewsDAO;
import model.Admin;
import model.News;

import java.util.List;

/**
 * Business Object for News
 * Handles business logic for news operations
 */
public class NewsBO {
    private final NewsDAO newsDAO;

    public NewsBO() {
        this.newsDAO = new NewsDAO();
    }

    /**
     * Get random news for homepage
     */
    public List<News> getRandomNewsForHomepage(int limit) {
        return newsDAO.getRandomNews(limit);
    }

    /**
     * Get all news
     */
    public List<News> getAllNews() {
        return newsDAO.getAllNews();
    }

    /**
     * Get news by ID
     */
    public News getNewsById(int id) {
        return newsDAO.getNewsById(id);
    }

    /**
     * Get news by faculty ID
     */
    public List<News> getNewsByFaculty(Integer facultyId) {
        return newsDAO.getNewsByFaculty(facultyId);
    }

    /**
     * Create news with validation
     */
    public boolean createNews(News news, Admin admin) {
        // Validate admin permissions
        if (!admin.isFacultyAdmin() && !admin.isSuperAdmin()) {
            return false;
        }

        // Set author
        news.setAuthorId(admin.getId());

        // Faculty admin can only create news for their faculty
        if (admin.isFacultyAdmin()) {
            news.setFacultyId(admin.getFacultyId());
        }

        // Validate required fields
        if (news.getTitle() == null || news.getTitle().trim().isEmpty()) {
            return false;
        }
        if (news.getContent() == null || news.getContent().trim().isEmpty()) {
            return false;
        }

        return newsDAO.createNews(news);
    }

    /**
     * Update news with validation
     */
    public boolean updateNews(News news, Admin admin) {
        // Validate admin permissions
        if (!admin.isFacultyAdmin() && !admin.isSuperAdmin()) {
            return false;
        }

        // Get existing news
        News existingNews = newsDAO.getNewsById(news.getId());
        if (existingNews == null) {
            return false;
        }

        // Faculty admin can only update their own faculty's news
        if (admin.isFacultyAdmin()) {
            if (existingNews.getFacultyId() == null || 
                !existingNews.getFacultyId().equals(admin.getFacultyId())) {
                return false;
            }
            // Ensure faculty ID doesn't change
            news.setFacultyId(admin.getFacultyId());
        }

        // Validate required fields
        if (news.getTitle() == null || news.getTitle().trim().isEmpty()) {
            return false;
        }
        if (news.getContent() == null || news.getContent().trim().isEmpty()) {
            return false;
        }

        return newsDAO.updateNews(news);
    }

    /**
     * Delete news with validation
     */
    public boolean deleteNews(int newsId, Admin admin) {
        // Validate admin permissions
        if (!admin.isFacultyAdmin() && !admin.isSuperAdmin()) {
            return false;
        }

        // Get existing news
        News existingNews = newsDAO.getNewsById(newsId);
        if (existingNews == null) {
            return false;
        }

        // Faculty admin can only delete their own faculty's news
        if (admin.isFacultyAdmin()) {
            if (existingNews.getFacultyId() == null || 
                !existingNews.getFacultyId().equals(admin.getFacultyId())) {
                return false;
            }
        }

        return newsDAO.deleteNews(newsId);
    }

    /**
     * Increment news views (if method exists in DAO)
     */
    public void incrementViews(int newsId) {
        // TODO: Implement incrementViews in NewsDAO if needed
        // newsDAO.incrementViews(newsId);
    }

    /**
     * Get news statistics for dashboard
     */
    public int getTotalNewsCount(Admin admin) {
        if (admin.isSuperAdmin()) {
            return newsDAO.getAllNews().size();
        } else if (admin.isFacultyAdmin()) {
            return newsDAO.getNewsByFaculty(admin.getFacultyId()).size();
        }
        return 0;
    }

    /**
     * Get recent news for dashboard
     */
    public List<News> getRecentNews(Admin admin, int limit) {
        List<News> allNews;
        
        if (admin.isSuperAdmin()) {
            allNews = newsDAO.getAllNews();
        } else if (admin.isFacultyAdmin()) {
            allNews = newsDAO.getNewsByFaculty(admin.getFacultyId());
        } else {
            return List.of();
        }

        // Return only the first 'limit' items
        return allNews.size() > limit ? allNews.subList(0, limit) : allNews;
    }
}
