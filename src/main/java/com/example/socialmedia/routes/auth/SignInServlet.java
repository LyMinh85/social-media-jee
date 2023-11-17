package com.example.socialmedia.routes.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/auth/sign-in")
public class SignInServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Render file jsp
        req.getRequestDispatcher("/auth/sign-in.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Đổ dữ liệu parameter vào UserDTO bằng BeanUItils
        // <...your code...>

        // Kiểm tra email và password người dùng nhập có hợp lệ hay không
        // <...your code...>

        // Nếu không hợp lệ thì truyền các thông báo lỗi vào jsp
        // <...your code...>

        // Nếu dữ liệu hợp lệ
        // Tìm User trong db theo email sử dụng UserDAO
        // Nếu ko tìm thấy User => Hiển thị thông báo User ko tồn tại
        // Nếu tìm thấy
        //  Hash password người dùng nhập vào
        //  So sánh với User.password
        //  Nếu 2 cái pass khác nhau
        //      Nếu sai => Hiển thị thông báo email hoặc mật khẩu không đúng
        //      Nếu đúng => Lưu User vào session => Chuyển sang trang hom
        // <...your code...>

        req.getRequestDispatcher("/auth/sign-in.jsp").forward(req, resp);
    }
}
