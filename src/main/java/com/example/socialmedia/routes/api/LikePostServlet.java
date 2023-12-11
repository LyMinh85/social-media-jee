package com.example.socialmedia.routes.api;

import com.example.socialmedia.DAO.PostDAO;
import com.example.socialmedia.DTO.LikePostDTO;
import com.example.socialmedia.entity.Post;
import com.example.socialmedia.entity.User;
import com.example.socialmedia.helper.Helper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;

@WebServlet("/api/likes")
public class LikePostServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long postId = Long.valueOf(req.getParameter("postId"));
        PostDAO postDAO = new PostDAO();
        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/auth/sign-in");
            return;
        }

        boolean isLiked = postDAO.isLiked(user, postId);

        System.out.println(isLiked);
        if (isLiked) {
            LikePostDTO likePostDTO = postDAO.unlikePost(user, postId);
            Helper.responseJson(resp, likePostDTO);
        } else {
            LikePostDTO likePostDTO = postDAO.likePost(user, postId);
            Helper.responseJson(resp, likePostDTO);
        }
    }
}
