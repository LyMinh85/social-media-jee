package com.example.socialmedia.routes.users;

import com.example.socialmedia.DAO.UserDAO;
import com.example.socialmedia.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/users/profile")
public class ProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long id = Long.parseLong(req.getParameter("id"));
        UserDAO userDAO = new UserDAO();
        User user = userDAO.findOne(id);
        req.setAttribute("user", user);
        req.getRequestDispatcher("/users/profile.jsp").forward(req, resp);
    }
}
