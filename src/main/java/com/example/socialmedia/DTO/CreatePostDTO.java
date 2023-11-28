package com.example.socialmedia.DTO;

import jakarta.validation.constraints.NotEmpty;

import java.util.Date;

public class CreatePostDTO {
    private Long id;

    @NotEmpty(message = "Chưa có nội dung bài viết!!!")
    private String content;

    private Date createAt;

    public CreatePostDTO() {
    }

    public CreatePostDTO(Long id, String content, Date createAt) {
        this.id = id;
        this.content = content;
        this.createAt = createAt;
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

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    @Override
    public String toString() {
        return "CreatePostDTO{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", createAt=" + createAt +
                '}';
    }
}
