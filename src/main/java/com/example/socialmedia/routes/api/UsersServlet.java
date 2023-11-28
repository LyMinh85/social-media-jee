package com.example.socialmedia.routes.api;

import com.example.socialmedia.DAO.UserDAO;
import com.example.socialmedia.DTO.UserDTO;
import com.example.socialmedia.entity.User;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/api/users")
public class UsersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();
        String name = req.getParameter("q");
//        List<UserDTO> users = userDAO.filterByName(name);
//        String usersJsonString = new Gson().toJson(users);
//        PrintWriter out = resp.getWriter();
//        resp.setContentType("application/json");
//        resp.setCharacterEncoding("UTF-8");
//        out.print(usersJsonString);
//        out.flush();
    }
}
