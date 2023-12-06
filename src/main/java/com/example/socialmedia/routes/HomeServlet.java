package com.example.socialmedia.routes;


import com.example.socialmedia.DAO.PostDAO;
import com.example.socialmedia.entity.Post;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/home"})
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PostDAO postDAO = new PostDAO();
        List<Post> posts = postDAO.findAll();

        req.setAttribute("posts", posts);

        req.getRequestDispatcher("home.jsp").forward(req, resp);
    }


}
