package com.example.socialmedia.DAO;

import com.example.socialmedia.DTO.FriendDTO;
import com.example.socialmedia.DTO.FriendRequestDTO;
import com.example.socialmedia.DTO.UserDTO;
import com.example.socialmedia.entity.*;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;

import java.util.ArrayList;
import java.util.List;

public class FriendshipDAO {
    // Tìm tất cả bạn bè của userId
    public List<FriendDTO> getFriends(int userId) {
        EntityManager em = JpaManager.getEntityManager();
        List<FriendDTO> friends = new ArrayList<>();
        try {
            JpaManager.beginTransaction(em);

            String sql = "SELECT NEW com.example.socialmedia.DTO.FriendDTO(user1.id, user1.username, status) as friend FROM Friendship WHERE user2.id = :userId AND status = :status " +
                    "UNION " +
                    "SELECT NEW com.example.socialmedia.DTO.FriendDTO(user2.id, user2.username, status) AS friend FROM Friendship WHERE user1.id = :userId AND status = :status";

            TypedQuery<FriendDTO> query = em.createQuery(sql, FriendDTO.class);
            query.setParameter("userId", userId);
            query.setParameter("status", FriendshipStatus.ACCEPTED);
            friends = query.getResultList();

            JpaManager.commitTransaction(em);
        } catch (Exception e) {
            e.printStackTrace();
            JpaManager.rollbackTransaction(em);
        } finally {
            JpaManager.closeEntityManager(em);
        }
        return friends;
    }

    public boolean sendFriendRequest(FriendRequestDTO friendRequestDTO) {
        EntityManager em = JpaManager.getEntityManager();

        try {
            JpaManager.beginTransaction(em);
            // Query user
            User sender = em.find(User.class, friendRequestDTO.getSenderId());
            User receiver = em.find(User.class, friendRequestDTO.getReceiverId());
            // Create new friendship
            FriendshipKey friendshipKey = new FriendshipKey();
            friendshipKey.setUser1Id(sender.getId());
            friendshipKey.setUser2Id(receiver.getId());
            Friendship friendship = new Friendship();
            friendship.setId(friendshipKey);
            friendship.setUser1(sender);
            friendship.setUser2(receiver);
            friendship.setStatus(FriendshipStatus.PENDING);
            // Save
            em.persist(friendship);
            JpaManager.commitTransaction(em);
            JpaManager.closeEntityManager(em);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            JpaManager.rollbackTransaction(em);
        } finally {
            JpaManager.closeEntityManager(em);
        }
        return false;
    }

    public boolean acceptFriendRequest(FriendRequestDTO friendRequestDTO, FriendshipStatus friendshipStatus) {
        EntityManager em = JpaManager.getEntityManager();

        try {
            JpaManager.beginTransaction(em);

            String sql = "SELECT f from Friendship as f" +
                    " where f.user1.id = :sender and f.user2.id = :receiver";

            TypedQuery<Friendship> query = em.createQuery(sql, Friendship.class);
            query.setParameter("sender", friendRequestDTO.getSenderId());
            query.setParameter("receiver", friendRequestDTO.getReceiverId());

            Friendship friendship = query.getSingleResult();

            if (friendship != null) {
                friendship.setStatus(FriendshipStatus.ACCEPTED);
                em.merge(friendship);
            }
            JpaManager.commitTransaction(em);
            JpaManager.closeEntityManager(em);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            JpaManager.rollbackTransaction(em);
        } finally {
            JpaManager.closeEntityManager(em);
        }
        return false;
    }

    public FriendshipStatus isFriend(Long userId1, Long userId2) {
        EntityManager em = JpaManager.getEntityManager();

        FriendshipStatus status = null;
        try {
            JpaManager.beginTransaction(em);

            String sql = "SELECT f.status FROM Friendship f " +
                    "WHERE (f.user1.id = :sender AND f.user2.id = :receiver) OR " +
                    "(f.user1.id = :receiver AND f.user2.id = :sender)";

            TypedQuery<FriendshipStatus> query = em.createQuery(sql, FriendshipStatus.class);
            query.setParameter("sender", userId1);
            query.setParameter("receiver", userId2);

            status = query.getSingleResult();

            JpaManager.commitTransaction(em);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JpaManager.closeEntityManager(em);
        }
        return status;
    }
}
