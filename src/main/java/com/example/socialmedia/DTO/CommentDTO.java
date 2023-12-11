package com.example.socialmedia.DTO;

import com.example.socialmedia.helper.RelativeTime;

import java.util.Date;

public class CommentDTO {
    private Long id;
    private String content;
    public Date createAt;
    private UserDTO userDTO;
    private String relativeTime;


    public String getRelativeTime() {
        return relativeTime;
    }

    public void setRelativeTime(String relativeTime) {
        this.relativeTime = relativeTime;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public UserDTO getUserDTO() {
        return userDTO;
    }

    public void setUserDTO(UserDTO userDTO) {
        this.userDTO = userDTO;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreateAt() {
        return RelativeTime.from(this.createAt);
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }
}
