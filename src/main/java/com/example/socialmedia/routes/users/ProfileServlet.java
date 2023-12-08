package com.example.socialmedia.routes.users;

import com.example.socialmedia.DAO.FriendshipDAO;
import com.example.socialmedia.DAO.PostDAO;
import com.example.socialmedia.DAO.UserDAO;
import com.example.socialmedia.entity.FriendshipStatus;
import com.example.socialmedia.entity.Post;
import com.example.socialmedia.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/users/profile")
public class ProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        long userId = Long.parseLong(req.getParameter("id"));
        UserDAO userDAO = new UserDAO();
        User userProfile = userDAO.findOne(userId);
        req.setAttribute("userProfile", userProfile);

        PostDAO postDAO = new PostDAO();
        List<Post> posts = postDAO.findByUserId(userId);
        req.setAttribute("posts", posts);

        User currentLoginUser = (User) req.getSession().getAttribute("user");
        if (currentLoginUser != null) {
            FriendshipDAO friendshipDAO = new FriendshipDAO();
            FriendshipStatus friendshipStatus = friendshipDAO.isFriend(userProfile.getId(), currentLoginUser.getId());
            req.setAttribute("friendshipStatus", friendshipStatus);
            System.out.println(friendshipStatus);
        }

        req.getRequestDispatcher("/users/profile.jsp").forward(req, resp);
    }
}
