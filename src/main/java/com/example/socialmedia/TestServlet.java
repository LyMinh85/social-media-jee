package com.example.socialmedia;

import com.example.socialmedia.DAO.FriendshipDAO;
import com.example.socialmedia.DTO.FriendDTO;
import com.example.socialmedia.DTO.UserDTO;
import com.example.socialmedia.entity.Like;
import com.example.socialmedia.entity.User;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/test")
public class TestServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        FriendshipDAO friendshipDAO = new FriendshipDAO();
        List<FriendDTO> friends = friendshipDAO.getFriends(1);
        resp.setContentType("application/json");
        resp.getWriter().write(new Gson().toJson(friends));
    }
}
