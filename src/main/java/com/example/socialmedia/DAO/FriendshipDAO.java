package com.example.socialmedia.DAO;

import com.example.socialmedia.DTO.FriendDTO;
import com.example.socialmedia.DTO.FriendRequestDTO;
import com.example.socialmedia.entity.*;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.util.ArrayList;
import java.util.List;

public class FriendshipDAO {

    public  List<FriendDTO> getFriends(Long userId){
        EntityManager entityManager = JpaManager.getEntityManager();
        List<FriendDTO> friends = new ArrayList<>();

        try {
            JpaManager.beginTransaction(entityManager);

            String sql = """
                    SELECT NEW com.example.socialmedia.DTO.FriendDTO(fs.user1.id, fs.user1.username, fs.user1.avatarImage, fs.status) as friend
                    FROM Friendship fs
                    join fs.user1
                    join fs.user1.avatarImage
                    WHERE fs.user2.id = :userId AND fs.status = :status
                    UNION
                    SELECT NEW com.example.socialmedia.DTO.FriendDTO(fs.user2.id, fs.user2.username, fs.user2.avatarImage, fs.status) as friend
                    FROM Friendship fs
                    join fs.user2
                    join fs.user2.avatarImage
                    WHERE fs.user1.id = :userId AND fs.status = :status
                    """;

            TypedQuery<FriendDTO> query = entityManager.createQuery(sql, FriendDTO.class);
            query.setParameter("userId", userId);
            query.setParameter("status", FriendshipStatus.ACCEPTED);
            friends = query.getResultList();

            JpaManager.commitTransaction(entityManager);
        } catch (Exception e) {
            e.printStackTrace();
            JpaManager.rollbackTransaction(entityManager);
        } finally {
            JpaManager.closeEntityManager(entityManager);
        }
        return friends;
    }
    public List<FriendDTO> getFriendsFilterByName(Long userId, String name) {
        EntityManager em = JpaManager.getEntityManager();
        List<FriendDTO> friends = new ArrayList<>();
        try {
            JpaManager.beginTransaction(em);

            String sql = """
                    SELECT NEW com.example.socialmedia.DTO.FriendDTO(f.user1.id, f.user1.username, f.user1.avatarImage, f.status) as friend
                    FROM Friendship f
                    join f.user1
                    join f.user1.avatarImage
                    WHERE f.user2.id = :userId AND f.status = :status AND f.user1.username like :name
                    UNION
                    SELECT NEW com.example.socialmedia.DTO.FriendDTO(f.user2.id, f.user2.username, f.user2.avatarImage, f.status) AS friend
                    FROM Friendship f
                    join f.user2
                    join f.user2.avatarImage
                    WHERE f.user1.id = :userId AND f.status = :status AND f.user2.username like :name
                    """;

            TypedQuery<FriendDTO> query = em.createQuery(sql, FriendDTO.class);
            query.setParameter("userId", userId);
            query.setParameter("status", FriendshipStatus.ACCEPTED);
            query.setParameter("name", "%" + name + "%");
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

    public List<FriendDTO> getRequestFriends(Long userId) {
        EntityManager em = JpaManager.getEntityManager();
        List<FriendDTO> friends = new ArrayList<>();
        try {
            JpaManager.beginTransaction(em);

            String sql = """
                    SELECT NEW com.example.socialmedia.DTO.FriendDTO(f.user1.id, f.user1.username, f.user1.avatarImage, f.status) as friend
                    FROM Friendship f
                    join f.user1
                    join f.user1.avatarImage
                    WHERE f.user2.id = :userId AND f.status = :status
                    """;

            TypedQuery<FriendDTO> query = em.createQuery(sql, FriendDTO.class);
            query.setParameter("userId", userId);
            query.setParameter("status", FriendshipStatus.PENDING);
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

    public boolean acceptFriendRequest(FriendRequestDTO friendRequestDTO) {
        EntityManager em = JpaManager.getEntityManager();

        try {
            JpaManager.beginTransaction(em);

            String sql = "SELECT f from Friendship as f" +
                    " where f.user1.id = :sender and f.user2.id = :receiver";

            TypedQuery<Friendship> query = em.createQuery(sql, Friendship.class);
            query.setParameter("sender", friendRequestDTO.getSenderId());
            query.setParameter("receiver", friendRequestDTO.getReceiverId());

            Friendship friendship = query.getSingleResult();

            System.out.println(friendship);

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

    public void rejectFriendRequest(FriendRequestDTO friendRequestDTO) {
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
                em.remove(friendship);
            }
            JpaManager.commitTransaction(em);
        } catch (Exception e) {
            e.printStackTrace();
            JpaManager.rollbackTransaction(em);
        } finally {
            JpaManager.closeEntityManager(em);
        }
    }

    public void removeFriend(FriendRequestDTO friendRequestDTO) {
        EntityManager em = JpaManager.getEntityManager();

        try {
            JpaManager.beginTransaction(em);

            String sql = "SELECT f FROM Friendship f " +
                    "WHERE (f.user1.id = :sender AND f.user2.id = :receiver) OR " +
                    "(f.user1.id = :receiver AND f.user2.id = :sender)";

            TypedQuery<Friendship> query = em.createQuery(sql, Friendship.class);
            query.setParameter("sender", friendRequestDTO.getSenderId());
            query.setParameter("receiver", friendRequestDTO.getReceiverId());

            Friendship friendship = query.getSingleResult();

            if (friendship != null) {
                em.remove(friendship);
            }

            JpaManager.commitTransaction(em);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JpaManager.closeEntityManager(em);
        }
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
