package com.example.socialmedia.DTO;

import com.example.socialmedia.entity.AvatarImage;

public class UserDTO {
    private Long id;
    private String username;
    private AvatarImage avatarImage;



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

    public UserDTO() {
    }

    public UserDTO(Long id, String username) {
        this.id = id;
        this.username = username;
    }

    public UserDTO(Long id, String username, AvatarImage avatarImage) {
        this.id = id;
        this.username = username;
        this.avatarImage = avatarImage;
    }
}
