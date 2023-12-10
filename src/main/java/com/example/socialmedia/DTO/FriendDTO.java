package com.example.socialmedia.DTO;

import com.example.socialmedia.entity.AvatarImage;
import com.example.socialmedia.entity.FriendshipStatus;
import com.example.socialmedia.entity.User;

public class FriendDTO {
    private Long id;
    private String username;
    private AvatarImage avatarImage;
    private FriendshipStatus friendshipStatus;

    public FriendDTO(Long id, String username, AvatarImage avatarImage, FriendshipStatus friendshipStatus) {
        this.id = id;
        this.username = username;
        this.avatarImage = avatarImage;
        this.friendshipStatus = friendshipStatus;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public AvatarImage getAvatarImage() {
        return avatarImage;
    }

    public void setAvatarImage(AvatarImage avatarImage) {
        this.avatarImage = avatarImage;
    }

    public FriendshipStatus getFriendshipStatus() {
        return friendshipStatus;
    }

    public void setFriendshipStatus(FriendshipStatus friendshipStatus) {
        this.friendshipStatus = friendshipStatus;
    }
}
