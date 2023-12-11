package com.example.socialmedia.helper;

import com.google.gson.Gson;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

public class Helper {
    public static String IMAGES_PATH = "/images";

    public static void responseJson(HttpServletResponse resp, Object object) throws IOException {
        String json = new Gson().toJson(object);
        PrintWriter out = resp.getWriter();
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        out.print(json);
        out.flush();
    }
}
