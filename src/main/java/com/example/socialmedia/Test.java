package com.example.socialmedia;

import com.example.socialmedia.DAO.FriendshipDAO;
import com.example.socialmedia.DTO.UserDTO;
import com.example.socialmedia.entity.*;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;

import java.util.ArrayList;
import java.util.List;

public class Test {
    public void create() {
        EntityManager em = JpaManager.getEntityManager();

        User user = new User();
        user.setUsername("Nam");
        user.setPassword("123");
        user.setEmail("m@gmail.com");
        user.setGender("Nam");

        try {
            JpaManager.beginTransaction(em);
            // Tạo Entity
            user = user;
            // Insert vào CSDL
            em.persist(user);
            JpaManager.commitTransaction(em);
        } catch (Exception e) {
            JpaManager.rollbackTransaction(em);
        }

        System.out.println(user);
    }

    public static void findAll() {
        EntityManager em = JpaManager.getEntityManager();

        List<User> users = new ArrayList<>();

        try {
            JpaManager.beginTransaction(em);
            String queryString = "SELECT u from User u";
            TypedQuery<User> query = em.createQuery(queryString, User.class);
            users = query.getResultList();
            JpaManager.commitTransaction(em);
        } catch (Exception e) {
            JpaManager.rollbackTransaction(em);
        }

        users.forEach(System.out::println);
    }

    public static User findOne(int id) {
        EntityManager em = JpaManager.getEntityManager();

        User user = null;
        try {
            JpaManager.beginTransaction(em);
            String queryString = "SELECT u from User u where id = :id";
            TypedQuery<User> query = em.createQuery(queryString, User.class);
            query.setParameter("id", id);
            user = query.getSingleResult();
            JpaManager.commitTransaction(em);
        } catch (Exception e) {
            JpaManager.rollbackTransaction(em);
        }
        JpaManager.closeEntityManager(em);
        return user;
    }

    public static void makeFriend(int idUser1, int idUser2) {
        EntityManager em = JpaManager.getEntityManager();

        try {
            JpaManager.beginTransaction(em);
            User user1 = em.find(User.class, idUser1);
            User user2 = em.find(User.class, idUser2);
            FriendshipKey friendshipKey = new FriendshipKey();
            friendshipKey.setUser1Id(user1.getId());
            friendshipKey.setUser2Id(user2.getId());
            Friendship friendship = new Friendship();
            friendship.setId(friendshipKey);
            friendship.setUser1(user1);
            friendship.setUser2(user2);
            friendship.setStatus(FriendshipStatus.PENDING);
            em.persist(friendship);
            JpaManager.commitTransaction(em);
        } catch (Exception e) {
            e.printStackTrace();
            JpaManager.rollbackTransaction(em);
        }
    }

    public static void createPost(Post post, int idUser) {
        EntityManager em = JpaManager.getEntityManager();
        Post newPost = null;
        try {
            JpaManager.beginTransaction(em);
            User user = em.find(User.class, idUser);
            newPost = post;
            newPost.setUser(user);
            em.persist(newPost);
            JpaManager.commitTransaction(em);
        } catch (Exception e) {
            e.printStackTrace();
            JpaManager.rollbackTransaction(em);
        }
    }

    public static void likePost(int postId, int userId) {
        EntityManager em = JpaManager.getEntityManager();
        try {
            JpaManager.beginTransaction(em);
            Post post = em.find(Post.class, postId);
            User user = em.find(User.class, userId);
            Like like = new Like();
            like.setPost(post);
            like.setUser(user);
            em.persist(like);
            JpaManager.commitTransaction(em);
        } catch (Exception e) {
            e.printStackTrace();
            JpaManager.rollbackTransaction(em);
        }
    }

    public static void main(String[] args) {

    }
}
