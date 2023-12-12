package com.example.socialmedia.routes.posts;

import com.example.socialmedia.DAO.CommentDAO;
import com.example.socialmedia.DAO.FriendshipDAO;
import com.example.socialmedia.DAO.PostDAO;
import com.example.socialmedia.DTO.FriendDTO;
import com.example.socialmedia.DTO.PostDTO;
import com.example.socialmedia.entity.Comment;
import com.example.socialmedia.entity.Post;
import com.example.socialmedia.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/posts/detail")
public class DetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long postId = Long.valueOf(req.getParameter("id"));
        PostDAO postDAO = new PostDAO();

        User user = (User) req.getSession().getAttribute("user");

        PostDTO post;
        if (user == null) {
            post = postDAO.findByPostId(postId);
        } else {
            post = postDAO.findByPostId(postId, user);
            FriendshipDAO friendshipDAO = new FriendshipDAO();
            List<FriendDTO> requestFriends = friendshipDAO.getRequestFriends(user.getId());
            req.setAttribute("requestFriends", requestFriends);
        }
        req.setAttribute("post", post);


        CommentDAO commentDAO = new CommentDAO();
        List<Comment> comments = commentDAO.filterByPostId(postId);
        req.setAttribute("comments", comments);

        req.getRequestDispatcher("/posts/detail.jsp").forward(req, resp);
    }
}
