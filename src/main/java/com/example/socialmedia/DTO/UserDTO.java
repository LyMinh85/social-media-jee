package com.example.socialmedia.DTO;

import com.example.socialmedia.entity.AvatarImage;
import com.example.socialmedia.entity.Friendship;
import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;

import java.util.Date;
import java.util.List;

public class UserDTO {
    private Long id;

    @NotEmpty(message = "Tên hiển thị không được để trống")
    private String username;

    @NotEmpty(message = "Email không được để trống")
    @Email(message = "Không đúng định dạng email")
    private String email;

    @NotEmpty(message = "Password không được để trống")
    @Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,}$", message = "Tối thiểu 8 ký tự, bao gồm số, chữ thường và chữ in hoa")
    private String password;

    private String bio;

    @NotEmpty(message = "Hãy chọn giới tính")
    private String gender;

    private Date createAt;

    public UserDTO() {
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", bio='" + bio + '\'' +
                ", gender='" + gender + '\'' +
                ", createAt=" + createAt +
                '}';
    }
}
