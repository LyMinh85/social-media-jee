package com.example.socialmedia.routes.auth;

import com.example.socialmedia.BeanValidator;
import com.example.socialmedia.DAO.UserDAO;
import com.example.socialmedia.DTO.SignInUserDTO;
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
import java.lang.reflect.InvocationTargetException;
import java.nio.charset.StandardCharsets;
import java.util.Set;

import static org.eclipse.tags.shaded.org.apache.xml.utils.XMLChar.isValid;

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
        try {
            SignInUserDTO userDTO = new SignInUserDTO();
            BeanUtils.populate(userDTO, req.getParameterMap());

            Set<ConstraintViolation<SignInUserDTO>> violations = BeanValidator.getValidator().validate(userDTO);
            // Nếu thông tin không hợp lệ, truyền thông báo lỗi vào trang JSP
        if (!violations.isEmpty()) {
            req.setAttribute("violations", violations);
        }
       // Nếu dữ liệu hợp lệ
        if (violations.isEmpty()) {
        // Tìm User trong db theo email sử dụng UserDAO
            UserDAO userDAO = new UserDAO();
            User user = new User();
            user = userDAO.findByEmail(userDTO.getEmail());
            System.out.println(userDTO.getEmail());
            System.out.println(userDTO);

            if (user == null) {
                // Nếu ko tìm thấy User => Hiển thị thông báo User ko tồn tại
                req.setAttribute("errorMessage", "Email hoặc mật khẩu không đúng");
            } else {
                //  Hash password người dùng nhập vào
                String hashedPassword = Hashing.sha256()
                        .hashString(userDTO.getPassword(), StandardCharsets.UTF_8)
                        .toString();
                //  So sánh với User.password
                if (!hashedPassword.equals(user.getPassword())) {
                    //      Nếu khác => Hiển thị thông báo email hoặc mật khẩu không đúng
                    req.setAttribute("errorMessage", "Email hoặc mật khẩu không đúng");
                } else {
                    //      Nếu giống => Lưu User vào session => Chuyển sang trang hom
                    req.getSession().setAttribute("user", user);
                    resp.sendRedirect(req.getContextPath() + "/");
                    return;
                }
            }
        }


        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        req.getRequestDispatcher("/auth/sign-in.jsp").forward(req, resp);
    }
}
