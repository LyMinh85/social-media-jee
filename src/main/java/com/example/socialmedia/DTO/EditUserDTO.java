package com.example.socialmedia.DTO;

import com.example.socialmedia.entity.AvatarImage;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;

public class EditUserDTO {
    @NotEmpty(message = "Tên hiển thị không được để trống")
    private String username;

    @NotEmpty(message = "Email không được để trống")
    @Email(message = "Không đúng định dạng email")
    private String email;

    private String bio;

    private AvatarImage avatarImage;

    public AvatarImage getAvatarImage() {
        return avatarImage;
    }

    public void setAvatarImage(AvatarImage avatarImage) {
        this.avatarImage = avatarImage;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }
}
