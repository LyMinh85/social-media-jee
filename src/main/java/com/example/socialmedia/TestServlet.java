package com.example.socialmedia;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/test")
public class TestServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


//        FriendshipDAO friendshipDAO = new FriendshipDAO();
//        User user = (User) req.getSession().getAttribute("user");
//        if (user == null) {
//            resp.sendRedirect(req.getContextPath() + "/auth/sign-in");
//            return;
//        }

//        List<FriendDTO> friends = friendshipDAO.getRequestFriends(7L, FriendshipStatus.PENDING);
//        resp.setContentType("application/json");
//        resp.getWriter().write(new Gson().toJson(friends));
    }
}
