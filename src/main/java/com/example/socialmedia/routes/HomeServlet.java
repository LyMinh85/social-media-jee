package com.example.socialmedia.routes;


import com.example.socialmedia.DAO.FriendshipDAO;
import com.example.socialmedia.DAO.PostDAO;
import com.example.socialmedia.DTO.FriendDTO;
import com.example.socialmedia.DTO.PostDTO;
import com.example.socialmedia.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PostDAO postDAO = new PostDAO();
        User user = (User) req.getSession().getAttribute("user");

        List<PostDTO> posts = new ArrayList<>();
        if (user == null) {
            posts = postDAO.findAll();
        } else {
            posts = postDAO.findAll(user);
            FriendshipDAO friendshipDAO = new FriendshipDAO();
            List<FriendDTO> requestFriends = friendshipDAO.getRequestFriends(user.getId());
            req.setAttribute("requestFriends", requestFriends);
        }
        req.setAttribute("posts", posts);

        req.getRequestDispatcher("home.jsp").forward(req, resp);
    }


}
