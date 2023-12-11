package com.example.socialmedia.DAO;

import com.example.socialmedia.DTO.CreateCommentDTO;
import com.example.socialmedia.entity.Comment;
import com.example.socialmedia.entity.JpaManager;
import com.example.socialmedia.entity.Post;
import com.example.socialmedia.entity.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import org.checkerframework.checker.units.qual.C;

import java.util.ArrayList;
import java.util.List;

public class CommentDAO {

    public Comment createComment(CreateCommentDTO createCommentDTO)throws Exception{
        EntityManager em = JpaManager.getEntityManager();

        try{
            JpaManager.beginTransaction(em);

            Post post = em.find(Post.class, createCommentDTO.getPostId());
            User user = em.find(User.class, createCommentDTO.getUserId());
            Comment comment = new Comment();
            comment.setPost(post);
            comment.setUser(user);
            comment.setContent(createCommentDTO.getContent());

            em.persist(comment);

            post.setNumberOfComments(post.getNumberOfComments() + 1);
            em.merge(post);

            JpaManager.commitTransaction(em);
            JpaManager.closeEntityManager(em);
            return comment;
        }catch (Exception e){
            e.printStackTrace();
            JpaManager.rollbackTransaction(em);
            JpaManager.closeEntityManager(em);
        }
        return null;
    }

    public List<Comment> filterByPostId(Long postId) {
        EntityManager em = JpaManager.getEntityManager();

        List<Comment> comments = new ArrayList<>();
        try {
            JpaManager.beginTransaction(em);
            String queryString = """
                SELECT c from Comment c
                join c.user
                join c.user.avatarImage
                join c.user.avatarImage.image
                where c.post.id = :postId order by c.id ASC
            """;
            TypedQuery<Comment> query = em.createQuery(queryString, Comment.class);
            query.setParameter("postId", postId);
            comments = query.getResultList();
            JpaManager.commitTransaction(em);
        } catch (Exception e) {
            JpaManager.rollbackTransaction(em);
        }
        JpaManager.closeEntityManager(em);
        return comments;
    }
}
