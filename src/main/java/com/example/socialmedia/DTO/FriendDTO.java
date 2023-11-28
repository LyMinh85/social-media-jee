package com.example.socialmedia.DTO;

import com.example.socialmedia.entity.FriendshipStatus;

public class FriendDTO {
    private Long id;
    private String username;
    private FriendshipStatus friendshipStatus;

    public FriendDTO(Long id, String username, FriendshipStatus friendshipStatus) {
        this.id = id;
        this.username = username;
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

    public FriendshipStatus getFriendshipStatus() {
        return friendshipStatus;
    }

    public void setFriendshipStatus(FriendshipStatus friendshipStatus) {
        this.friendshipStatus = friendshipStatus;
    }
}
