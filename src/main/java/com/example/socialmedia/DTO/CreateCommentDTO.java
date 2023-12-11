package com.example.socialmedia.DTO;

import com.google.protobuf.Message;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Positive;

import java.util.Date;

public class CreateCommentDTO {
    private Long userId;

    @Positive(message = "Không có id bài đăng bình luận")
    private Long postId;

    @NotEmpty(message = "Bình luận không được để trống")
    private String content;

    private Long parentCommentId;

    public CreateCommentDTO() {
    }

    public CreateCommentDTO(Long userId, Long postId, String content) {
        this.userId = userId;
        this.postId = postId;
        this.content = content;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getPostId() {
        return postId;
    }

    public void setPostId(Long postId) {
        this.postId = postId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
