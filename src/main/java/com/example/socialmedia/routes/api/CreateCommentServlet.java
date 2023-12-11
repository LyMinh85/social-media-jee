package com.example.socialmedia.routes.api;

import com.example.socialmedia.BeanValidator;
import com.example.socialmedia.DAO.CommentDAO;
import com.example.socialmedia.DAO.PostDAO;
import com.example.socialmedia.DTO.*;
import com.example.socialmedia.entity.Comment;
import com.example.socialmedia.entity.Post;
import com.example.socialmedia.entity.User;
import com.example.socialmedia.helper.Helper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.ConstraintViolation;
import org.apache.commons.beanutils.BeanUtils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@WebServlet("/api/comments")
public class CreateCommentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (user == null) {
            // Chưa đăng nhập
            resp.sendRedirect(req.getContextPath() + "/auth/sign-in");
            return;
        }
        try {

            boolean error = false;

            System.out.println(req.getParameter("content"));

            CreateCommentDTO createCommentDTO = new CreateCommentDTO();
            BeanUtils.populate(createCommentDTO, req.getParameterMap());


            Set<ConstraintViolation<CreateCommentDTO>> violations =
                    BeanValidator.getValidator().validate(createCommentDTO);
            if (!violations.isEmpty()) {
                List<ErrorMessageDTO> errorMessages = new ArrayList<>();
                violations.forEach(violation -> {
                    errorMessages.add(new ErrorMessageDTO("content", violation.getMessage()));
                });
                Helper.responseJson(resp, errorMessages);
                return;
            }


            if (!error) {
                CommentDAO commentDAO = new CommentDAO();
                createCommentDTO.setUserId(user.getId());
                Comment comment = commentDAO.createComment(createCommentDTO);
                CommentDTO commentDTO = new CommentDTO();
                commentDTO.setId(comment.getCommentId());
                commentDTO.setContent(comment.getContent());
                commentDTO.setRelativeTime(comment.getCreateAt());
                commentDTO.setUserDTO(new UserDTO(comment.getUser().getId(), comment.getUser().getUsername(), comment.getUser().getAvatarImage()));
                if (comment != null) {
                    Helper.responseJson(resp, commentDTO);
                } else {
                    Helper.responseJson(resp, "AAAAA");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }

    }
}
