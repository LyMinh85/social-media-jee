package com.example.socialmedia.DTO;

public class LikePostDTO {
    private boolean isLike;
    private int numberOfLikes;

    public LikePostDTO() {
    }

    public LikePostDTO(boolean isLike, int numberOfLikes) {
        this.isLike = isLike;
        this.numberOfLikes = numberOfLikes;
    }

    public boolean isLike() {
        return isLike;
    }

    public void setLike(boolean like) {
        isLike = like;
    }

    public int getNumberOfLikes() {
        return numberOfLikes;
    }

    public void setNumberOfLikes(int numberOfLikes) {
        this.numberOfLikes = numberOfLikes;
    }
}
