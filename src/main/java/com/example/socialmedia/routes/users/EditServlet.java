package com.example.socialmedia.routes.users;

import com.example.socialmedia.BeanValidator;
import com.example.socialmedia.DAO.FriendshipDAO;
import com.example.socialmedia.DAO.UserDAO;
import com.example.socialmedia.DTO.EditUserDTO;
import com.example.socialmedia.DTO.FriendDTO;
import com.example.socialmedia.DTO.SignUpUserDTO;
import com.example.socialmedia.entity.AvatarImage;
import com.example.socialmedia.entity.Image;
import com.example.socialmedia.entity.User;
import com.example.socialmedia.helper.Helper;
import com.google.common.hash.Hashing;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jakarta.validation.ConstraintViolation;
import org.apache.commons.beanutils.BeanUtils;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Set;

@MultipartConfig()
@WebServlet("/users/edit")
public class EditServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/auth/sign-in");
            return;
        }

        FriendshipDAO friendshipDAO = new FriendshipDAO();
        List<FriendDTO> requestFriends = friendshipDAO.getRequestFriends(user.getId());
        req.setAttribute("requestFriends", requestFriends);

        req.setAttribute("editUserDTO", user);

        req.getRequestDispatcher("/users/edit.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/auth/sign-in");
            return;
        }

        FriendshipDAO friendshipDAO = new FriendshipDAO();
        List<FriendDTO> requestFriends = friendshipDAO.getRequestFriends(user.getId());
        req.setAttribute("requestFriends", requestFriends);


        try {
            boolean error = false;
            EditUserDTO editUserDTO = new EditUserDTO();
            BeanUtils.populate(editUserDTO, req.getParameterMap());

            // Kiểm tra các thuộc tính email, username, password, gender có
            // hợp lệ hay không
            Set<ConstraintViolation<EditUserDTO>> violations = BeanValidator.getValidator().validate(editUserDTO);
            // Nếu tồn tại ít nhất 1 dữ liệu ko hợp lệ
            if (!violations.isEmpty()) {
                error = true;
                req.setAttribute("violations", violations);
            }

            editUserDTO.setAvatarImage(user.getAvatarImage());
            // Truyền dữ liệu đã nhập vào jsp
            req.setAttribute("editUserDTO", editUserDTO);

            // Tất cả dữ liệu đều hợp lệ
            if (!error) {
                UserDAO userDAO = new UserDAO();

                // Đổ dữ liệu vào user entity
                BeanUtils.populate(user, req.getParameterMap());

                Part image = req.getPart("image");
                if (!image.getSubmittedFileName().isEmpty()) {
                    String imageUrl = Helper.IMAGES_PATH + image.getSubmittedFileName();
                    String filename = req.getServletContext().getRealPath(imageUrl);
                    System.out.println(imageUrl);
                    System.out.println(filename);
                    image.write(filename);
                    user.getAvatarImage().getImage().setUrl(imageUrl);
                }

                User updatedUser = userDAO.updateUser(user);

                if (updatedUser == null) {
                    req.setAttribute("errorMessage", "Oppps, lỗi gì đó");
                } else {
                    req.getSession().setAttribute("user", updatedUser);
                    resp.sendRedirect(req.getContextPath() + "/users/profile?id=" + user.getId());
                    return;
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }

        req.getRequestDispatcher("/users/edit.jsp").forward(req, resp);
    }
}
