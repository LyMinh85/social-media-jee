package com.example.socialmedia.routes.posts;


import com.example.socialmedia.BeanValidator;
import com.example.socialmedia.DAO.FriendshipDAO;
import com.example.socialmedia.DAO.PostDAO;
import com.example.socialmedia.DTO.CreatePostDTO;
import com.example.socialmedia.DTO.FriendDTO;
import com.example.socialmedia.entity.Post;
import com.example.socialmedia.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.ConstraintViolation;
import org.apache.commons.beanutils.BeanUtils;

import java.io.IOException;
import java.util.List;
import java.util.Set;

@WebServlet("/posts/create")
public class CreatePostServlet  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            // Chưa đăng nhập
            resp.sendRedirect(req.getContextPath() + "/auth/sign-in");
        } else {
            req.getRequestDispatcher("/posts/create-post.jsp").forward(req, resp);
        }

    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            // Chưa đăng nhập
            resp.sendRedirect(req.getContextPath() + "/auth/sign-in");
            return;
        }
        FriendshipDAO friendshipDAO = new FriendshipDAO();
        List<FriendDTO> requestFriends = friendshipDAO.getRequestFriends(user.getId());
        req.setAttribute("requestFriends", requestFriends);

        try {

            boolean error = false;

            CreatePostDTO postDTO = new CreatePostDTO();
            BeanUtils.populate(postDTO, req.getParameterMap());



            Set<ConstraintViolation<CreatePostDTO>> violations = BeanValidator.getValidator().validate(postDTO);
            if (!violations.isEmpty()) {
                error = true;
                req.setAttribute("violations", violations);
            }


            if (!error) {
                PostDAO postDAO = new PostDAO();
                Post post = new Post();
                BeanUtils.populate(post, req.getParameterMap());
                post.setUser(user);
                boolean result = postDAO.createPost(post);
                if (result) {
                    resp.sendRedirect(req.getContextPath() + "/");
                    return;
                } else {
                    req.setAttribute("errorMessage", "AAAAA");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        req.getRequestDispatcher("/posts/create-post.jsp").forward(req, resp);

    }
}
