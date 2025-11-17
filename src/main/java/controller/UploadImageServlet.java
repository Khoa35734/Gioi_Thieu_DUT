package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/upload-image")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,       // 10MB
    maxRequestSize = 1024 * 1024 * 50     // 50MB
)
public class UploadImageServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads/news-content";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy đường dẫn thực tế để lưu file
        String applicationPath = request.getServletContext().getRealPath("");
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

        // Tạo thư mục nếu chưa tồn tại
        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        String fileName = null;

        // Lấy file upload
        Part filePart = request.getPart("upload"); // "upload" là tên field từ CKEditor

        if (filePart != null) {
            fileName = getFileName(filePart);

            // Tạo tên file unique
            String uniqueFileName = System.currentTimeMillis() + "_" + fileName;
            String filePath = uploadFilePath + File.separator + uniqueFileName;

            // Lưu file
            filePart.write(filePath);

            // Trả về URL của ảnh cho CKEditor
            String fileUrl = request.getContextPath() + "/" + UPLOAD_DIR + "/" + uniqueFileName;

            // Response theo format của CKEditor
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();

            // CKEditor 4 format
            out.print("{");
            out.print("\"uploaded\": 1,");
            out.print("\"fileName\": \"" + uniqueFileName + "\",");
            out.print("\"url\": \"" + fileUrl + "\"");
            out.print("}");
            out.flush();
        }
    }

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] tokens = contentDisposition.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}

