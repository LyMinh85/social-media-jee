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
import java.lang.reflect.InvocationTargetException;
import java.nio.charset.StandardCharsets;
import java.util.Set;

@WebServlet("/auth/sign-in")
public class SignInServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/auth/sign-in.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            SignInDTO signInDTO = new SignInDTO();
            BeanUtils.populate(signInDTO, req.getParameterMap());

            Set<ConstraintViolation<SignInDTO>> violations = BeanValidator.getValidator().validate(signInDTO);

            if (!violations.isEmpty()) {
                req.setAttribute("violations", violations);
            }

            if(violations.isEmpty()) {
                UserDAO userDAO = new UserDAO();
                User user =  userDAO.findByEmail(signInDTO.getEmail());

                if (user == null){
                    req.setAttribute("errorMessage", "Tài khoản không tồn tại !");
                }
                else {
                    String hashWord = Hashing.sha256().hashString(signInDTO.getPassword(),
                            StandardCharsets.UTF_8).toString();
                    if (hashWord.equals(user.getPassword())){
                        req.getSession().setAttribute("user",user);
                        resp.sendRedirect(req.getContextPath() + "/home");
                        return;
                    }
                    else {
                        req.setAttribute("errorMessage", "Sai mật khẩu !");
                    }
                }
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        req.getRequestDispatcher("/auth/sign-in.jsp").forward(req, resp);
    }
}
