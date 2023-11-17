package com.example.socialmedia.routes.auth;

import com.example.socialmedia.BeanValidator;
import com.example.socialmedia.DAO.UserDAO;
import com.example.socialmedia.DTO.SignUpUserDTO;
import com.example.socialmedia.entity.User;
import com.google.common.hash.Hashing;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.ConstraintViolation;
import org.apache.commons.beanutils.BeanUtils;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Set;

@WebServlet("/auth/sign-up")
public class SignUpServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/auth/sign-up.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String rePassword = req.getParameter("re-password");
        try {
            boolean error = false;
            // Đổ dữ liệu input vào DTO
            SignUpUserDTO userDTO = new SignUpUserDTO();
            BeanUtils.populate(userDTO, req.getParameterMap());

            // Kiểm tra các thuộc tính email, username, password, gender có
            // hợp lệ hay không
            Set<ConstraintViolation<SignUpUserDTO>> violations = BeanValidator.getValidator().validate(userDTO);
            // Nếu tồn tại ít nhất 1 dữ liệu ko hợp lệ
            if (!violations.isEmpty()) {
                error = true;
                req.setAttribute("violations", violations);
            }

            // Kiểm tra mật khẩu nhập lại có đúng hay không
            if (!userDTO.getPassword().equals(rePassword)) {
                req.setAttribute("invalidRePassword", true);
                error = true;
            }
            // Truyền dữ liệu đã nhập vào jsp
            req.setAttribute("user", userDTO);

            // Tất cả dữ liệu đều hợp lệ
            if (!error) {
                UserDAO userDAO = new UserDAO();
                // Mã hóa mật khẩu
                String hashedPassword = Hashing.sha256()
                        .hashString(userDTO.getPassword(), StandardCharsets.UTF_8)
                        .toString();

                // Đổ dữ liệu vào user entity và gán mật khẩu đã mã hóa vào
                User user = new User();
                BeanUtils.populate(user, req.getParameterMap());
                user.setPassword(hashedPassword);

                // Thực hiện tạo tài khoản mới
                try {
                    boolean success = userDAO.createOne(user);
                    // Đăng ký thành công
                    if (success) {
                        resp.sendRedirect(req.getContextPath() + "/");
                        return;
                    } else { // Thất bại
                        req.setAttribute("errorMessage", "Opps, xảy ra lỗi");
                    }
                } catch (Exception e) { // Email đã tồn tại
                    req.setAttribute("errorMessage", "Email đã tồn tại");
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        // Render UI
        req.getRequestDispatcher("/auth/sign-up.jsp").forward(req, resp);
    }
}
