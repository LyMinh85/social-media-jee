package com.example.socialmedia.DAO;

import com.example.socialmedia.DTO.UserDTO;
import com.example.socialmedia.entity.AvatarImage;
import com.example.socialmedia.entity.Image;
import com.example.socialmedia.entity.JpaManager;
import com.example.socialmedia.entity.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    public boolean createOne(User user) throws Exception {
        EntityManager em = JpaManager.getEntityManager();
        User found = findByEmail(user.getEmail());
        if (found != null) {
            throw new Exception("Email đã tồn tại");
        }

        try {
            JpaManager.beginTransaction(em);
            // Thêm hình đại diện mặc định
            AvatarImage avatarImage = em.find(AvatarImage.class, 1);
            user.setAvatarImage(avatarImage);
            // Insert vào CSDL
            em.persist(user);
            JpaManager.commitTransaction(em);
            JpaManager.closeEntityManager(em);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            JpaManager.rollbackTransaction(em);
            JpaManager.closeEntityManager(em);
        }
        return false;
    }

    public User findOne(Long id) {
        EntityManager em = JpaManager.getEntityManager();

        User user = null;
        try {
            JpaManager.beginTransaction(em);
            String queryString = "SELECT u from User u where id = :id";
            TypedQuery<User> query = em.createQuery(queryString, User.class);
            query.setParameter("id", id);
            user = query.getSingleResult();
            JpaManager.commitTransaction(em);
            JpaManager.closeEntityManager(em);
        } catch (Exception e) {
            JpaManager.rollbackTransaction(em);
            JpaManager.closeEntityManager(em);
        }
        JpaManager.closeEntityManager(em);
        return user;
    }

    public User findByEmail(String email) {
        EntityManager em = JpaManager.getEntityManager();
        User user = null;
        try {
            JpaManager.beginTransaction(em);
            String queryString = "SELECT u from User u where email = :email";
            TypedQuery<User> query = em.createQuery(queryString, User.class);
            query.setParameter("email", email);
            user = query.getSingleResult();
            JpaManager.commitTransaction(em);
        } catch (Exception e) {
            JpaManager.rollbackTransaction(em);
        } finally {
            JpaManager.closeEntityManager(em);
        }
        return user;
    }

    public List<UserDTO> filterByName(String name) {
        EntityManager em = JpaManager.getEntityManager();
        List<UserDTO> users = new ArrayList<>();
        try {
            JpaManager.beginTransaction(em);
            String queryString = "SELECT NEW com.example.socialmedia.DTO.UserDTO(u.id, u.username) from User u where username like :username";
            TypedQuery<UserDTO> query = em.createQuery(queryString, UserDTO.class);
            query.setParameter("username", "%" + name + "%");
            users = query.getResultList();
            JpaManager.commitTransaction(em);
        } catch (Exception e) {
            e.printStackTrace();
            JpaManager.rollbackTransaction(em);
        } finally {
            JpaManager.closeEntityManager(em);
        }
        return users;
    }

    public Image createImage(String url) {
        EntityManager em = JpaManager.getEntityManager();

        Image image = null;
        try {
            JpaManager.beginTransaction(em);

            image = new Image();
            image.setUrl(url);
            em.persist(image);

            JpaManager.commitTransaction(em);
        } catch (Exception e) {
            e.printStackTrace();
            JpaManager.rollbackTransaction(em);
        } finally {
            JpaManager.closeEntityManager(em);
        }
        return image;
    }

    public AvatarImage createAvatarImage(Long imageId) {
        EntityManager em = JpaManager.getEntityManager();

        AvatarImage avatarImage = null;
        try {
            JpaManager.beginTransaction(em);

            Image image = em.find(Image.class, imageId);

            avatarImage = new AvatarImage();
            avatarImage.setAvatarImageId(imageId);
            avatarImage.setImage(image);
            em.persist(avatarImage);

            JpaManager.commitTransaction(em);
        } catch (Exception e) {
            e.printStackTrace();
            JpaManager.rollbackTransaction(em);
        } finally {
            JpaManager.closeEntityManager(em);
        }
        return avatarImage;
    }

    public User updateUser(User user) {
        Image image = createImage(user.getAvatarImage().getImage().getUrl());
        AvatarImage avatarImage = createAvatarImage(image.getId());

        EntityManager em = JpaManager.getEntityManager();

        User updatedUser = null;
        try {
            JpaManager.beginTransaction(em);

            updatedUser = em.merge(user);
            updatedUser.setAvatarImage(avatarImage);
            em.merge(user.getAvatarImage());

            JpaManager.commitTransaction(em);
        } catch (Exception e) {
            e.printStackTrace();
            JpaManager.rollbackTransaction(em);
        } finally {
            JpaManager.closeEntityManager(em);
        }
        return updatedUser;
    }
}
