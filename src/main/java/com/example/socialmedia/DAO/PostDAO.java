package com.example.socialmedia.DAO;

import com.example.socialmedia.entity.JpaManager;
import com.example.socialmedia.entity.Post;
import com.example.socialmedia.entity.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import javax.swing.text.html.parser.Entity;
import java.util.ArrayList;
import java.util.List;

public class PostDAO {
    // Tạo hàm createPost()
    // Tự tìm hiểu giống createOne trong UserDAO :)
    public boolean createPost(Post post )throws Exception{
        EntityManager em = JpaManager.getEntityManager();

        try{
            JpaManager.beginTransaction(em);
            System.out.println(post);
            em.persist(post);
            JpaManager.commitTransaction(em);
            JpaManager.closeEntityManager(em);
            return true;
        }catch (Exception e){
            e.printStackTrace();
            JpaManager.rollbackTransaction(em);
            JpaManager.closeEntityManager(em);
        }
        return false;
    }

    public List<Post> findAll() {
        EntityManager em = JpaManager.getEntityManager();

        List<Post> posts = new ArrayList<>();
        try {
            JpaManager.beginTransaction(em);
            String queryString = "SELECT p from Post p order by p.id DESC ";
            TypedQuery<Post> query = em.createQuery(queryString, Post.class);
            posts = query.getResultList();
            JpaManager.commitTransaction(em);
            JpaManager.closeEntityManager(em);
        } catch (Exception e) {
            JpaManager.rollbackTransaction(em);
            JpaManager.closeEntityManager(em);
        }
        JpaManager.closeEntityManager(em);
        return posts;
    }

    public List<Post> findByUserId(Long userId) {
        EntityManager em = JpaManager.getEntityManager();

        List<Post> posts = new ArrayList<>();
        try {
            JpaManager.beginTransaction(em);
            String queryString = "SELECT p from Post p where p.user.id = :userId order by p.id DESC ";
            TypedQuery<Post> query = em.createQuery(queryString, Post.class);
            query.setParameter("userId", userId);
            posts = query.getResultList();
            JpaManager.commitTransaction(em);
            JpaManager.closeEntityManager(em);
        } catch (Exception e) {
            JpaManager.rollbackTransaction(em);
            JpaManager.closeEntityManager(em);
        }
        JpaManager.closeEntityManager(em);
        return posts;
    }
}
