package com.example.socialmedia.routes.users;

import com.example.socialmedia.DAO.FriendshipDAO;
import com.example.socialmedia.DAO.UserDAO;
import com.example.socialmedia.DTO.FriendRequestDTO;
import com.example.socialmedia.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/users/remove-friend")
public class RemoveFriendServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long userId = Long.parseLong(req.getParameter("id"));
        UserDAO userDAO = new UserDAO();
        User receiver = userDAO.findOne(userId);
        User sender = (User) req.getSession().getAttribute("user");

        if (sender == null) {
            resp.sendRedirect(req.getContextPath() + "/home");
            return;
        }

        FriendRequestDTO friendRequestDTO = new FriendRequestDTO(sender.getId(), receiver.getId());
        FriendshipDAO friendshipDAO = new FriendshipDAO();
        friendshipDAO.removeFriend(friendRequestDTO);
        resp.sendRedirect(req.getContextPath() + "/users/friends");
    }
}
