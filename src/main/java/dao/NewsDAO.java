package dao;

import model.News;
import utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NewsDAO {

    private static final String BASE_SELECT = 
        "SELECT n.id, n.faculty_id, n.author_id, n.title, n.content, n.thumbnail, n.views, " +
        "n.created_date, n.created_at, n.updated_at, " +
        "f.name as faculty_name, a.full_name as author_name " +
        "FROM news n " +
        "LEFT JOIN faculty f ON n.faculty_id = f.id " +
        "LEFT JOIN admin a ON n.author_id = a.id ";

    /**
     * Get all news (Super Admin only)
     */
    public List<News> getAllNews() {
        List<News> newsList = new ArrayList<>();
        String sql = BASE_SELECT + "ORDER BY n.created_date DESC";
        
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                newsList.add(extractNewsFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return newsList;
    }

    /**
     * Get news by faculty (for Faculty Admin)
     */
    public List<News> getNewsByFaculty(int facultyId) {
        List<News> newsList = new ArrayList<>();
        String sql = BASE_SELECT + "WHERE n.faculty_id = ? OR n.faculty_id IS NULL ORDER BY n.created_date DESC";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, facultyId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    newsList.add(extractNewsFromResultSet(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return newsList;
    }

    /**
     * Get latest news for public display
     */
    public List<News> getLatestNews(int limit) {
        List<News> newsList = new ArrayList<>();
        String sql = BASE_SELECT + "ORDER BY n.created_date DESC LIMIT ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, limit);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    newsList.add(extractNewsFromResultSet(rs));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return newsList;
    }

    /**
     * Get news by ID
     */
    public News getNewsById(int id) {
        String sql = BASE_SELECT + "WHERE n.id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return extractNewsFromResultSet(rs);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Create news
     */
    public boolean createNews(News news) {
        String sql = "INSERT INTO news (faculty_id, author_id, title, content, thumbnail, created_date, views) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            if (news.getFacultyId() != null) {
                stmt.setInt(1, news.getFacultyId());
            } else {
                stmt.setNull(1, Types.INTEGER);
            }
            
            stmt.setInt(2, news.getAuthorId());
            stmt.setString(3, news.getTitle());
            stmt.setString(4, news.getContent());
            stmt.setString(5, news.getThumbnail());
            stmt.setDate(6, news.getCreatedDate());
            stmt.setInt(7, news.getViews()); // Add views to insert
            
            int rowsAffected = stmt.executeUpdate();
            
            if (rowsAffected > 0) {
                try (ResultSet rs = stmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        news.setId(rs.getInt(1));
                    }
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Update news
     */
    public boolean updateNews(News news) {
        String sql = "UPDATE news SET faculty_id = ?, title = ?, content = ?, thumbnail = ?, created_date = ?, views = ? " +
                     "WHERE id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            if (news.getFacultyId() != null) {
                stmt.setInt(1, news.getFacultyId());
            } else {
                stmt.setNull(1, Types.INTEGER);
            }
            
            stmt.setString(2, news.getTitle());
            stmt.setString(3, news.getContent());
            stmt.setString(4, news.getThumbnail());
            stmt.setDate(5, news.getCreatedDate());
            stmt.setInt(6, news.getViews()); // Add views to update
            stmt.setInt(7, news.getId());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * Delete news
     */
    public boolean deleteNews(int id) {
        String sql = "DELETE FROM news WHERE id = ?";
        
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
     * Extract News object from ResultSet
     */
    private News extractNewsFromResultSet(ResultSet rs) throws SQLException {
        News news = new News();
        news.setId(rs.getInt("id"));
        
        Integer facultyId = rs.getObject("faculty_id", Integer.class);
        news.setFacultyId(facultyId);
        
        news.setAuthorId(rs.getInt("author_id"));
        news.setTitle(rs.getString("title"));
        news.setContent(rs.getString("content"));
        news.setThumbnail(rs.getString("thumbnail"));
        news.setViews(rs.getInt("views")); // Extract views
        news.setCreatedDate(rs.getDate("created_date"));
        news.setCreatedAt(rs.getTimestamp("created_at"));
        news.setUpdatedAt(rs.getTimestamp("updated_at"));
        news.setFacultyName(rs.getString("faculty_name"));
        news.setAuthorName(rs.getString("author_name"));
        
        return news;
    }

    /**
     * @deprecated Use createNews instead for clarity.
     */
    @Deprecated
    public boolean addNews(News news) {
        return createNews(news);
    }
}
