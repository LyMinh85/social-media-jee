package com.example.socialmedia.entity;

import jakarta.persistence.*;

import java.util.Date;

@Entity
@Table(name = "image")
public class Image {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "image_id")
    private Long id;

    @Column(name = "public_id", nullable = true, length = 200)
    private String publicId;

    @Column(name = "url", nullable = false, length = 300)
    private String url;

    @Column(name = "upload_on", nullable = true)
    private Date uploadOn;

    @PrePersist
    protected void onCreate() {
        uploadOn = new Date();
    }

    public Image() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPublicId() {
        return publicId;
    }

    public void setPublicId(String publicId) {
        this.publicId = publicId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Date getUploadOn() {
        return uploadOn;
    }

    public void setUploadOn(Date uploadOn) {
        this.uploadOn = uploadOn;
    }
}
