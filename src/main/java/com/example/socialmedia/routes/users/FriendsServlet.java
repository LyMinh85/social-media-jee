package com.example.socialmedia.routes.users;

import com.example.socialmedia.DAO.FriendshipDAO;
import com.example.socialmedia.DTO.FriendDTO;
import com.example.socialmedia.entity.FriendshipStatus;
import com.example.socialmedia.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/users/friends")
public class FriendsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/auth/sign-in");
            return;
        }
        FriendshipDAO friendshipDAO = new FriendshipDAO();
        List<FriendDTO> friends = friendshipDAO.getFriends(user.getId());
        List<FriendDTO> requestFriends = friendshipDAO.getRequestFriends(user.getId());
        req.setAttribute("friends", friends);
        req.setAttribute("requestFriends", requestFriends);

        req.getRequestDispatcher("/users/friends.jsp").forward(req, resp);
    }
}
