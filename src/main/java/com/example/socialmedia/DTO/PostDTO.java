package com.example.socialmedia.DTO;

import com.example.socialmedia.entity.PostImage;
import com.example.socialmedia.entity.User;

import java.util.Date;
import java.util.List;

public class PostDTO {
    private Long id;

    private String content;

    private String createAt;

    private int numberOfLikes;

    private int numberOfComments;

    private List<PostImage> postImages;

    private User user;

    private boolean isLiked;

    public PostDTO(Long id, String content, String createAt, int numberOfLikes, int numberOfComments, List<PostImage> postImages, User user, boolean isLiked) {
        this.id = id;
        this.content = content;
        this.createAt = createAt;
        this.numberOfLikes = numberOfLikes;
        this.numberOfComments = numberOfComments;
        this.postImages = postImages;
        this.user = user;
        this.isLiked = isLiked;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }

    public int getNumberOfLikes() {
        return numberOfLikes;
    }

    public void setNumberOfLikes(int numberOfLikes) {
        this.numberOfLikes = numberOfLikes;
    }

    public int getNumberOfComments() {
        return numberOfComments;
    }

    public void setNumberOfComments(int numberOfComments) {
        this.numberOfComments = numberOfComments;
    }

    public List<PostImage> getPostImages() {
        return postImages;
    }

    public void setPostImages(List<PostImage> postImages) {
        this.postImages = postImages;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public boolean isLiked() {
        return isLiked;
    }

    public void setLiked(boolean liked) {
        isLiked = liked;
    }

    @Override
    public String toString() {
        return "PostDTO{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", createAt='" + createAt + '\'' +
                ", numberOfLikes=" + numberOfLikes +
                ", numberOfComments=" + numberOfComments +
                ", postImages=" + postImages +
                ", user=" + user +
                ", isLiked=" + isLiked +
                '}';
    }
}
