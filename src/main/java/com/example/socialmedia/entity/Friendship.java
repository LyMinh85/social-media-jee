package com.example.socialmedia.entity;

import jakarta.persistence.*;

import java.util.Date;

@Entity
@Table(name = "friendship")
public class Friendship {
    @EmbeddedId
    FriendshipKey id;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    @MapsId("user1Id")
    @JoinColumn(name = "user1_id")
    User user1; // Người gửi yêu cầu

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    @MapsId("user2Id")
    @JoinColumn(name = "user2_id")
    User user2; // Người nhận yêu cầu

    @Enumerated(EnumType.STRING)
    @Column(name = "status", nullable = false)
    FriendshipStatus status;

    @Column(name = "create_at", nullable = false)
    Date createAt;

    @PrePersist
    protected void onCreate() {
        createAt = new Date();
    }

    public FriendshipKey getId() {
        return id;
    }

    public void setId(FriendshipKey id) {
        this.id = id;
    }

    public User getUser1() {
        return user1;
    }

    public void setUser1(User user1) {
        this.user1 = user1;
    }

    public User getUser2() {
        return user2;
    }

    public void setUser2(User user2) {
        this.user2 = user2;
    }

    public FriendshipStatus getStatus() {
        return status;
    }

    public void setStatus(FriendshipStatus status) {
        this.status = status;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }
}
