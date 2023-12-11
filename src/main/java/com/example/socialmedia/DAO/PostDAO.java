package com.example.socialmedia.DAO;

import com.example.socialmedia.DTO.LikePostDTO;
import com.example.socialmedia.DTO.PostDTO;
import com.example.socialmedia.entity.JpaManager;
import com.example.socialmedia.entity.Like;
import com.example.socialmedia.entity.Post;
import com.example.socialmedia.entity.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import javax.swing.text.html.parser.Entity;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class PostDAO {
    private PostDTO convertToPostDTO(Post post, boolean isLiked) {
        return new PostDTO(post.getId(), post.getContent(), post.getCreateAt(), post.getNumberOfLikes(), post.getNumberOfComments(), post.getPostImages(), post.getUser(), isLiked);
    }

    public boolean createPost(Post post) throws Exception {
        EntityManager em = JpaManager.getEntityManager();

        try {
            JpaManager.beginTransaction(em);
            System.out.println(post);
            em.persist(post);
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

    public List<PostDTO> findAll() {
        EntityManager em = JpaManager.getEntityManager();

        List<PostDTO> posts = new ArrayList<>();
        try {
            JpaManager.beginTransaction(em);
            String queryString = """
                        SELECT p from Post p
                        order by p.id DESC
                    """;
            TypedQuery<Post> query = em.createQuery(queryString, Post.class);
            List<Post> objects = query.getResultList();

            for (Post post : objects) {
                posts.add(convertToPostDTO(post, false));
            }

            JpaManager.commitTransaction(em);
            JpaManager.closeEntityManager(em);
        } catch (Exception e) {
            JpaManager.rollbackTransaction(em);
            JpaManager.closeEntityManager(em);
        }
        JpaManager.closeEntityManager(em);
        return posts;
    }

    public List<PostDTO> findAll(User user) {
        EntityManager em = JpaManager.getEntityManager();

        List<PostDTO> posts = new ArrayList<>();
        try {
            JpaManager.beginTransaction(em);
            String queryString = """
                        SELECT p, CASE WHEN COUNT(l) > 0 THEN true ELSE false END
                        FROM Post p
                        LEFT JOIN Like l ON p.id = l.post.id AND l.user.id = :userId
                        GROUP BY p
                        order by p.id DESC
                    """;
            TypedQuery<Object[]> query = em.createQuery(queryString, Object[].class);
            query.setParameter("userId", user.getId());
            JpaManager.commitTransaction(em);
            List<Object[]> result = query.getResultList();

            for (Object[] row : result) {
                Post post = (Post) row[0];
                boolean likedByCurrentLoginedUser = (Boolean) row[1];

                PostDTO postDTO = convertToPostDTO(post, likedByCurrentLoginedUser);
                posts.add(postDTO);
            }

            JpaManager.closeEntityManager(em);
        } catch (Exception e) {
            JpaManager.rollbackTransaction(em);
            JpaManager.closeEntityManager(em);
        }
        JpaManager.closeEntityManager(em);
        return posts;
    }

    public List<PostDTO> findByUserId(Long userId) {
        EntityManager em = JpaManager.getEntityManager();

        List<PostDTO> postDTOS = new ArrayList<>();
        try {
            JpaManager.beginTransaction(em);

            String queryString = """
                        SELECT p
                        FROM Post p
                        where p.user.id = :userId
                        GROUP BY p
                        order by p.id DESC
                    """;

            TypedQuery<Post> query = em.createQuery(queryString, Post.class);
            query.setParameter("userId", userId);
            List<Post> posts = query.getResultList();

            posts.forEach(post -> {
                postDTOS.add(convertToPostDTO(post, false));
            });


            JpaManager.commitTransaction(em);
            JpaManager.closeEntityManager(em);
        } catch (Exception e) {
            JpaManager.rollbackTransaction(em);
            JpaManager.closeEntityManager(em);
        }
        JpaManager.closeEntityManager(em);
        return postDTOS;
    }


    public List<PostDTO> findByUserId(Long userId, User loggedUser) {
        EntityManager em = JpaManager.getEntityManager();

        List<PostDTO> posts = new ArrayList<>();
        try {
            JpaManager.beginTransaction(em);

            String queryString = """
                        SELECT p, CASE WHEN COUNT(l) > 0 THEN true ELSE false END
                        FROM Post p
                        LEFT JOIN Like l ON p.id = l.post.id AND l.user.id = :loggedUserId
                        where p.user.id = :userId
                        GROUP BY p
                        order by p.id DESC
                    """;

            TypedQuery<Object[]> query = em.createQuery(queryString, Object[].class);
            query.setParameter("userId", userId);
            query.setParameter("loggedUserId", loggedUser);
            List<Object[]> result = query.getResultList();

            for (Object[] row : result) {
                Post post = (Post) row[0];
                boolean likedByCurrentLoginedUser = (Boolean) row[1];

                PostDTO postDTO = convertToPostDTO(post, likedByCurrentLoginedUser);
                posts.add(postDTO);
            }
            JpaManager.commitTransaction(em);
            JpaManager.closeEntityManager(em);
        } catch (Exception e) {
            JpaManager.rollbackTransaction(em);
            JpaManager.closeEntityManager(em);
        }
        JpaManager.closeEntityManager(em);
        return posts;
    }

    public PostDTO findByPostId(Long postId) {
        EntityManager em = JpaManager.getEntityManager();

        PostDTO postDTO = null;
        try {
            JpaManager.beginTransaction(em);
            String queryString = "SELECT p from Post p where p.id = :postId ";
            TypedQuery<Post> query = em.createQuery(queryString, Post.class);
            query.setParameter("postId", postId);
            Post post = query.getSingleResult();
            postDTO = convertToPostDTO(post, false);
            JpaManager.commitTransaction(em);
            JpaManager.closeEntityManager(em);
        } catch (Exception e) {
            e.printStackTrace();
            JpaManager.rollbackTransaction(em);
            JpaManager.closeEntityManager(em);
        }
        JpaManager.closeEntityManager(em);
        return postDTO;
    }

    public PostDTO findByPostId(Long postId, User loggedUser) {
        EntityManager em = JpaManager.getEntityManager();

        PostDTO postDTO = null;
        try {
            JpaManager.beginTransaction(em);
            String queryString = """
                                SELECT p, CASE WHEN COUNT(l) > 0 THEN true ELSE false END
                                FROM Post p
                                LEFT JOIN Like l ON p.id = l.post.id AND l.user.id = :userId
                                where p.id = :postId
                                GROUP BY p
                                order by p.id DESC
                    """;
            TypedQuery<Object[]> query = em.createQuery(queryString, Object[].class);
            query.setParameter("postId", postId);
            query.setParameter("userId", loggedUser.getId());
            Object[] row = query.getSingleResult();
            Post post = (Post) row[0];
            boolean likedByCurrentLoginedUser = (Boolean) row[1];
            postDTO = convertToPostDTO(post, likedByCurrentLoginedUser);
            JpaManager.commitTransaction(em);
            JpaManager.closeEntityManager(em);
        } catch (Exception e) {
            JpaManager.rollbackTransaction(em);
            JpaManager.closeEntityManager(em);
        }
        JpaManager.closeEntityManager(em);
        return postDTO;
    }

    public boolean isLiked(User user, Long postId) {
        EntityManager em = JpaManager.getEntityManager();

        boolean isLiked = false;
        try {
            JpaManager.beginTransaction(em);
            String queryString = "select l from Like l where l.user.id = :userId and l.post.id = :postId";
            TypedQuery<Like> query = em.createQuery(queryString, Like.class);
            query.setParameter("userId", user.getId());
            query.setParameter("postId", postId);
            Like liked = query.getSingleResult();

            if (liked != null) {
                isLiked = true;
            }
            JpaManager.commitTransaction(em);
            JpaManager.closeEntityManager(em);
        } catch (Exception e) {
            JpaManager.closeEntityManager(em);
        }
        JpaManager.closeEntityManager(em);
        return isLiked;
    }

    public LikePostDTO likePost(User user, Long postId) {
        EntityManager em = JpaManager.getEntityManager();

        LikePostDTO likePostDTO = null;
        try {
            JpaManager.beginTransaction(em);
            Post post = em.find(Post.class, postId);
            Like like = new Like();
            like.setUser(user);
            like.setPost(post);
            em.persist(like);

            post.setNumberOfLikes(post.getNumberOfLikes() + 1);
            em.merge(post);
            likePostDTO = new LikePostDTO();
            likePostDTO.setLike(true);
            likePostDTO.setNumberOfLikes(post.getNumberOfLikes());
            JpaManager.commitTransaction(em);
            JpaManager.closeEntityManager(em);
        } catch (Exception e) {
            JpaManager.rollbackTransaction(em);
            JpaManager.closeEntityManager(em);
        }
        JpaManager.closeEntityManager(em);
        return likePostDTO;
    }

    public LikePostDTO unlikePost(User user, Long postId) {
        EntityManager em = JpaManager.getEntityManager();

        LikePostDTO likePostDTO = new LikePostDTO();
        try {
            JpaManager.beginTransaction(em);
            String queryString = "select l from Like l where l.user.id = :userId and l.post.id = :postId";
            TypedQuery<Like> query = em.createQuery(queryString, Like.class);
            query.setParameter("userId", user.getId());
            query.setParameter("postId", postId);
            Like liked = query.getSingleResult();

            if (liked != null) {
                em.remove(liked);
                Post post = em.find(Post.class, postId);
                post.setNumberOfLikes(post.getNumberOfLikes() - 1);
                em.merge(post);
                likePostDTO.setLike(false);
                likePostDTO.setNumberOfLikes(post.getNumberOfLikes());
            }
            JpaManager.commitTransaction(em);
            JpaManager.closeEntityManager(em);
        } catch (Exception e) {
            JpaManager.closeEntityManager(em);
        }
        JpaManager.closeEntityManager(em);
        return likePostDTO;
    }
}
