package com.example.socialmedia.routes.api;

import com.example.socialmedia.DAO.FriendshipDAO;
import com.example.socialmedia.DAO.UserDAO;
import com.example.socialmedia.DTO.FriendDTO;
import com.example.socialmedia.DTO.UserDTO;
import com.example.socialmedia.entity.User;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/api/friends")
public class FriendsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        FriendshipDAO friendshipDAO = new FriendshipDAO();
        User user = (User) req.getSession().getAttribute("user");
        List<FriendDTO> friends = new ArrayList<>();
        if (user != null) {
            String name = req.getParameter("q");
            friends = friendshipDAO.getFriendsFilterByName(user.getId(), name);
            System.out.println(friends);
        }
        String usersJsonString = new Gson().toJson(friends);
        PrintWriter out = resp.getWriter();
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        out.print(usersJsonString);
        out.flush();
    }
}
