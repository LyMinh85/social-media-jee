package com.example.socialmedia.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "avatar_image")
public class AvatarImage {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "avatar_image_id")
    private Long avatarImageId;

    @OneToOne
    @JoinColumn(name = "avatar_image_id")
    private Image image;

    public Long getAvatarImageId() {
        return avatarImageId;
    }

    public void setAvatarImageId(Long avatarImageId) {
        this.avatarImageId = avatarImageId;
    }

    public Image getImage() {
        return image;
    }

    public void setImage(Image image) {
        this.image = image;
    }
}
