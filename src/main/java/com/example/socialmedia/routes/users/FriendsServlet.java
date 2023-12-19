package com.example.socialmedia.routes.users;

import com.example.socialmedia.DAO.FriendshipDAO;
import com.example.socialmedia.DTO.FriendDTO;
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/auth/sign-in");
            return;
        }
        FriendshipDAO friendshipDAO = new FriendshipDAO();
        List<FriendDTO> friends = friendshipDAO.getFriends(user.getId());
        List<FriendDTO> requestFriends = friendshipDAO.getRequestFriends(user.getId());
        request.setAttribute("friends", friends);
        request.setAttribute("requestFriends", requestFriends);

        request.getRequestDispatcher("/users/friends.jsp").forward(request, response);
    }
}
