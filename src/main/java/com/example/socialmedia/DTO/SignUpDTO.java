package com.example.socialmedia.DTO;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;

public class SignUpDTO {
    @NotEmpty(message = "Vui lòng điền tên người dùng !")
    private String username;

    @NotEmpty(message = "Vui lòng điền email !")
    private String email;

    @Pattern(
            regexp = "^(?=.*[a-z])(?=.*[A-Z]).{8,}$",
            message = "Mật khẩu phải có tối thiểu 8 ký tự, bao gồm ít nhất 1 chữ viết thường, 1 chữ viết hoa và 1 chữ số !"
    )
    @NotEmpty(message = "Vui lòng điền mật khẩu !")
    private String password;

    @NotEmpty(message = "Vui lòng chn giới tính !")
    private String gender;

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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
}
