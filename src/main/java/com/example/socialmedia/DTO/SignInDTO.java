package com.example.socialmedia.DTO;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;

public class SignInDTO {

    @Email(message = "Email không hợp lệ. Vui lòng điền đúng email !")
    @NotEmpty(message = "Vui lòng điền email !")
    private String email;

    @NotEmpty(message = "Vui lòng điền mật khẩu !")
    private String password;

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
}