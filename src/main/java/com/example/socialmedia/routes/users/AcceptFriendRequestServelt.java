package com.example.socialmedia.routes.users;

import com.example.socialmedia.DAO.FriendshipDAO;
import com.example.socialmedia.DAO.UserDAO;
import com.example.socialmedia.DTO.FriendRequestDTO;
import com.example.socialmedia.entity.FriendshipStatus;
import com.example.socialmedia.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.http.HttpRequest;

@WebServlet("/users/accept-friend-request")
public class AcceptFriendRequestServelt extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long userId = Long.parseLong(req.getParameter("id"));
        UserDAO userDAO = new UserDAO();
        User sender = userDAO.findOne(userId);
        User receiver = (User) req.getSession().getAttribute("user");

        if (receiver == null) {
            resp.sendRedirect(req.getContextPath() + "/home");
            return;
        }

        FriendRequestDTO friendRequestDTO = new FriendRequestDTO(sender.getId(), receiver.getId());
        FriendshipDAO friendshipDAO = new FriendshipDAO();
        friendshipDAO.acceptFriendRequest(friendRequestDTO);
        resp.sendRedirect(req.getContextPath() + "/users/friends");
    }
}
