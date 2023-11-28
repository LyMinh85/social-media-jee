package com.example.socialmedia.DAO;

import com.example.socialmedia.entity.JpaManager;
import com.example.socialmedia.entity.Post;
import jakarta.persistence.EntityManager;

import javax.swing.text.html.parser.Entity;

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
}
