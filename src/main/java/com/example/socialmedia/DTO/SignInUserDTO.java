package com.example.socialmedia.DTO;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;

public class SignInUserDTO {
    @NotEmpty(message = "Email không được để trống")
    @Email(message = "Không đúng định dạng email")
    private String email;

    @NotEmpty(message = "Password không được để trống")
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
