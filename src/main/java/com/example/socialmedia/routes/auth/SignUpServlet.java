package com.example.socialmedia.routes.auth;

import com.example.socialmedia.BeanValidator;
import com.example.socialmedia.DAO.UserDAO;
import com.example.socialmedia.DTO.SignInDTO;
import com.example.socialmedia.DTO.SignUpDTO;
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/auth/sign-up.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            SignUpDTO signUpDTO = new SignUpDTO();
            BeanUtils.populate(signUpDTO, request.getParameterMap());

            Set<ConstraintViolation<SignUpDTO>> violations = BeanValidator.getValidator().validate(signUpDTO);

            if (!violations.isEmpty()) {
                request.setAttribute("violations", violations);
            }

            if (violations.isEmpty()) {
                UserDAO userDAO = new UserDAO();
                User user = new User();
                BeanUtils.populate(user, request.getParameterMap()); // đổ dữ liệu người dùng nhập vào
                String hashWord = Hashing.sha256().hashString(signUpDTO.getPassword(),
                        StandardCharsets.UTF_8).toString();
                user.setPassword(hashWord);
                user = userDAO.createUSer(user); // lưu vào cơ sở dữ liệu
                response.sendRedirect(request.getContextPath() + "/auth/sign-in");
                return;
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("/auth/sign-up.jsp").forward(request, response);
    }
}
